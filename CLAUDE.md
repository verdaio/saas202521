# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with this repository.

---

## 🎯 Role Division

**You (the user) make decisions:**
- What features to build
- What the product does
- Business priorities
- Any choices or direction

**Claude (the AI) does all computer work:**
- Planning documents (roadmaps, PRDs, sprint plans)
- Coding and implementation
- Documentation
- Technical sequencing (what to build in what order)
- File creation and organization

**Simple rule:** When there's a decision to make, Claude asks. Everything else, Claude just does.

---

## 📖 Essential Project Guides

**Before starting any work, reference these guides:**

| Guide | Purpose |
|-------|---------|
| **DEVELOPMENT-GUIDE.md** | Tooling requirements, Docker setup, diagnostics |
| **STYLE-GUIDE.md** | File naming, code style, formatting standards |
| **TESTING-CHECKLIST.md** | Pre-commit checks, smoke tests, validation |
| **C:\devop\coding_standards.md** | Comprehensive coding standards (Google Style Guides) |

---

## 🏢 Multi-Tenant Architecture

**Multi-Tenant Enabled:** {{MULTI_TENANT_ENABLED}}
**Tenant Model:** {{TENANT_MODEL}}

**When working on this project, always remember:**
- Database schemas: All tables must include `tenant_id` column
- API endpoints: All endpoints must be tenant-scoped
- Authentication: Tokens must include tenant context
- File storage: Files must be stored with tenant prefix
- Testing: Always test cross-tenant isolation

**See:** `technical/multi-tenant-architecture.md`

---

## 🎯 Project Information

**Project ID:** {{PROJECT_NAME}}
**Created:** {{CREATION_DATE}}
**Path:** {{PROJECT_PATH}}
**Status:** active

### First Time Opening This Project?

**If user opens project for the first time**, proactively greet:

> "👋 Welcome to {{PROJECT_NAME}}! I see this is a new project. Would you like help getting started? I can walk you through creating your roadmap, sprint plan, and OKRs. Just say 'yes' or 'help me get started'!"

**When user responds positively, ask about setup mode:**

> "Would you like:
> - **A) Quick Start** (5 minutes) - Create minimal templates for you to fill in
> - **B) Detailed Setup** (15-20 minutes) - Ask questions and create comprehensive planning docs
>
> Which would you prefer? (A/B or quick/detailed)"

---

## 🚀 Getting Started Workflow

### Quick Start (Option A)

1. Check `project-brief/` for existing vision files
2. Create basic roadmap: `product/roadmap/initial-roadmap.md`
3. Create Sprint 1 plan: `sprints/current/sprint-01-initial.md`
4. Update `.project-state.json`: `setupComplete: true`
5. Tell user to fill in TODOs and say "start building" when ready

### Detailed Setup (Option B)

**Step 1: Check Project Brief**
- Read ALL `.md` files in `project-brief/` directory
- Use content to inform planning
- If no files exist, ask user for vision/brief

**Step 2: Discovery Questions**
1. Team structure: Solo or team?
2. Build approach: MVP-First / Complete Build / Growth-Stage?
3. Product concept: What problem does it solve?
4. Target users: Who is this for?
5. Core features: What needs to be built?

**Step 3: Create Roadmap**
- Read `product/roadmap-template.md`
- Create roadmap in `product/roadmap/`
- Adapt structure based on build approach

**Step 4: Create Sprint 1 Plan**
- Read `sprints/sprint-plan-template.md`
- Create `sprints/current/sprint-01-[name].md`
- Break goals into user stories

**Step 5: Set OKRs (if team/enterprise)**
- Read `business/okr-template.md`
- Create quarterly OKRs focused on goals

**Step 6: Auto-commit & Push**
```bash
git add .
git commit -m "docs: add initial planning documents"
git push origin master
```

---

## 🤖 Virtual Agents

**Sprint Planner 🏃**
- Trigger: "sprint", "plan sprint"
- Use: `sprints/sprint-plan-template.md`

**PRD Assistant 📝**
- Trigger: "PRD", "product requirements"
- Use: `product/prd-template.md`
- Multi-tenant reminder: Add tenant isolation section

**System Architect 🏗️**
- Trigger: "architecture", "tech stack"
- Use: `technical/adr-template.md`
- Multi-tenant reminder: Consider tenant data isolation

**Research Assistant 🔬**
- Trigger: "research", "compare", "investigate"
- Use Task tool (Explore, very thorough)
- Document in `product/research/` or `technical/research/`

**Project Manager 📊**
- Trigger: "status", "progress", "what's next"
- Check sprint status, PRD completion, OKR progress
- Update projects database if trade name/status changes

