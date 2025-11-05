# Sprint 1 - FTD Pack Build (14-Day Launch)

**Sprint Duration:** 2025-11-05 to 2025-11-18 (14 days)
**Sprint Goal:** Build complete FTD pack, deliver to first 3 customers, convert 1-2 to retainer
**Status:** Planning

---

## Sprint Goal

Build and deliver a production-ready 48-hour M365 new-hire onboarding automation to our first 3 customers. Convert at least 1 customer to monthly retainer. Establish KPI baseline and publish first case study.

This sprint combines technical build (Days 1-7) with go-to-market execution (Days 1-14). Success means we have paying customers and validated proof of concept by Day 14.

---

## Sprint Capacity

**Available Days:** 14 days (Nov 5 - Nov 18)
**Capacity:** Solo founder, full-time (~80 hours build + 40 hours GTM)
**Commitments/Time Off:** None
**Work Split:** 60% build, 25% outreach/sales, 15% docs/admin

---

## Sprint Backlog

### High Priority (Must Complete - Days 1-7: Build)

| Story | Description | Estimate | Status | Notes |
|-------|-------------|----------|--------|-------|
| BUILD-001 | Scaffold Azure Functions app with Graph/MSAL auth | L | 📋 Todo | PR 1: provision + rollback endpoints, Jest tests |
| BUILD-002 | SharePoint list provisioning (idempotent) | M | 📋 Todo | PR 2: PowerShell script, -WhatIf support, logging |
| BUILD-003 | Teams onboarding template apply script | M | 📋 Todo | PR 3: Create team with channels/tabs, return siteId |
| BUILD-004 | Power Automate flow export + import docs | M | 📋 Todo | PR 4: Flow triggers on SP item, calls provision API |
| BUILD-005 | Implement Graph API calls (user/license/groups) | L | 📋 Todo | PR 5: Real Graph calls, structured logging, correlationId |
| BUILD-006 | Runbook + rollback docs + FTD pack assembly | M | 📋 Todo | PR 6: Package /dist/ftd-pack.zip with all artifacts |
| BUILD-007 | KPI SQL queries + case study automation | S | 📋 Todo | PR 7: Extract metrics from logs, auto-fill case study |

**Build Estimate:** ~40 hours total across 7 PRs

### High Priority (Must Complete - Days 1-14: Go-to-Market)

| Story | Description | Estimate | Status | Notes |
|-------|-------------|----------|--------|-------|
| GTM-001 | Build 150-lead list (M365 + hiring signals) | S | 📋 Todo | Day 1-2: Filter by 50-250 staff, 8+ open roles |
| GTM-002 | Record 10 Loom audit videos | M | 📋 Todo | Day 3: Tailored examples showing onboarding gaps |
| GTM-003 | Send 50 audits, book 5 discovery calls | M | 📋 Todo | Day 4-5: Personalized outreach, schedule demos |
| GTM-004 | Deliver 3 FTD installs (sandbox tenants) | L | 📋 Todo | Day 6-7: Deploy to first 3 customers, 48-hour SLA |
| GTM-005 | Establish KPI baseline for customers | S | 📋 Todo | Day 8: Document time-to-productive, manual steps, errors |
| GTM-006 | Convert 1-2 customers to retainer | M | 📋 Todo | Day 8: Present retainer offer with roadmap |
| GTM-007 | Deliver first 2 retainer workflows | L | 📋 Todo | Day 9-12: Ship additional workflows for retainer clients |
| GTM-008 | Publish 1-page case study | S | 📋 Todo | Day 13: Metrics + GIF, proof of value |
| GTM-009 | Send case study to 100 leads | S | 📋 Todo | Day 14: Distribute validated proof to pipeline |

**GTM Estimate:** ~40 hours total across outreach, delivery, case study

### Medium Priority (Should Complete)

