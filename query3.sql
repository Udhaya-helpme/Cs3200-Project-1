SELECT 
    s.name AS student_name,
    COUNT(a.applicationID) AS total_applications
FROM Application a
JOIN Student s ON a.studentID = s.studentID
GROUP BY s.studentID
HAVING COUNT(a.applicationID) > 1;