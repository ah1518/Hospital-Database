# Hospital-Database
Hospital Database Project

##I. Project overview

This project presents the design and implementation of a small relational database developed as part of a module assessment. The system models a hospital management system including four core entities: Hospitals, Doctors, Patients and Prescriptions.
The database was designed using relational modelling principles and implemented in MySQL. Primary and foreign key constraints were defined to enforce referential integrity, reducing redundancy, and ensuring efficient quering and data and maintaining data consistency across the database.
 
The database schema was created prior to data population. The initial dataset was provided in .csv format and imported into MySQL corresponding tables after structural design was completed. 

Development was carried within a local repository environment, with all changes tracked using Git and committed to GitHub to maintain a structured version history.
The repository includes database schema, SQL query implementations, planning documents such as ERD, flowcharts describing system execution logic, pseudocode file and supporting documentation.


II. Repository content 
-Hospital_Database.sql #MySQL export  containing all tables and data.  
-ERD_Diagram.png #Entity Relationship Diagram showing tables, fields, and relationships.  
-README.md #This file describres the project and the repository contents.  
-Flowcharts.queries #This is a subrepository that contains .png files and images that are used for planning: flowcharts for the queries and ERD for database design.  
-queries.sql #This files containts the query for:  
  1) Registering a new patient, including being registered with one of the doctors;  
  2) Printing the list of doctors of a particular hospital;  
  3) Print the list of prescriptions a particular doctor has described;  
  4) Print a list of all prescriptions of a particular patient, ordered by prescription date;  
  5) Identify which doctor has made the most prescriptions;  
  6) Print a list of all doctors at the hospital with bigges size (number of beds).  


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
-Patients->Prescriptions - One patient can receive many prescriptions, and each prescription belongs to only one patient.  


Notes:
All data was loaded from the provided .csv files.
GitHub commit messages have been used to track progress and changes throughout development.
Additional SQL queries will be implemented and documented as development progresses.
