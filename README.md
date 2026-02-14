# Hospital-Database
Hospital Database Assignment1

Project overview

This project is a Hospital Database developed in MySQL. The database is designed using a relational database model, where data is organised into structured tables linked through primary and foreign keys. Each table represents a distinct entity (Hospitals, Doctors, Patients, and Prescriptions), with a unique primary key to ensure entity integrity. This relational structure reinforces referential integrity, reduces redundancy, end ensures efficient querying and data consistency across the database. 

Repository contents
-Hospital_Database.sql #MySQL database export containing all tables and data.
-ERD_Diagram.png #Entity Relationship Diagram showing tables, fields, and relationships.
-README.md #This file describres the project and the repository contents.

Database structure:
1) Hospitals table that stores information about hospitals. Each record is uniquely identified by a primary key Hospital_ID. Additional attributes include Hospital's Name, Address, Number of Beds, Type, and Accreditation Status.
2) Doctors table that stores information about doctors. Each record is uniquely identified by the primary key Doctor_ID. Additional attributes include Doctor's Name, Date of Birth, their Role, and each doctor is associated with a hospital via the foreign key Hospital_ID.
3) Patients table that stores information about patients. Each  record is uniquely identified by the primary key Patient_ID. Additional attributes include Patient's Name, Date of Birth, Address, and Role. Each patient is assigned to a doctor via the foreign key Doctor_ID.
4) Prescriptions table that store information about prescriptions. Each record is uniquely identified by the primary key Prescription_ID. Additional attributes include Medication, and Date of Prespription. Each prescription is associated with patient via the foreign key Patient_ID and assigned to a doctor via the foreign key Doctor_ID.

Relationships:
The database contains the following one-to-many (1:*) relationships:
-Hospitals-> Doctors - One hospital can have many doctors, and one doctor works at only one hospital.

-Doctors->Patients - One doctor can have many patients, but each patient is assigned to only one doctor.

-Doctors->Prescriptions -  One doctor can prescribe many prescriptions, and each prescription is written by only one doctor.

-Patients->Prescriptions - One patient can recieve many prescriptions, and each prescription belongs to only one patient.

 
Notes:
All data was loaded from the provided .csv files.
GitHub commit messages have been used to track progress and changes throughout development.
Additional SQL queries will be implemented and documented as development progresses.
