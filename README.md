# Cs3200-Project-1

Build Project I – Design & Implement a Relational Database

This project implements a relational database for tracking student job and internship applications. The system allows students to manage applications, interview rounds, contacts, offers, tags, and status history.

JobBoard is implemented as a lookup table for job sources. In the current dataset it maintains available job boards, and it can be extended in the future by linking JobPosting to a board_id.

Project structure:

Cs3200-Project-1  
- sql/schema.sql  
- sql/seed.sql  
- sql/verify.sql  
- sql/app_tracker.db  
- query1.sql  
- query2.sql  
- query3.sql  
- query4.sql  
- query5.sql  
- screenshots/  
- Requirement.pdf  

How to build the database:

sqlite3 sql/app_tracker.db < sql/schema.sql  
sqlite3 sql/app_tracker.db < sql/seed.sql  

How to verify:

sqlite3 sql/app_tracker.db < sql/verify.sql  
sqlite3 sql/app_tracker.db "PRAGMA foreign_key_check;"

Queries:

query1.sql – multi-table join  
query2.sql – subquery  
query3.sql – group by with having  
query4.sql – multi-table join with filtering  
query5.sql – case expression