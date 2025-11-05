# SOP — Build (Day 1)

1. Create SharePoint List “New‑Hire Requests” with required fields (see schema).
2. Provision Teams “Onboarding Template” with channels: Welcome, HR, IT‑Setup, Manager Checklists.
3. Build Power Automate flow: trigger on SharePoint item → validate fields → call Azure Function to create user and assign license → create Teams space from template → post welcome message → create manager tasks.
4. Secrets: store in Key Vault; use Managed Identity for Function access to Graph.
5. Logging: write run log to Application Insights and SharePoint “Runs” list.
6. Prepare rollback: capture created UPN, group memberships, Teams site ID for deletion if needed.
