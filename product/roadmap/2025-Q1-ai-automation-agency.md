# Product Roadmap - AI Automation Agency (M365 Onboarding)

**Period:** Q1 2025 (14-Day Launch + Growth)
**Owner:** Solo Founder
**Last Updated:** 2025-11-05
**Status:** Active

---

## Vision & Strategy

### Product Vision

Build a productized AI automation agency focused on Microsoft 365 onboarding automation. We install a working new-hire onboarding system in 48 hours that reduces time-to-productive from 5 days to ≤1 day, eliminating 10-20 manual steps per hire. Convert these rapid installations to recurring monthly improvement retainers.

### Strategic Themes for This Period

1. **Rapid Market Entry (Days 1-14):** Build technical FTD pack, execute outreach, land first 3 customers
2. **Proven Delivery System (Weeks 2-4):** Deliver first FTDs, establish KPI baseline, publish case study
3. **Systematic Growth (Weeks 4-12):** Scale outreach cadence, optimize delivery, build pipeline

---

## Roadmap Overview

### Now (Days 1-7: Build Phase)

**Focus:** Build complete FTD pack + initiate outreach

| Feature/Initiative | Status | Target Date | Priority |
|--------------------|--------|-------------|----------|
| Azure Functions provision/rollback | Not Started | Day 3 | P0 |
| SharePoint list provisioning (idempotent) | Not Started | Day 4 | P0 |
| Teams onboarding template | Not Started | Day 4 | P0 |
| Power Automate flow export + docs | Not Started | Day 5 | P0 |
| Graph API integration (user/license/groups) | Not Started | Day 6 | P0 |
| Runbook + rollback docs + FTD pack | Not Started | Day 7 | P0 |
| Build 150-lead list (M365 + hiring signals) | Not Started | Day 2 | P0 |
| Record 10 Loom audit examples | Not Started | Day 3 | P1 |

### Next (Days 8-14: Launch Phase)

**Focus:** First customer deliveries + validation

| Feature/Initiative | Description | Target Date | Priority |
|--------------------|-------------|-------------|----------|
| Deliver 3 FTD installs | Deploy to first 3 customers (sandbox tenants) | Day 7 | P0 |
| Establish KPI baseline | Document time-to-productive, manual steps, errors | Day 8 | P0 |
| Convert 1-2 to retainer | Land first monthly retainer contracts | Day 8 | P0 |
| Deliver first retainer workflows | Ship 2 additional workflows for retainer clients | Day 12 | P0 |
| Publish case study | 1-page case study with metrics + GIF | Day 13 | P0 |
| Send case study to 100 leads | Distribute validated proof to pipeline | Day 14 | P1 |
| KPI SQL queries + reporting | Automated KPI extraction from run logs | Day 7 | P1 |

### Later (Weeks 3-8: Growth Phase)

**Focus:** Scale delivery and optimize process

| Feature/Initiative | Description | Estimated Week | Priority |
|--------------------|-------------|----------------|----------|
| Delivery automation | Self-service install scripts, reduced manual steps | Week 4 | P0 |
| Monitoring + alerting | App Insights dashboards, SLA tracking | Week 5 | P1 |
| Second workflow template | Offboarding automation (upsell opportunity) | Week 6 | P1 |
| HRIS integrations | BambooHR, Rippling, Paylocity connectors | Week 7 | P1 |
| Performance bonus tracking | Automated KPI reporting for bonus tier | Week 8 | P2 |
| Tenant provisioning automation | Reduce sandbox setup time | Week 6 | P2 |

### Future/Backlog (Weeks 9+)

Ideas being considered but not yet scheduled:
- Access review automation (compliance upsell)
- IT ticket automation (expand beyond onboarding)
- Multi-tenant SaaS platform (scale beyond service delivery)
- White-label offering for MSPs
- Mobile app for new hire checklist tracking

---

## Detailed Feature Breakdown