**Documentation Agent 📖**
- Trigger: "document", "write docs"
- Multi-tenant reminder: Show tenant scoping in API examples

---

## 🎯 Integration Resources

**Three tiers of capabilities:**

| Layer | What | When to Use |
|-------|------|-------------|
| **Tier 1** | Virtual Agents (above) | Planning & documentation |
| **Tier 2** | Claude Code Templates | Technical implementation (163 agents, 210 commands) |
| **Tier 3** | Claude Skills | Document processing (PDF, Excel, etc.) |

**For development:** See `.config/claude-code-templates-guide.md`
**For documents:** See `.config/recommended-claude-skills.md`
**For specialized tasks:** See `docs/advanced/SPECIALIZED-TOOLS.md`

---

## 💻 Coding Standards

**Reference:** `C:\devop\coding_standards.md`

**Quick summary:**
- Python: `snake_case`, docstrings, type hints, 80 chars
- JavaScript: `camelCase`, JSDoc, `const`/`let`, 80-100 chars
- Comments explain WHY, not WHAT
- Functions: Single responsibility, <50 lines, ≤3 parameters
- Always run linters before commits

---

## 📝 Documentation Standards

### File Length Guideline

**Target: Keep documentation files under 650 lines**

**Exceptions (can exceed):**
- ✅ CLAUDE.md, DEVELOPMENT-GUIDE.md, STYLE-GUIDE.md
- ✅ Tutorial/training documents

**For all other docs:**
- ❌ PRDs, sprint plans, ADRs, meeting notes
- If doc exceeds 650 lines: Split into focused documents

---

## 📦 Git Automation

**Always commit and push after:**
- ✅ Creating/updating planning documents
- ✅ Creating/updating technical specs
- ✅ Adding meeting notes or retrospectives
- ✅ Any file changes the user requested

**Do NOT auto-commit:**
- ❌ Code implementation (ask user first)
- ❌ Configuration changes (.env, secrets)
- ❌ Database migrations

**Standard workflow:**
```bash
git add .
git commit -m "docs: <clear description>"
git push origin master
echo "✅ Changes committed and pushed to GitHub"
```

**Commit message format:**
- `docs:` for documentation
- `plan:` for planning documents
- `update:` for updates to existing files

---

## ⚠️ CRITICAL: Safe Process Management

**NEVER kill ALL processes of a type.**

### ❌ DANGEROUS - Never Use
```bash
taskkill /F /IM node.exe    # Kills ALL Node.js (all projects)
pkill -f node               # Kills ALL matching processes
```

### ✅ SAFE - Always Use
```bash
# Windows - Kill by specific port
netstat -ano | findstr :{{PROJECT_PORT_FRONTEND}}
taskkill /F /PID <specific-PID>

# Mac/Linux - Kill by specific port
kill $(lsof -ti:{{PROJECT_PORT_FRONTEND}})

# Docker - Stop only this project
docker-compose down
```

**Golden Rule:** Target by specific PID or port only.

**See:** `.config/SAFE-PROCESS-MANAGEMENT.md`

---

## 📚 Additional Resources

**Project Guides:**
- DEVELOPMENT-GUIDE.md - Tooling, Docker, diagnostics
- STYLE-GUIDE.md - File naming, code style
- TESTING-CHECKLIST.md - Pre-commit checks
- MCP-SETUP-GUIDE.md - Optional MCP integration

**Integration:**
- `.config/claude-code-templates-guide.md` - Development tools (recommended)
- `.config/recommended-claude-skills.md` - Claude Skills
- `.config/INTEGRATIONS.md` - Complete integration guide

**Advanced:**
- `docs/advanced/SPECIALIZED-TOOLS.md` - Framework specialists, payments, AI

**Project Tracking:**
- `C:\devop\.config\verdaio-dashboard.db` - SQLite database
- Update when: Trade name chosen, status changes
- Use: Python script with sqlite3 module

**Task Notifications:**
- `C:\devop\scripts\` - PowerShell notification system
- Use for: Tasks >15 minutes
- Email: chris.stephens@verdaio.com

---

## 🎯 Key Principles

**When helping users:**
- Use Task tool (Explore) before assuming file locations
- Read templates before filling them out
- Ask clarifying questions about scope
- Cross-link related documents
- Respect build approach (MVP vs Complete vs Growth-Stage)
- Auto-commit and push documentation changes

**Never:**
- Create files without asking which template to use
- Skip user research and validation
- Recommend over-engineering for MVPs
- Kill all processes by name (use PID/port only)

---

**Template Version:** 2.0
**Last Updated:** {{CREATION_DATE}}