| Story | Description | Estimate | Status | Notes |
|-------|-------------|----------|--------|-------|
| DOCS-001 | SOW template finalization | XS | 📋 Todo | Use template from project-brief/delivery/ |
| DOCS-002 | DPIA (data privacy) template review | XS | 📋 Todo | Ensure compliance documentation ready |
| DOCS-003 | Pricing calculator (FTD + retainer tiers) | XS | 📋 Todo | Simple spreadsheet for proposals |
| INFRA-001 | Azure sandbox tenant setup | S | 📋 Todo | Provision test tenant for development |
| INFRA-002 | App Insights setup for monitoring | XS | 📋 Todo | Logging and telemetry for production |

### Low Priority (Nice to Have)

| Story | Description | Estimate | Status | Notes |
|-------|-------------|----------|--------|-------|
| AUTO-001 | Email template library | XS | 📋 Todo | Follow-up sequences for pipeline |
| AUTO-002 | Lead scoring model | XS | 📋 Todo | Prioritize best-fit prospects |
| DOCS-004 | Video walkthrough of FTD install | S | 📋 Todo | Demo artifact for marketing |

**Story Status Legend:**
- 📋 Todo
- 🏗️ In Progress
- 👀 In Review
- ✅ Done
- ❌ Blocked

**Estimate Legend:**
- XS = 1-2 hours
- S = 3-4 hours
- M = 5-8 hours
- L = 10-16 hours

---

## Technical Debt / Maintenance

Items to address if time permits:

- [ ] Set up CI/CD for Azure Functions deployment
- [ ] Add unit tests for Graph client error handling
- [ ] Create deployment checklist to reduce manual steps
- [ ] Document Graph API permission matrix
- [ ] Add logging for rollback operations

---

## Daily Progress

### Day 1 (Nov 5) - Tuesday
**What I worked on:**
- Initial planning and roadmap creation
- Sprint backlog definition
- Project setup

**Blockers:**
- None

**Plan for tomorrow:**
- Start BUILD-001 (Azure Functions scaffold)
- Begin GTM-001 (150-lead list)

---

### Day 2 (Nov 6) - Wednesday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 3 (Nov 7) - Thursday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 4 (Nov 8) - Friday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 5 (Nov 11) - Monday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 6 (Nov 12) - Tuesday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 7 (Nov 13) - Wednesday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 8 (Nov 14) - Thursday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 9 (Nov 15) - Friday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 10 (Nov 18) - Monday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 11 (Nov 19) - Tuesday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 12 (Nov 20) - Wednesday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 13 (Nov 21) - Thursday
**What I worked on:**
-

**Blockers:**
-

**Plan for tomorrow:**
-

---

### Day 14 (Nov 22) - Friday
**What I worked on:**
-

**Blockers:**
-

**Plan for next sprint:**
-

---

## Scope Changes

Document any stories added or removed during the sprint:

| Date | Change | Reason |
|------|--------|--------|
| 2025-11-05 | Initial backlog created | Sprint planning |

---

## Sprint Metrics

### Planned vs Actual
- **Planned (Build):** 40 hours / 7 PRs
- **Planned (GTM):** 40 hours / 9 stories
- **Planned (Total):** 80 hours / 16 high-priority stories
- **Completed:** TBD
- **Completion Rate:** TBD

### Key Success Criteria
- [ ] All 7 PRs merged (BUILD-001 through BUILD-007)
- [ ] FTD pack assembled in `/dist/ftd-pack.zip`
- [ ] 3 FTD deliveries completed (GTM-004)
- [ ] 1-2 retainer conversions (GTM-006)
- [ ] Case study published (GTM-008)
- [ ] 150-lead pipeline built (GTM-001)

### Revenue Goals
- **FTD Revenue:** 3 × $650 (avg) = $1,950
- **Retainer Revenue:** 2 × $2,250/mo (avg) = $4,500/mo recurring
- **Total Sprint Value:** $1,950 one-time + $4,500/mo recurring

---

## Wins & Learnings

### What Went Well
- (Track throughout sprint)

