PRAGMA foreign_keys = ON;

SELECT
  a.app_id,
  s.name AS student_name,
  c.company_name,
  j.title,
  a.current_status
FROM Application a
JOIN Student s ON a.student_id = s.student_id
JOIN JobPosting j ON a.job_id = j.job_id
JOIN Company c ON j.company_id = c.company_id
ORDER BY a.app_id;

SELECT
  i.round_id,
  i.app_id,
  i.round_type,
  i.scheduled_date,
  i.outcome
FROM InterviewRound i
ORDER BY i.app_id, i.round_id;

SELECT
  at.app_id,
  t.tag_name
FROM ApplicationTag at
JOIN Tag t ON at.tag_id = t.tag_id
ORDER BY at.app_id, t.tag_name;

SELECT
  ac.app_id,
  ct.contact_name,
  ct.role,
  cp.company_name
FROM ApplicationContact ac
JOIN Contact ct ON ac.contact_id = ct.contact_id
JOIN Company cp ON ct.company_id = cp.company_id
ORDER BY ac.app_id, ct.contact_name;

SELECT
  o.offer_id,
  o.app_id,
  o.compensation,
  o.deadline
FROM Offer o
ORDER BY o.offer_id;

SELECT 'Student' AS table_name, COUNT(*) AS n FROM Student
UNION ALL SELECT 'Company', COUNT(*) FROM Company
UNION ALL SELECT 'JobPosting', COUNT(*) FROM JobPosting
UNION ALL SELECT 'Application', COUNT(*) FROM Application
UNION ALL SELECT 'InterviewRound', COUNT(*) FROM InterviewRound
UNION ALL SELECT 'Tag', COUNT(*) FROM Tag
UNION ALL SELECT 'ApplicationTag', COUNT(*) FROM ApplicationTag
UNION ALL SELECT 'Contact', COUNT(*) FROM Contact
UNION ALL SELECT 'ApplicationContact', COUNT(*) FROM ApplicationContact
UNION ALL SELECT 'Offer', COUNT(*) FROM Offer
UNION ALL SELECT 'JobBoard', COUNT(*) FROM JobBoard
UNION ALL SELECT 'StatusHistory', COUNT(*) FROM StatusHistory;

PRAGMA foreign_key_check;