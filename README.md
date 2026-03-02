# Cs3200-Project-1
BUILD: Project 1 / Design & Implement a Relational Database

This repository contains the SQLite schema, seed data, verification script, and five required queries for an internship application tracker.

## Files
- sql/schema.sql – create tables and constraints  
- sql/seed.sql – insert sample data  
- sql/verify.sql – verification queries and foreign key check  
- query1.sql – query5.sql – required queries  
- screenshots/ – query outputs and verification screenshots  
- Requirement.pdf – written report  

## How to Run
From the project root directory:

rm -f sql/app_tracker.db  
sqlite3 sql/app_tracker.db < sql/schema.sql  
sqlite3 sql/app_tracker.db < sql/seed.sql  
sqlite3 sql/app_tracker.db < sql/verify.sql  

To test individual queries:

sqlite3 sql/app_tracker.db < query1.sql  

## Note
JobBoard is kept as an independent lookup table to maintain a list of job sources (e.g., LinkedIn, Handshake).  
The current seed data demonstrates managing the source list only. The design can be extended later by adding a board_id foreign key in JobPosting if we want to associate each posting with a specific job board.