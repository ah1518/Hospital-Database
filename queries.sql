--========================================
--Hospital Database - Assignment 1
--Author: StudentID 760008623
--Description: Schema creation and queries
--========================================

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

