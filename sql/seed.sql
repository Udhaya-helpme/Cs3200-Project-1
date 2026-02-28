PRAGMA foreign_keys = ON;

INSERT INTO Student (student_id, name, university, major, graduation_year)
VALUES
  (1, 'Xiaodi Wang', 'Northeastern University', 'CS', 2026),
  (2, 'Udhaya Bhuvanesh', 'Northeastern University', 'CS', 2026);

INSERT INTO Company (company_id, company_name, industry, hq_location)
VALUES
  (1, 'Google', 'Technology', 'Mountain View, CA'),
  (2, 'Deloitte', 'Consulting', 'New York, NY'),
  (3, 'Stripe', 'FinTech', 'San Francisco, CA');

INSERT INTO JobPosting (job_id, company_id, title, location_mode, job_type)
VALUES
  (1, 1, 'Software Engineering Intern', 'hybrid', 'internship'),
  (2, 2, 'Data Analyst Intern', 'remote', 'internship'),
  (3, 1, 'Data Science Intern', 'onsite', 'internship'),
  (4, 3, 'Backend Engineer Intern', 'remote', 'internship');

INSERT INTO Application (app_id, student_id, job_id, submission_date, current_status, notes)
VALUES
  (1, 1, 1, '2026-02-01', 'Interviewing', 'Submitted via company portal'),
  (2, 1, 2, '2026-02-05', 'Applied', 'Referred by alumni'),
  (3, 2, 2, '2026-02-10', 'Offer', 'Completed final round'),
  (4, 2, 3, '2026-02-20', 'Applied', 'Submitted on LinkedIn'),
  (5, 1, 4, '2026-02-22', 'Rejected', 'Auto-rejection email');

INSERT INTO InterviewRound (round_id, app_id, round_type, scheduled_date, outcome, notes)
VALUES
  (1, 1, 'Phone Screen', '2026-02-10', 'Passed', 'Good communication'),
  (2, 1, 'Technical', '2026-02-15', 'Pending', 'Waiting result'),
  (3, 3, 'Final', '2026-02-18', 'Passed', 'Received offer'),
  (4, 4, 'Technical', '2026-02-27', 'Failed', 'Need more DS fundamentals');

INSERT INTO Tag (tag_id, tag_name)
VALUES
  (1, 'Dream Company'),
  (2, 'Referral'),
  (3, 'High Priority'),
  (4, 'Remote');

INSERT INTO ApplicationTag (app_id, tag_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 3),
  (4, 4),
  (5, 4);

INSERT INTO Contact (contact_id, company_id, contact_name, role, email, phone)
VALUES
  (1, 1, 'Alice Recruiter', 'Recruiter', 'alice@google.com', '111-111-1111'),
  (2, 2, 'Bob Manager', 'Hiring Manager', 'bob@deloitte.com', '222-222-2222'),
  (3, 3, 'Cara Sourcer', 'Sourcer', 'cara@stripe.com', '333-333-3333');

INSERT INTO ApplicationContact (app_id, contact_id)
VALUES
  (1, 1),
  (3, 2),
  (4, 1),
  (5, 3);

INSERT INTO Offer (offer_id, app_id, compensation, deadline, offer_notes)
VALUES
  (1, 3, '$45/hr', '2026-03-01', 'Offer accepted pending paperwork');

INSERT INTO JobBoard (board_id, board_name, url)
VALUES
  (1, 'LinkedIn', 'https://www.linkedin.com'),
  (2, 'Handshake', 'https://joinhandshake.com');

INSERT INTO StatusHistory (history_id, app_id, status, changed_at, notes)
VALUES
  (1, 1, 'Applied', '2026-02-01 10:00:00', 'Submitted application'),
  (2, 1, 'Interviewing', '2026-02-10 09:00:00', 'Phone screen scheduled'),
  (3, 1, 'Interviewing', '2026-02-15 18:00:00', 'Technical interview completed'),
  (4, 2, 'Applied', '2026-02-05 12:00:00', 'Referred by alumni'),
  (5, 3, 'Interviewing', '2026-02-12 14:00:00', 'Final round scheduled'),
  (6, 3, 'Offer', '2026-02-18 16:30:00', 'Offer received'),
  (7, 4, 'Applied', '2026-02-20 11:15:00', 'Applied on LinkedIn'),
  (8, 4, 'Interviewing', '2026-02-27 08:30:00', 'Technical round scheduled'),
  (9, 4, 'Rejected', '2026-02-27 17:00:00', 'Rejected after interview');