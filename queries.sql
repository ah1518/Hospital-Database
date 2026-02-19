--==============================================================================================================================================================
--Hospital Database - Assignment 1
--Author: StudentID 760008623
--Description: Schema creation and queries
--==============================================================================================================================================================

--Query 1: Add a  new patient to the database, including being registered with one of the doctors

INSERT INTO Patients (Patient_Name, Patient_DoB, Patient_Address, Patient_Role, Doctor_ID)
VALUES ('name, 'date of birth', 'address', 'role', Doctor_ID);

Example:
INSERT INTO Patients (Patient_Name, Patient_DOB, Patient_Address, Patient_Role, Doctor_ID)
VALUES ('Maria Bonita', '1987-10-10', 'London', 'Patient', 9);

--The patient registration query inserts a new record into the Patients table.
--The Patient_ID is automatically generated using the AUTO_INCREMENT attribute.
--The Doctor_ID column is defined as a foreign key referencing Doctors(Doctor_ID, ensuring referential integrity.
--This constraint prevents insertion of a patient record with a non-existing doctor, thereby maintaining consistency between related tables. 

================================================================================================================================================================

-Query 2: Print the list of doctor of a particular hospital.

Option 1: Input Hospital_ID
SELECT Doctor_Name
FROM Doctors
WHERE Hospital_ID=?;

--This query retrieves the names of all doctors of a particular hospital. It filters the Doctors Table using the Hospital_ID column.
  Hospital_ID is a foreign key constraint in Doctors Table, that references the Hospitals tables.


Option 2: Input is Hospital_Name

SELECT d.Doctor_Name
FROM Doctors d
JOIN Hospitals h
ON d.Hospital_ID=h.Hospital_ID
WHERE h.Hospital_Name='name';

--This query retrieves the names of all doctors of a particular hospital, identified by Hospital_Name.
  The JOIN operation links the tables Doctors and Hospitals through the shared column Hospital_ID, since Hospital_ID in the Doctors table is a FK referencing Hospitals table.

================================================================================================================================================================

-Query 3: Print a list of all prescriptions that a particular doctor has prescribed.

Option 1: Input Doctor_ID
SELECT Prescription_ID, Patient_ID, Medication, Prescription_Date
FROM Prescriptions
WHERE Doctor_ID=?;

--This query retrieves all prescriptions a doctor has described, when the input is the ID.
  It filters the Prescriptions Tables using the Doctor_ID column, because Doctor_ID is a foreign key constraints that references the Doctors Table.


Option 2: Input is Doctor_Name

SELECT p.Prescription_ID, p.Patient_ID, p.Medication, p.Prescription_Date
FROM Prescriptions p
JOIN Doctors d
ON d.Doctor_ID=p.Doctor_ID
WHERE d.Doctor_Name='name';

--This query retrieves all prescriptions a particular doctor has described, when the input is the name of the doctor.
  The JOIN operations links the two tables Doctors and Prescriptions through the shared column Doctor_ID, since the Doctor_ID in the Prescriptions table is a FK referencing the Doctors table.

======================================================================================================================================================================================================================================================================================================

-Query 4: Print a list of all prescriptions for a particular patient, ordered by the prescription date.

SELECT *
FROM Prescriptions
WHERE Patient_ID=?
ORDER BY Prescription_Date DESC;

--This query retrieves all prescriptions for a specific patient, ordered by prescription date in descending order (newest to oldest).
  In medical context is more relevant to know the newest medication, or the current treatment status.
  Patient_ID is required as an input, given the context that in real world data might exist dublicates of names (and also dates of birth). 
  Patient_ID is a foreign key in Prescriptions table, referencing Patient_ID in Patients table.

=============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

-Query 5: Identify which doctor has made the most prescriptions.

SELECT d.Doctor_ID, d.Doctor_Name, COUNT(p.Prescription_ID) AS Prescription_Count
FROM Prescriptions p
JOIN Doctors d
ON p.Doctor_ID=d.Doctor_ID
GROUP BY d.Doctor_ID, d.Doctor_Name
ORDER BY Prescription_Count DESC
LIMIT 1;

--This query identifies the doctor who has described the highest number of prescriptions. It joins Prescriptions and Doctors tables matching on Doctor_ID, which is PK in Doctors and FK in Prescriptions.
  Groups the records by doctor and counts the number of prescriptions described by each doctor. 
  Then, orders the results of prescription count by descending and returns the highest result.
  The output is the Doctor_ID, Doctor_Name and Prescription_Count.
 
-- Limitation: This query is valid given the current dataset where a unique maximum exists.
   However, if multiple doctors have identical prescription counts, LIMIT 1 would return only one of them, choosing randomly.
   In such cases, a more robust approach would be to use a subquery to identify  all doctors with highest prescription count. 
   Alternatively, a second subquery could be introduced to determine a single highest rank doctor with most prescriptions, in a consistent and controlled manner.

===================================================================================================================================================================

-Query 6: Print a list of all doctors at the hospital with biggest size (number of beds).

SELECT d.Doctor_ID, d.Doctor_Name
FROM Doctors d
JOIN Hospitals h
 ON d.Hospital_ID=h.Hospital_ID
WHERE h.Hospital_Size=(
 SELECT MAX(Hospital_Size)
 FROM Hospitals
);

--This query lists the doctors who are part of the hospital with the biggest size, by using a subquery to identify the hospital with the highest number of beds.
  The Hospital_ID is a PK in Hospitals table and a FK in Doctors table, establishing the relationship between the two tables.
  Then join is performed in this attribute to combine doctors and hospital records. The query restricts the output to the hospital with the biggest size, so only the doctors affiliated with it, are returned. 

=================================================================================================================================================================

  
