# Runbook — New‑Hire Onboarding Pack

- Trigger: HR submits item to SharePoint “New‑Hire Requests”
- Flow: Validation → Azure Function (Graph) → License → Groups → Teams space → Tasks
- Retry Policy: 3 attempts with exponential backoff on Graph calls
- Alerts: email + Teams mention to Owner on failure
- Rollback: Function endpoint `/rollback` with payload `{upn, groups, siteId}`
- Logs: Application Insights trace with correlationId per run
