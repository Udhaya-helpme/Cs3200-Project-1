SELECT 
  s.name AS student_name,
  c.name AS company_name,
  c.industry,
  a.position,
  a.status,
  a.deadline
FROM Application a
JOIN Student s ON a.studentID = s.studentID
JOIN Company c ON a.companyID = c.companyID
WHERE (c.industry = 'Technology' OR c.industry = 'Finance')
  AND a.status NOT IN ('Rejected', 'Withdrawn')
  AND a.deadline >= DATE('now');
