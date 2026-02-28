SELECT
  s.name,
  s.university
FROM Student s
WHERE s.student_id IN (
  SELECT a.student_id
  FROM Application a
  WHERE a.current_status = 'Offer'
);