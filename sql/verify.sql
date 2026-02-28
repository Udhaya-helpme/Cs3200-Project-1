PRAGMA foreign_keys = ON;

-- 1) 每个 application 对应 student + company + job title
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

-- 2) 某个 application 的 interview rounds
SELECT
  i.round_id,
  i.app_id,
  i.round_type,
  i.scheduled_date,
  i.outcome
FROM InterviewRound i
ORDER BY i.app_id, i.round_id;

-- 3) application 的 tags
SELECT
  at.app_id,
  t.tag_name
FROM ApplicationTag at
JOIN Tag t ON at.tag_id = t.tag_id
ORDER BY at.app_id;

-- 4) application 的 contacts (through company contacts)
SELECT
  ac.app_id,
  ct.contact_name,
  ct.role,
  cp.company_name
FROM ApplicationContact ac
JOIN Contact ct ON ac.contact_id = ct.contact_id
JOIN Company cp ON ct.company_id = cp.company_id
ORDER BY ac.app_id;

-- 5) offer (one offer per application)
SELECT
  o.offer_id,
  o.app_id,
  o.compensation,
  o.deadline
FROM Offer o;