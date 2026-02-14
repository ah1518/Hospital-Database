# Hospital-Database
Hospital Database Assignment1

This project is a Hospital Database developed in MySQL. The database is designed using a relational database model, where data is organised into structured tables linked through primary and foreign keys. Each table represents a distinct entity (hospitals, doctors, patients, and prescriptions), with a unique primary key to ensure entity integrity. This relational structure reinforces referential integrity, reduces redundancy, end ensure efficient querying and data consistency across the database. 

Repository contents
Hospital_Database.sql #MySQL database containing all tables and data.
ERD_Diagram.png #Entity Relationship Diagram showing tables, fields, and relationships.
README.md #This file describres the project and the repository content.

Database structure:
1) Hospitals table that stores information about hospitals, and each record is uniqely identified through a PK that is Hospital_ID, and also includes hospital's name, address, number of beds, type, and accreditation status.
2) Doctors table that stores information about doctors, and each record is uniqely identified through a PK that is Doctor_ID, and also includes doctor's name, date of birth, their role, and each doctor is associated with a hospital via the foreign key Hospital_ID.
3) Patients table that stores information about patients, and each row is uniqely identified through a PK that is Hospital_ID, and also includes their name, date of birth, address, role and each patient is assigned to a doctor via the foreign key Doctor_ID.
4) Prescriptions table that store information about prescriptions, and each record is uniqely identified through a PK that is Prescription_ID, and also includes medication, date of prespription  and each prescription is associated to a patient via a foreign key Patient_ID and assigned to a doctor via the foreign key Doctor_ID.

Relationships:
Hospitals-> Doctors one-to-many relationship. One hospital can have many doctors and one doctor works at only one hospital.
Doctors->Patients one-to-many relationship. One doctor can have many patients, but each patients is assigned to only one doctor.
Doctors->Prescriptions one-to-many relationship. One doctor can prescribe many prescriptions, and each prescription is written by only one doctor.
Patients->Prescriptions one-to-many relationship.One patient can recieve many prescriptions, and each prescription belong to only one patient.

 
Notes:
All data was loaded from the provided .csv files.
Commit messages on GitHub have been used to track progress and changes throughout the development.

