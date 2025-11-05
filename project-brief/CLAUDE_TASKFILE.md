# CLAUDE_TASKFILE.md
**Single source of truth for standing up the M365 New‑Hire Automation “FTD Pack.”**  
Place this file at the repo root and tell your assistant: “Follow CLAUDE_TASKFILE.md exactly.”

---

## 0) Objective
Turn the contents of `kits/ai-automation-agency` into a working, demoable **48‑hour Foot‑In‑The‑Door (FTD) install** plus a clean retainer baseline. Ship as small, reviewable PRs in the order below. All steps are for a **Windows + PowerShell** environment, sandbox tenant only.

## 1) Ground rules (must obey)
- Never commit secrets. Use `.env` locally and commit only `.env.example`.
- Use **Managed Identity** in cloud; local dev may use a confidential app for Graph.
- Keep PRs focused; ≤300 lines diff when possible.
- Every PR includes: README changes, comments in code, and a short test or dry‑run proof.
- Use **correlationId** for every run; log to App Insights (or console in local).

## 2) Required repo structure (create as needed)
```
/apps/azfunc-provision      # Azure Functions app (TypeScript)
/flows/newhire              # Power Automate flow export + docs
/infra/sharepoint           # SP list provisioning
/infra/teams                # Teams template apply script
/docs                       # Runbook, rollback, SOW, DPIA (link to kit docs)
/ops                        # KPI SQL, pricing/capacity models (from kit)
/kits/ai-automation-agency  # unpacked kit (do not edit; reference only)
```

## 3) Environment and config
Create `.env.example` in `/apps/azfunc-provision`:
```env
GRAPH_TENANT_ID=
GRAPH_CLIENT_ID=
GRAPH_CLIENT_SECRET=
APPINSIGHTS_CONNECTION_STRING=
AZURE_SUBSCRIPTION_ID=
FTD_FROM_ADDRESS=noreply@example.com
FTD_DOMAIN=example.com
```

`.gitignore` root additions:
```
.env
apps/azfunc-provision/local.settings.json
dist/
```
Install toolchain assumptions: Node 20+, Azure Functions Core Tools v4, Azure CLI, PowerShell 7, PnP.PowerShell, MSAL.

## 4) Acceptance criteria (global)
- `npm test` green in `/apps/azfunc-provision`.
- SharePoint provisioning script is **idempotent** (`-WhatIf` shows no changes on second run).
- Teams template script returns a new **siteId** and logs output.
- Flow **imports** without broken connections and completes a **dry‑run** with sample payload.
- `/dist/ftd-pack.zip` contains: flow export, Teams template, SP script, function deploy guide, runbook PDF.
- One-page **case study** stub produced with placeholders populated.

---

# PR SEQUENCE

## PR 1 — Scaffold Azure Functions app
**Title:** chore(func): scaffold Azure Functions app with Graph/MSAL, envs, tests

**Create:**
- `/apps/azfunc-provision/src/index.ts` with two HTTP functions: `provision` and `rollback`.
- MSAL auth and Graph client wiring.
- App Insights logging.
- Jest setup and one unit test for payload validation.
- `/apps/azfunc-provision/README.md` with local run instructions.

**Implementation outline (TypeScript):**
```ts
// src/index.ts (outline)
import { app } from "@azure/functions";
import { Client } from "@microsoft/microsoft-graph-client";
import { randomUUID } from "crypto";

function graphClient(token: string){ /* init */ }

app.http("provision", { methods: ["POST"], authLevel: "function",
  handler: async (req, ctx) => {
    const correlationId = randomUUID();
    const p = await req.json();
    // validate required fields
    // get Graph token (local: confidential client; cloud: managed identity)
    // create user UPN `${first}.${last}@${process.env.FTD_DOMAIN}`
    // assign license; add to groups (role/department table to be added later)
    // return upn + correlationId
    return { jsonBody: { upn: "tbd", correlationId } };
}});

app.http("rollback", { methods: ["POST"], authLevel: "function",
  handler: async (req, ctx) => {
    const { upn, groups, siteId, correlationId } = await req.json();
    // disable user; remove license; drop groups; delete site (best-effort)
    return { jsonBody: { rolledBack: true, correlationId } };
}});
```
**README must include:**
```
cd apps/azfunc-provision
copy .env.example .env  # fill values
npm i
npm run build
npm start  # func start
```

**Done when:** tests pass; function starts locally and responds to a POST with a fake token path (no real Graph calls yet).

---

## PR 2 — SharePoint list provisioning (idempotent)
**Title:** feat(sp): provision SharePoint "New‑Hire Requests" list from JSON schema

**Create:**
- `/infra/sharepoint/provision-sharepoint.ps1`
- `/infra/sharepoint/README.md`

**Behavior:**
- Reads `automation/sharepoint-list-schema.json` from the kit or a copy in repo.
- Creates/updates the list and fields.
- Supports `-WhatIf` and `-Verbose`. Writes operations to `infra/sharepoint/provision.log`.
- Exits non‑zero on drift that cannot be reconciled.