### What Could Be Improved
- (Track throughout sprint)

### Action Items for Next Sprint
- [ ] (Add as sprint progresses)

---

## Sprint Review Notes

**What We Shipped:**
- (Fill at end of sprint)

**Demo Notes:**
- (Customer feedback from FTD deliveries)

**Feedback Received:**
- (Track customer reactions, feature requests)

---

## Critical Dependencies

### External Dependencies
- **Microsoft 365 Sandbox Tenant:** Required for development and testing
- **Azure Subscription:** For Functions deployment and App Insights
- **Graph API App Registration:** Requires admin consent for permissions
- **Customer Tenants:** Access required for FTD installations (Global Admin or equivalent)

### Knowledge Dependencies
- **Microsoft Graph API:** User.ReadWrite.All, Group.ReadWrite.All, Directory.ReadWrite.All
- **Power Automate:** Flow design, connection configuration
- **SharePoint:** PnP PowerShell, list schema management
- **Azure Functions:** TypeScript, MSAL authentication, HTTP triggers

### Risk Mitigation
- **Permissions blocked:** Document exact permissions needed, test in sandbox first
- **Customer tenant access delayed:** Use sandbox tenant for initial builds, adjust timeline
- **Graph API rate limits:** Implement retry logic, respect throttling
- **Scope creep on FTD:** Stick to defined 48-hour scope, defer custom requests to retainer

---

## Links & References

**Project Documents:**
- Product Roadmap: `product/roadmap/2025-Q1-ai-automation-agency.md`
- CLAUDE_TASKFILE (7-PR sequence): `project-brief/CLAUDE_TASKFILE.md`
- Strategy Doc: `project-brief/docs/01-strategy.md`
- ICP & Signals: `project-brief/docs/02-icp.md`

**Delivery SOPs:**
- SOW Template: `project-brief/delivery/SOW-template.md`
- Runbook Template: `project-brief/delivery/runbook-template.md`
- Rollback Plan: `project-brief/delivery/rollback-plan.md`
- DPIA Template: `project-brief/delivery/DPIA-template.md`

**GTM Materials:**
- Loom Script: `project-brief/docs/gtm/loom-script.md`
- Email Templates: `project-brief/docs/gtm/email-templates.md`
- Case Study Template: `project-brief/docs/gtm/case-study-template.md`
- Outreach Cadence: `project-brief/docs/gtm/outreach-cadence.md`

**Technical Resources:**
- Microsoft Graph API: https://learn.microsoft.com/en-us/graph/
- Azure Functions: https://learn.microsoft.com/en-us/azure/azure-functions/
- PnP PowerShell: https://pnp.github.io/powershell/

---

## Definition of Done (Sprint 1)

**Technical:**
- ✅ All 7 PRs merged to master with passing tests
- ✅ `/dist/ftd-pack.zip` builds successfully
- ✅ End-to-end install test completed in sandbox (≤60 minutes)
- ✅ Runbook validated with fresh tenant install
- ✅ Rollback procedure tested and documented

**Business:**
- ✅ 3 FTD deliveries completed with happy customers
- ✅ 1-2 retainer contracts signed ($1.5k-3k/mo each)
- ✅ KPI baseline established (time-to-productive, manual steps, error rate)
- ✅ 1-page case study published with real metrics
- ✅ 150-lead pipeline built and qualified

**Documentation:**
- ✅ All READMEs updated in affected directories
- ✅ Customer runbooks delivered with each FTD
- ✅ Case study published to website/LinkedIn
- ✅ Lessons learned documented for next sprint

---

## Next Sprint Preview (Sprint 2)

**Focus:** Scale delivery and optimize process

**Tentative Goals:**
- Deliver 5 more FTDs (total: 8)
- Build delivery automation (reduce manual steps)
- Add monitoring + alerting (App Insights dashboards)
- Create second workflow template (offboarding)
- Grow pipeline to 300 qualified leads
- Publish 2 more case studies
