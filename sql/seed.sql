PRAGMA foreign_keys = ON;

INSERT INTO Student (student_id, name, university, major, graduation_year)
VALUES
  (1, 'Xiaodi Wang', 'Northeastern University', 'CS', 2026),
  (2, 'Udhaya Bhuvanesh', 'Northeastern University', 'CS', 2026);

INSERT INTO Company (company_id, company_name, industry, hq_location)
VALUES
  (1, 'Google', 'Technology', 'Mountain View, CA'),
  (2, 'Deloitte', 'Consulting', 'New York, NY');

INSERT INTO JobPosting (job_id, company_id, title, location_mode, job_type)
VALUES
  (1, 1, 'Software Engineering Intern', 'hybrid', 'internship'),
  (2, 2, 'Data Analyst Intern', 'remote', 'internship');

INSERT INTO Application (app_id, student_id, job_id, submission_date, current_status, notes)
VALUES
  (1, 1, 1, '2026-02-01', 'Interviewing', 'Submitted via company portal'),
  (2, 1, 2, '2026-02-05', 'Applied', 'Referred by alumni'),
  (3, 2, 2, '2026-02-10', 'Offer', 'Completed final round');

INSERT INTO InterviewRound (round_id, app_id, round_type, scheduled_date, outcome, notes)
VALUES
  (1, 1, 'Phone Screen', '2026-02-10', 'Passed', 'Good communication'),
  (2, 1, 'Technical', '2026-02-15', 'Pending', 'Waiting result'),
  (3, 3, 'Final', '2026-02-18', 'Passed', 'Received offer');

INSERT INTO Tag (tag_id, tag_name)
VALUES
  (1, 'Dream Company'),
  (2, 'Referral'),
  (3, 'High Priority');

INSERT INTO ApplicationTag (app_id, tag_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3);

INSERT INTO Contact (contact_id, company_id, contact_name, role, email, phone)
VALUES
  (1, 1, 'Alice Recruiter', 'Recruiter', 'alice@google.com', '111-111-1111'),
  (2, 2, 'Bob Manager', 'Hiring Manager', 'bob@deloitte.com', '222-222-2222');

INSERT INTO ApplicationContact (app_id, contact_id)
VALUES
  (1, 1),
  (3, 2);

INSERT INTO Offer (offer_id, app_id, compensation, deadline, offer_notes)
VALUES
  (1, 3, '$45/hr', '2026-03-01', 'Offer accepted pending paperwork');