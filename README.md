# Cs3200-Project-1

BUILD: Project 1 / Design & Implement a Relational Database

This repository contains the SQLite schema, seed data, verification script, and five queries for an internship application tracker.

Files
- sql/schema.sql: create tables and constraints
- sql/seed.sql: insert sample data
- sql/verify.sql: sanity checks and foreign key check
- query1.sql - query5.sql: required queries
- sql/app_tracker.db: database file
- screenshots/: query outputs and verification screenshots
- Requirement.pdf: written report

Note
JobBoard is kept as an independent lookup table to maintain a list of job sources (LinkedIn, Handshake). The current seed data only demonstrates managing the source list; it can be extended later by adding JobPosting.board_id if we want to link postings to a specific source.