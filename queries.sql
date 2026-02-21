--==============================================================================================================================================================
--Hospital Database
--Functional SQL Queries
--This file contains the six required queries for the assessment.
--==============================================================================================================================================================

-Query 1: Print the list of all doctors at a particular hospital.

Option 1: Input Hospital_ID
SELECT Doctor_Name
FROM Doctors
WHERE Hospital_ID= ?;

--This query retrieves the names of all doctors of a particular hospital. It filters the Doctors table using the Hospital_ID column to return only those records that match the given hospital.
  Hospital_ID is a foreign key constraint in Doctors table, that references the Hospital_ID primary key at Hospitals table, ensuring referential integrity between two tables.


Option 2: Input is Hospital_Name

SELECT d.Doctor_Name
FROM Doctors d
JOIN Hospitals h
ON d.Hospital_ID=h.Hospital_ID
WHERE h.Hospital_Name= ?;

--This query retrieves the names of all doctors of a particular hospital, identified by Hospital_Name.
  The JOIN operation links the tables Doctors and Hospitals using the shared column Hospital_ID, since Hospital_ID is a FK in the Doctors table referencing the PK Hospital_ID in the Hospitals table.
  The WHERE clause filters the results to return only the doctors associated with the specific hospital name.

================================================================================================================================================================

-Query 2: Print a list of all prescriptions for a particular patient, ordered by the prescription date.

SELECT *
FROM Prescriptions
WHERE Patient_ID= ?
ORDER BY Prescription_Date DESC;

--This query retrieves all prescriptions given to a specific patient, identified by Patient_ID. 
  The WHERE clause filters the prescriptions table to return only records belonging to the specified patient.
  The ORDER clause sorts the results by Prescription_Date in descending order, displaying the most recent prescriptions first.
  In a medical context, presenting the newest prescription first is often more relevant, as it reflects the patient's current or most recent treatment status.
  Patient_ID is used as the input parameter because it uniquely identifies each patient. This avoids the ambiguity that could arise from duplicate names or identical dates of birth.
  Patient_ID is a FK in the Prescriptions table referencing the PK Patient_ID in the Patients table, ensuring referential integrity.

============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

-Query 3: Print a list of all prescriptions that a particular doctor has prescribed.

Option 1: Input Doctor_ID
SELECT Prescription_ID, Patient_ID, Medication, Prescription_Date
FROM Prescriptions
WHERE Doctor_ID= ?;

--This query retrieves all prescriptions a doctor has prescribed, identified by Doctor_ID.
  The WHERE clause filters the Prescriptions table to return only records associated with the given doctor. 
  Doctor_ID is a FK in the Prescriptions table that references the PK Doctor_ID in the Doctors table, ensuring referential integrity between doctors and prescriptions.


Option 2: Input is Doctor_Name

SELECT p.Prescription_ID, p.Patient_ID, p.Medication, p.Prescription_Date
FROM Prescriptions p
JOIN Doctors d
ON d.Doctor_ID=p.Doctor_ID
WHERE d.Doctor_Name= ?;

--This query retrieves all prescriptions a specific doctor has prescribed, identified by Doctor_Name.
  The JOIN operation connects the Prescriptions and Doctors tables using the shared column Doctor_ID. In this relationship, Doctor_ID is a FK in the Prescriptions table referencing the PK Doctor_ID in the Doctors table.
  The WHERE clause filters the results to return only the prescriptions associated with the specified doctor's name.

  Note: Although filtering by Doctor_Name is possible, using Doctor_ID is more realiable in real-world datasets, where there might be duplicates.

======================================================================================================================================================================================================================================================================================================

-Query 4: Add a  new patient to the database, including being registered with one of the doctors

INSERT INTO Patients (Patient_Name, Patient_DoB, Patient_Address, Patient_Role, Doctor_ID)
VALUES ('name', 'date of birth', 'address', 'role', id);

Example:
INSERT INTO Patients (Patient_Name, Patient_DOB, Patient_Address, Patient_Role, Doctor_ID)
VALUES ('Maria Bonita', '1987-10-10', 'London', 'Patient', 9);

--This query inserts a new patient record into the Patients table.
  The INSERT INTO statement specifies the attributes to be populated, and the VALUES clause provide the corresponding data. 
  Patient_ID is automatically generated using the AUTO_INCREMENT attribute, ensuring that each patient has a unique identifier.
  This constraint prevents the insertion of a patient record with a non-existing Doctor_ID, thereby maintaining consistency and integrity within the relational database.
  The Patients table is defined with appropriate data types and NOT NULL constraints to ensure data integrity. Text attributes use the VARCHAR data type, dates use the DATE data type, and numeric identifiers use the INT data type. 
  The Doctor_ID attribute is defined as FK referencing Doctors(Doctor_ID), which enforces referential integrity between patients and doctors. 

================================================================================================================================================================

-Query 5: Identify which doctor has made the most prescriptions.

SELECT d.Doctor_ID, d.Doctor_Name, COUNT(p.Prescription_ID) AS Prescription_Count
FROM Prescriptions p
JOIN Doctors d
ON p.Doctor_ID=d.Doctor_ID
GROUP BY d.Doctor_ID, d.Doctor_Name
ORDER BY Prescription_Count DESC
LIMIT 1;

--This query identifies the doctor who has prescribed the highest number of prescriptions. It joins Prescriptions and Doctors tables matching on Doctor_ID, groups prescription records by doctor, and uses COUNT(Prescription_ID) to calculate the total number of prescriptions per doctor. 
  The results are then sorted by Prescription_Count in descending order, and LIMIT 1 returns the highest result.
  The output includes Doctor_ID, Doctor_Name, and Prescription_Count.
 
--Limitation: This query is valid given the current dataset where a unique maximum exists.
  However, if multiple doctors have identical prescription counts, LIMIT 1 would return only one of them, and the selection is not guaranteed to be consistent.
  In such cases, a more robust approach would be to use a subquery to identify all doctors with the highest prescription count. 
  Alternatively, a second subquery could be introduced to apply a secondary ordering criterion, ensuring that a single highest-ranked doctor is selected in a consistent and controlled manner. 


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

--This query lists the doctors who assigned at the hospital with the largest size, measured by the number of beds. 
  The subquery uses the MAX(Hospital_Size) aggregate function to determine the highest hospital size recorded in the Hospitals table.
  The outer query joins the Doctors and Hospitals tables using Hospital_ID which is a PK in the Hospitals table and a FK in Doctors table. This relationship establishes referential integrity between the two tables.
  The WHERE clause restricts the results to only those hospitals whose Hospital_Size matches the maximum value returned by the subquery. As a result, the query returns all doctors associated with the largest hospital.
  This approach ensures that if multiple hospitals share the same maximum size, doctors from all such hospitals will be included in the results.
  

=================================================================================================================================================================
  