### FTD Pack (48-Hour Install)

**Problem:** Mid-market companies (50-250 employees) struggle with slow, error-prone manual onboarding. HR and IT spend 5+ days per hire on repetitive tasks.

**Solution:** Complete M365 onboarding automation delivered in 48 hours:
- Azure Functions for user provisioning/rollback
- SharePoint list for new-hire requests
- Teams onboarding workspace template
- Power Automate flow orchestrating the process
- Complete runbook + rollback plan

**Impact:**
- Customer: Reduce time-to-productive from 5 days to ≤1 day
- Business: $500-800 revenue per install, converts to $1.5k-3k/mo retainer
- Market positioning: Fastest time-to-value in category

**Effort:** Large (7 PRs, ~40 hours)

**Dependencies:**
- Microsoft 365 sandbox tenant for testing
- Azure subscription for Functions deployment
- Graph API permissions (User.ReadWrite.All, Group.ReadWrite.All, etc.)

**Status:** Not Started

**Related Docs:** `project-brief/CLAUDE_TASKFILE.md` (7-PR sequence)

---

### Lead Generation System

**Problem:** Need validated pipeline of companies matching ICP (50-250 employees, M365, active hiring)

**Solution:**
- Build 150-lead list using hiring signals (8+ open roles on careers page)
- Record 10 Loom audit videos showing tailored examples
- Send 50 audits in first 2 days, book 5 discovery calls

**Impact:**
- Fill pipeline with qualified prospects
- Demonstrate value before asking for commitment
- Warm leads vs cold outreach

**Effort:** Small (16 hours)

**Dependencies:** None

**Status:** Not Started

**Related Docs:** `project-brief/docs/02-icp.md`, `project-brief/docs/gtm/loom-script.md`

---

### Retainer Workflow Library

**Problem:** After FTD install, customers need ongoing improvements to justify $1.5k-3k/mo retainer

**Solution:** Library of pre-built automation workflows:
- Equipment provisioning automation
- Manager notification workflows
- Access review automation
- IT ticket integration
- Offboarding automation

**Impact:**
- Recurring revenue stream ($1.5k-3k/mo per customer)
- Predictable scope for delivery
- Expansion opportunities (3-4 workflows = higher tier pricing)

**Effort:** Medium per workflow (~8 hours each)

**Dependencies:** FTD pack must be delivered first

**Status:** Not Started

---

### KPI Dashboard + Case Study Automation

**Problem:** Need to demonstrate value to justify pricing and win new customers

**Solution:**
- SQL queries extracting KPIs from SharePoint run logs
- Automated reporting: time-to-productive, manual steps eliminated, error rate
- Case study template with auto-filled metrics + screenshots

**Impact:**
- Proof of value for renewals
- Marketing collateral for pipeline
- Performance bonus tier justification

**Effort:** Small (8 hours)

**Dependencies:** At least 1 FTD delivery with real data

**Status:** Not Started

**Related Docs:** `project-brief/docs/gtm/case-study-template.md`

---

## Success Metrics

### Key Results for 14-Day Launch

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| FTD Deliveries | 0 | 3 | 📋 Not Started |
| Retainer Conversions | 0 | 1-2 | 📋 Not Started |
| Pipeline (Qualified Leads) | 0 | 150 | 📋 Not Started |
| Discovery Calls Booked | 0 | 5 | 📋 Not Started |
| Case Studies Published | 0 | 1 | 📋 Not Started |
| Time-to-Productive (days) | Baseline TBD | ≤1 day | 📋 Not Started |
| Manual Steps Eliminated | Baseline TBD | 10-20 per hire | 📋 Not Started |

### Key Results for Q1 2025 (Post-Launch)

| Metric | Week 4 Target | Week 12 Target |
|--------|---------------|----------------|
| Active Retainer Clients | 2 | 5 |
| Monthly Recurring Revenue | $3k | $10k |
| FTD Deliveries (Total) | 5 | 12 |
| Pipeline (Qualified Leads) | 200 | 500 |
| Case Studies Published | 2 | 5 |

