SELECT 
  s.name AS student_name,
  c.name AS company_name,
  a.position,
  i.type AS interview_type,
  i.scheduledDate,
  i.outcome
FROM Interview i
JOIN Application a ON i.applicationID = a.applicationID
JOIN Student s    ON a.studentID = s.studentID
JOIN Company c    ON a.companyID = c.companyID
ORDER BY s.name, i.scheduledDate;
