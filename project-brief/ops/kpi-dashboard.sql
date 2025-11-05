-- KPI Tables
CREATE TABLE kpi_runs (
  id SERIAL PRIMARY KEY,
  correlation_id TEXT NOT NULL,
  company TEXT NOT NULL,
  hire_type TEXT NOT NULL,
  started_at TIMESTAMP NOT NULL,
  finished_at TIMESTAMP,
  status TEXT NOT NULL,
  manual_minutes_saved INT,
  errors INT DEFAULT 0
);

CREATE VIEW kpi_summary AS
SELECT
  company,
  COUNT(*) FILTER (WHERE status = 'success') AS runs,
  AVG(EXTRACT(EPOCH FROM (finished_at - started_at))/60) AS avg_minutes,
  SUM(manual_minutes_saved) AS minutes_saved
FROM kpi_runs
GROUP BY company;
