# Risk Register

- License pool empty → Pre‑check and alert; pause run until licenses added
- Manager missing/invalid → Route to HR queue for fix before proceeding
- Secrets exposure → Key Vault only, no in‑flow secrets; rotate quarterly
- Over‑permissioning → Roles and groups mapped in a table; least privilege
- HRIS API rate limits → Queue requests; exponential backoff; dead‑letter queue
- Change in M365 schema → Version flows; export solutions; weekly smoke tests
