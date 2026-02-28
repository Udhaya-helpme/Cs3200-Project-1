SELECT name, university
FROM Student
WHERE student_id IN (
  SELECT student_id
  FROM Application
  WHERE current_status = 'Offer'
);