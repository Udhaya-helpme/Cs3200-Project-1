SELECT name, email, university
FROM Student
WHERE studentID IN (
  SELECT studentID 
  FROM Application 
  WHERE status = 'Offer'
);
