# Cs3200 Project 1

Project 1 – Design and Implement a Relational Database

This project implements a relational database for tracking internship applications. 
It includes database design, SQL queries, verification scripts, and a simple Node.js + Express web application demonstrating CRUD operations.

--------------------------------------------------

Files

sql/schema.sql
Creates all database tables and constraints.

sql/seed.sql
Inserts sample data into the database.

sql/verify.sql
Runs verification queries and foreign key checks.

query1.sql – query5.sql
Required SQL queries for the project.

screenshots/
Contains screenshots of query outputs, verification results, and the web application.

Requirement.pdf
Written report for the project.

uml_conceptual_model.pdf
UML conceptual model diagram.

logical_erd.pdf
Logical ERD diagram.

public/
Frontend pages for the web application.

app.js
Node.js Express server.

--------------------------------------------------

Database Setup

Run the following commands from the project root directory:

rm -f sql/app_tracker.db
sqlite3 sql/app_tracker.db < sql/schema.sql
sqlite3 sql/app_tracker.db < sql/seed.sql
sqlite3 sql/app_tracker.db < sql/verify.sql

--------------------------------------------------

Running Individual Queries

sqlite3 sql/app_tracker.db < query1.sql
sqlite3 sql/app_tracker.db < query2.sql
sqlite3 sql/app_tracker.db < query3.sql
sqlite3 sql/app_tracker.db < query4.sql
sqlite3 sql/app_tracker.db < query5.sql

--------------------------------------------------

Web Application

This project also includes a simple Node.js + Express web application.

The web application provides CRUD functionality for two related tables:

Application  
InterviewRound  

InterviewRound references Application through the foreign key app_id.

Features include:

View all applications  
Create a new application  
Edit an application  
Delete an application  

View all interview rounds  
Create a new interview round  
Edit an interview round  
Delete an interview round  

--------------------------------------------------

How to Run the Web Application

Install dependencies:

npm install

Start the server:

node app.js

Open the application in your browser:

http://localhost:3000