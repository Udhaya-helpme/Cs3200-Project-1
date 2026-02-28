SELECT
  s.name AS student_name,
  COUNT(a.app_id) AS total_applications
FROM Application a
JOIN Student s ON a.student_id = s.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(a.app_id) > 1;