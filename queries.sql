--========================================================================================================================================
--Hospital Database - Assignment 1
--Author: StudentID 760008623
--Description: Schema creation and queries
--=======================================================================================================================================

--Query: Add a  new patient to the database, including being registered with one of the doctors
INSERT INTO Patients (Patient_Name, Patient_DoB, Patient_Address, Patient_Role, Doctor_ID)
VALUES ('name, 'date of birth', 'address', 'role', Doctor_ID);

Example:
INSERT INTO Patients (Patient_Name, Patient_DOB, Patient_Address, Patient_Role, Doctor_ID)
VALUES ('Maria Bonita', '1987-10-10', 'London', 'Patient', 9);

--The patient registration query inserts a new record into the Patients table.
--The Patient_ID is automatically generated using the AUTO_INCREMENT attribute.
--The Doctor_ID column is defined as a foreign key referencing Doctors(Doctor_ID, ensuring referential integrity.
--This constraint prevents insertion of a patient record with a non-existing doctor, thereby maintaining consistency between related tables. 

===========================================================================================================================================

-Query: Print the list of doctor of a particular hospital.
Option 1: Input Hospital_ID
SELECT Doctor_Name
FROM Doctors
WHERE Hospital_ID=?;

--This query retrieves the names of all doctors of a particular hospital. It filters the Doctors Table using the Hospital_ID column, because Hospital_ID is a foreign key constraint in Doctors Table, that references the Hospitals tables.

Option 2: Input is Hospital_Name
SELECT d.Doctor_Name
FROM Doctors d
JOIN Hospitals h
ON d.Hospital_ID=h.Hospital_ID
WHERE h.Hospital_Name='name';

--This query retrieves the names of all doctors of a particular hospital, identified by Hospital_Name. The JOIN operation links the two tables Doctors and Hospitals through the shared column Hospital_ID, since Hospital_ID in the Doctors table is a foreign key referencing the Hospitals table.

==========================================================================================================================================

