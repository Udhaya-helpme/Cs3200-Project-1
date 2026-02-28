SELECT 
    a.applicationID,
    s.name AS student_name,
    c.name AS company_name,
    CASE 
        WHEN a.status = 'Offer' THEN '🎉 Success'
        WHEN a.status = 'Interviewing' THEN 'In Progress'
        WHEN a.status = 'Applied' THEN 'Waiting'
        ELSE 'Closed'
    END AS status_category
FROM Application a
JOIN Student s ON a.studentID = s.studentID
JOIN Company c ON a.companyID = c.companyID
ORDER BY s.name;