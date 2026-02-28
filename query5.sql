SELECT
  a.app_id,
  s.name AS student_name,
  c.company_name,
  CASE
    WHEN a.current_status = 'Offer' THEN '🎉 Success'
    WHEN a.current_status = 'Interviewing' THEN 'In Progress'
    WHEN a.current_status = 'Applied' THEN 'Waiting'
    ELSE 'Closed'
  END AS status_category
FROM Application a
JOIN Student s ON a.student_id = s.student_id
JOIN JobPosting j ON a.job_id = j.job_id
JOIN Company c ON j.company_id = c.company_id
ORDER BY s.name;