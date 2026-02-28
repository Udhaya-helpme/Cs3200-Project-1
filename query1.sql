SELECT
  s.name AS student_name,
  c.company_name,
  j.title AS job_title,
  ir.round_id,
  ir.round_type,
  ir.scheduled_date
FROM InterviewRound ir
JOIN Application a ON ir.app_id = a.app_id
JOIN Student s ON a.student_id = s.student_id
JOIN JobPosting j ON a.job_id = j.job_id
JOIN Company c ON j.company_id = c.company_id
ORDER BY s.name, ir.scheduled_date;