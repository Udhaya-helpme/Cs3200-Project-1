SELECT
  s.name AS student_name,
  c.company_name,
  c.industry,
  j.title AS job_title,
  a.current_status
FROM Application a
JOIN Student s ON a.student_id = s.student_id
JOIN JobPosting j ON a.job_id = j.job_id
JOIN Company c ON j.company_id = c.company_id
WHERE c.industry IN ('Technology', 'FinTech')
  AND a.current_status NOT IN ('Rejected', 'Withdrawn')
ORDER BY s.name, c.company_name;