**Usage example (README):**
```powershell
# Connect (sandbox)
Connect-PnPOnline -Url https://<tenant>.sharepoint.com/sites/HR -Interactive
.\provision-sharepoint.ps1 -SiteUrl https://<tenant>.sharepoint.com/sites/HR -ListName "New-Hire Requests" -WhatIf
.\provision-sharepoint.ps1 -SiteUrl ... -ListName "New-Hire Requests"
```

**Done when:** running twice shows no changes on the second run.

---

## PR 3 — Teams onboarding template apply
**Title:** feat(teams): apply Teams onboarding template and return siteId

**Create:**
- `/infra/teams/apply-teams-template.ps1`
- `/infra/teams/README.md`

**Behavior:**
- Reads `automation/teams-template.json`.
- Creates a team named `Onboarding - {yyyyMMdd-HHmm}` with channels/tabs from template.
- Outputs `siteId` to console and writes to `infra/teams/last-site.json`.
- Flags: `-DryRun`, `-Verbose`.

**Usage:**
```powershell
.\apply-teams-template.ps1 -DisplayNamePrefix "Onboarding" -Verbose
```

**Done when:** script returns a valid site/team id and logs it.

---

## PR 4 — Power Automate flow export + docs
**Title:** feat(flow): new-hire flow export and import guide

**Create:**
- `/flows/newhire/definition.json` (complete flow JSON or export)
- `/flows/newhire/README.md` with import screenshots placeholders
- The flow must:
  1. Trigger on `New-Hire Requests` item created.
  2. Compose payload with correlationId.
  3. HTTP POST to the `provision` endpoint.
  4. Post a Teams message in the created onboarding team or backup channel.
  5. Append a run log row to a SharePoint “Runs” list (create if missing).

**Done when:** flow imports in target environment and runs a dry‑run using sample payload.

---

## PR 5 — Implement Graph calls + logging
**Title:** feat(func): implement Graph user create, license, groups; add rollback

**Changes:**
- Implement real Graph calls with proper scopes.
- Add structured logging with correlationId to App Insights.
- Map role/department to groups via a config JSON.

**Graph application permissions (document in README):**
- `User.ReadWrite.All`, `Group.ReadWrite.All`, `Directory.ReadWrite.All`, `Team.Create`

**Done when:** test run creates a demo user and assigns a license in sandbox; rollback disables and cleans up.

---

## PR 6 — Runbook, rollback, packaging the FTD
**Title:** docs(runbook): assemble runbook + rollback; package FTD pack

**Create/Update:**
- `/docs/runbook.md` with exact commands and screenshots placeholders.
- `/docs/rollback.md` with tested steps.
- `/dist/ftd-pack.zip` containing:
  - Flow export
  - Teams template JSON
  - SP provisioning script
  - Function deploy guide
  - Runbook PDF/MD

**Done when:** the zip unpacks and can be installed end‑to‑end in a fresh sandbox.

---

## PR 7 — KPI extraction + case study stub
**Title:** feat(ops): KPI SQL + case study template auto-fill

**Create/Update:**
- Add `/ops/kpi-dashboard.sql` (from kit) and a small script to generate a monthly summary from run logs.
- `/docs/case-study.md` with placeholders populated from the latest run: hires/month, minutes saved, error rate.

**Done when:** running the script produces a filled one‑pager draft.

---

# TASKS CLAUDE MUST RUN (in order)

1. Read all files under `kits/ai-automation-agency/**`. Produce a short gap analysis in the PR description for PR 1.
2. Execute PRs 1–3, opening actual pull requests with diffs and READMEs.
3. Pause for review. After approval, execute PR 4 and provide a flow import guide.
4. Pause. Execute PR 5 with guarded Graph actions (feature-flag real Graph calls).
5. Execute PR 6 to produce `/dist/ftd-pack.zip`.
6. Execute PR 7 to generate KPIs and `/docs/case-study.md`.

**At each PR:**
- Add a checklist to the description:
  - [ ] README updated
  - [ ] Dry-run evidence attached (screenshot/log)
  - [ ] Test added or updated
  - [ ] Rollback path documented

---

## Commands Claude may run locally (document but do not commit outputs)
```powershell
# Azure auth (sandbox)
az login
az account set --subscription "<SANDBOX_SUB_ID>"

# Functions local dev
cd apps/azfunc-provision
copy .env.example .env
# fill values
npm i
npm run build
npm test
npm start  # func start
```

---

## Definition of Done (project)
- End-to-end demo completes in a sandbox tenant from a clean repo clone in under **60 minutes**.
- All seven PRs merged with green checks and READMEs.
- `/dist/ftd-pack.zip` installs without modification in a fresh tenant.
- Case study stub generated with numbers from real logs.

---

## Risks & mitigations
- **Secrets leakage:** `.env`, Key Vault; CI scans.
- **License pool empty:** pre-check and alert, halt gracefully.
- **Missing manager:** queue for HR fix; do not proceed.
- **Flow drift:** export versioned; weekly smoke tests.
- **Over-permissioning:** least privilege; review permission matrix in README.

---

## First message to your assistant
> Read `CLAUDE_TASKFILE.md` end to end. Execute **PR 1** exactly as specified. Include a 5‑bullet gap analysis of `kits/ai-automation-agency/**` in the PR description. When PR 1 is up, stop and wait for review.
