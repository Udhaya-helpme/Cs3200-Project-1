PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS StatusHistory;
DROP TABLE IF EXISTS JobBoard;
DROP TABLE IF EXISTS Offer;
DROP TABLE IF EXISTS ApplicationContact;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS ApplicationTag;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS InterviewRound;
DROP TABLE IF EXISTS Application;
DROP TABLE IF EXISTS JobPosting;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
  student_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  university TEXT,
  major TEXT,
  graduation_year INTEGER
);

CREATE TABLE Company (
  company_id INTEGER PRIMARY KEY,
  company_name TEXT NOT NULL,
  industry TEXT,
  hq_location TEXT
);

CREATE TABLE JobPosting (
  job_id INTEGER PRIMARY KEY,
  company_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  location_mode TEXT CHECK (location_mode IN ('remote','onsite','hybrid')),
  job_type TEXT CHECK (job_type IN ('internship','co-op','part-time')),
  FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

CREATE TABLE Application (
  app_id INTEGER PRIMARY KEY,
  student_id INTEGER NOT NULL,
  job_id INTEGER NOT NULL,
  submission_date TEXT,
  current_status TEXT CHECK (current_status IN ('Applied','OA','Interviewing','Offer','Rejected','Withdrawn')),
  notes TEXT,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (job_id) REFERENCES JobPosting(job_id)
);

CREATE TABLE InterviewRound (
  round_id INTEGER PRIMARY KEY,
  app_id INTEGER NOT NULL,
  round_type TEXT,
  scheduled_date TEXT,
  outcome TEXT CHECK (outcome IN ('Pending','Passed','Failed')),
  notes TEXT,
  FOREIGN KEY (app_id) REFERENCES Application(app_id)
);

CREATE TABLE Tag (
  tag_id INTEGER PRIMARY KEY,
  tag_name TEXT NOT NULL UNIQUE
);

CREATE TABLE ApplicationTag (
  app_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL,
  PRIMARY KEY (app_id, tag_id),
  FOREIGN KEY (app_id) REFERENCES Application(app_id),
  FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);

CREATE TABLE Contact (
  contact_id INTEGER PRIMARY KEY,
  company_id INTEGER NOT NULL,
  contact_name TEXT NOT NULL,
  role TEXT,
  email TEXT UNIQUE,
  phone TEXT,
  FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

CREATE TABLE ApplicationContact (
  app_id INTEGER NOT NULL,
  contact_id INTEGER NOT NULL,
  PRIMARY KEY (app_id, contact_id),
  FOREIGN KEY (app_id) REFERENCES Application(app_id),
  FOREIGN KEY (contact_id) REFERENCES Contact(contact_id)
);

CREATE TABLE Offer (
  offer_id INTEGER PRIMARY KEY,
  app_id INTEGER NOT NULL UNIQUE,
  compensation TEXT,
  deadline TEXT,
  offer_notes TEXT,
  FOREIGN KEY (app_id) REFERENCES Application(app_id)
);

CREATE TABLE JobBoard (
  board_id INTEGER PRIMARY KEY,
  board_name TEXT NOT NULL,
  url TEXT NOT NULL UNIQUE
);

CREATE TABLE StatusHistory (
  history_id INTEGER PRIMARY KEY,
  app_id INTEGER NOT NULL,
  status TEXT NOT NULL,
  changed_at TEXT NOT NULL,
  notes TEXT,
  FOREIGN KEY (app_id) REFERENCES Application(app_id)
);