---

## Resource Allocation

### Team Capacity
- **Solo Founder:** Full-time (40 hours/week)

### Effort Distribution (14-Day Launch)
- 60% - Build FTD pack (technical delivery)
- 25% - Outreach + sales (lead gen, calls, audits)
- 10% - Documentation (runbooks, case studies)
- 5% - Admin (billing, contracts, setup)

### Effort Distribution (Post-Launch Growth)
- 50% - Customer delivery (FTD installs + retainer work)
- 30% - Sales + outreach (pipeline building)
- 15% - Product improvements (automation, new workflows)
- 5% - Admin + reporting

---

## Risks and Dependencies

| Risk/Dependency | Impact | Mitigation | Status |
|-----------------|--------|------------|--------|
| Microsoft Graph API permissions not granted | High - Cannot provision users | Document exact permissions, test in sandbox first | 🟡 Monitor |
| Customer tenant lacks required licenses | High - Cannot assign licenses | Pre-flight checklist, verify license pool before install | 🟡 Monitor |
| Power Automate flow drift across tenants | Medium - Installs fail | Version control flow exports, weekly smoke tests | 🟡 Monitor |
| Lead list not qualified (wrong ICP) | Medium - Low conversion | Use strict filters (50-250 staff, 8+ open roles, M365 evidence) | 🟡 Monitor |
| FTD delivery takes >48 hours | Medium - Breaks promise | Test end-to-end in sandbox, create deployment checklist | 🟡 Monitor |
| Solo bandwidth constraints | Medium - Can't scale | Focus on delivery quality over quantity weeks 1-4 | ✅ Accepted |
| Secrets leakage in repo | High - Security breach | Use .env files, Key Vault, never commit secrets | 🟢 Mitigated |

---

## What We're NOT Doing

It's important to be explicit about what we're deprioritizing:

- ❌ **Multi-tenant SaaS platform** - Staying focused on service delivery, not building software product
- ❌ **Custom workflows** - Only productized, repeatable workflows in first 90 days
- ❌ **Non-M365 platforms** - No Google Workspace, Slack, etc. Stay specialized
- ❌ **Enterprise deals (250+ staff)** - ICP is 50-250, avoid complexity of large orgs
- ❌ **Unprofitable FTDs** - No discounts below $500, no free pilots
- ❌ **Ad-hoc support** - Only structured retainer work, no one-off fixes

---

## Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2025-11-05 | Focus on M365 new-hire onboarding only | Wedge strategy: master one workflow, prove value, expand later |
| 2025-11-05 | 48-hour FTD delivery commitment | Fast time-to-value differentiates from consultants (weeks/months) |
| 2025-11-05 | ICP: 50-250 employees | Sweet spot: complex enough to need automation, small enough to close fast |
| 2025-11-05 | Complete Build approach (not MVP) | FTD pack is well-defined, 7 PRs, ship complete before first customer |
| 2025-11-05 | Service business (not SaaS) | Faster to revenue, lower technical risk, validate market before building platform |

---

## Weekly Operating Rhythm (Post-Launch)

| Day | Focus | Activities |
|-----|-------|------------|
| **Monday** | Pipeline | Review pipeline, pick 10 audit targets, ship 3 audits |
| **Tuesday** | Delivery | FTD installs or retainer sprint work, QA testing |
| **Wednesday** | Delivery | Continue customer work, extract metrics and KPIs |
| **Thursday** | Marketing | Publish micro-case study, send 20 follow-ups with artifact |
| **Friday** | Operations | Backlog grooming, incident review, security checks, billing |

---

## Revision History

| Date | Changes | Updated By |
|------|---------|------------|
| 2025-11-05 | Initial roadmap created for 14-day launch | Solo Founder |
