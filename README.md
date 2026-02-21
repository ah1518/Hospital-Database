# Hospital Database Project

## I. Project overview

This project presents the design and implementation of a small relational database developed as part of a module assessment. The system models a hospital management system including four core entities: Hospitals, Doctors, Patients and Prescriptions.
The database was designed using relational modelling principles and implemented in MySQL. Primary and foreign key constraints were defined to enforce referential integrity, reducing redundancy, and ensuring efficient querying and maintaining data consistency across the database.
 
The database schema was created prior to data population. The initial dataset was provided in .csv format and imported into MySQL corresponding tables after structural design was completed. 

Development was carried out within a local repository environment, with all changes tracked using Git and committed to GitHub to maintain a structured version history.
The repository includes database schema, SQL query implementations, planning documents, such as ERD and flowcharts, pseudocode file and supporting documentation.


## II. Repository content  
-`Hospital_Database.sql`- MySQL export file containing the complete database schema and populated dataset.  
-`queries.sql`- The SQL script containing queries required for the assessment to perform required database operations, and explanatory comment describing their purpose and logic.  
-`README.md`- File describing the project, database design, methodology and repository structure.  
-`ERD`- Folder containing `ERD.png`, the Entity Relationship Diagram illustrating tables, attributes, primary keys, foreign keys, and relationships.  
-`Flowcharts.queries`- Folder containing six flowcharts (.png files), each representing the system execution logic for one of the six implemented queries. The flowcharts are numbered 1 to 6, corresponding to the queries `queries.sql`.  


## III. Methodology  
The project was developed following a structured approach. The process began with conceptual design, where the main entities and relationships were identified and represented in an Entity Relationship Diagram (ERD). The ERD was created before implementing the database in MySQL to ensure clarity in structure and relationships.  
After completing the design stage, the database schema was created using SQL `CREATE TABLE` statements, including primary and foreign key constraints. Data from the provided `.csv` files was then imported into the corresponding tables.  
Once the database was populated, SQL queries were developed step by step and tested to ensure correct data loading, proper joins, and accurate relationships between tables. Query results were verified against the original `.csv` data to confirm consistency.  
All stages of development were tracked using Git and committed to GitHub.  


## IV. Database structure  
1.The `Hospitals` table that stores information about hospitals. Each record is uniquely identified by the primary key `Hospital_ID`. Additional attributes include `Hospital_Name`, `Hospital_Address`, `Hospital_Size`, `Hospital_Type` (number of beds) and `Hospital_Accreditation_status`.  
2.The `Doctors` table that stores information about doctors. Each record is uniquely identified by the primary key `Doctor_ID`. Additional attributes include `Doctor_Name`, `Doctor_DoB` (date of birth), `Doctor_Role` and `Hospital_ID`. The attribute `Hospital_ID`is a foreign key associating each doctor with a hospital in `Hospitals(Hospital_ID)`.  
3.The `Patients` table that stores information about patients. Each record is uniquely identified by the primary key `Patient_ID`. Additional attributes include `Patient_Name`, `Patient_DoB`, `Patient_Address`, `Patient_Role` and `Doctor_ID`. The attribute `Doctor_ID` is a foreign key associating each patient with a doctor in `Doctors(Doctor_ID)`.  
4.The `Prescriptions` table that stores information about prescriptions. Each record is uniquely identified by the primary key `Prescription_ID`. Additional attributes include `Medication`, `Prescription_Date`, `Patient_ID` and `Doctor_ID`. `Patient_ID` and `Doctor_ID` are foreign keys associating prescriptions with a patient in `Patients(Patient_ID)` and with a doctor in `Doctors(Doctor_ID)` respectively.  


## V. Relationships  
The database contains the following one-to-many (1:*) relationships as defined during the conceptual design stage and represented in the Entity Relationship Diagram (ERD). The ERD was developed prior to implementing the database schema in MySQL, ensuring the relationships, PK and FK constraints were clearly structured before table creation.  
-Hospitals->Doctors - One hospital can have many doctors, and one doctor works at only one hospital.  
-Doctors->Patients - One doctor can have many patients, but each patient is assigned to only one doctor.  
-Doctors->Prescriptions - One doctor can prescribe many prescriptions, and each prescription is given by only one doctor.  
-Patients->Prescriptions - One patient can receive many prescriptions, and each prescription belongs to only one patient.  
The ERD visually represents these relationships and guided the subsequent implementation of foreign key constraints within MySQL tables.  

## VI. Data integrity and constraints  
The database tables were created using explicit SQL `CREATE TABLE` statements derived from the conceptual ERD. During implementation, PK and FK constraints were enforced to maintain referential integrity between related tables.  
Mandatory attributes were defined using `NOT NULL` constraints to ensure that essential data fields could not be left undefined. This design choice reduces incomplete records and improves overall data consistency.  
Foreign key constraints were implemented to prevent the creation of orphan records. For example, a prescription cannot exist without a valid associated patient and doctor, and a doctor cannot exist without being associated to a valid  hospital.  
By enforcing these constraints at schema level, data integrity is maintained automatically within the database system.  
SQL queries were developed step by step and tested to ensure that data was loaded correctly, that joins and relationships functioned properly, and that the results matched the orginal `.csv` dataset for accuracy.  
 

## VII. Flowcharts  
Flowcharts were designed using standard flowchart symbols to represent system execution logic rather than the SQL syntax order. They illustrate how the database processes data step by step. The flowcharts were created before writing the final queries to ensure logical consistency and correct processing order. Flowchart images are included in the folder 'Flowcharts.queries'. Each flowchart corresponds to a specific query and is numbered from 1 to 6, matching the numbering in the queries.sql file.  
The general system execution logic represented in the flowcharts follows these steps:  
• Start  
• Load relevant table(s)  
• Apply `JOIN` conditions  
• Apply grouping and aggregation (if required)  
• Apply sorting  
• Restrict results (`LIMIT` if required)  
• Select output fields  
• Display results  
• End  


## VIII. SQL queries developed  
The project included six core SQL queries designed to demonstrate different types of database operations, including data insertion, filtering, joins, aggregation, ordering and subqueries.  
Each query is clearly structured and documented within the `queries.sql` file, where its purpose and logic are explained for clarity and ease of use. All queries were tested against the provided dataset to ensure correct functionality, accurate joins, and consistent results.  
-`Query 1`: “Print a list of all doctors based at a particular hospital” - Uses a `WHERE` clause to filter doctors by `Hospital_ID`, demonstrating the one-to-many relationship between Hospitals and Doctors.  
-`Query 2`: “Print a list of all prescriptions for a particular patient, ordered by the prescription date” - Uses a `WHERE` clause to filter by `Patient_ID` and applies `ORDER BY Prescription_Date DESC` to display results from the most recent to the oldest prescription.  
-`Query 3`: “Print a list of all prescriptions that a particular doctor has prescribed” -  Uses a `JOIN` between Doctors and Prescriptions, combined with filtering by `Doctor_ID`, to retrieve all prescriptions associated with a specific doctor.  
-`Query 4`: “Add a new patient to the database, including being registered with one of the doctors” - Uses an `INSERT INTO` statement to add a new patient and assign the patient to an existing doctor through the foreign key `Doctor_ID`, ensuring referential integrity is maintained.  
-`Query 5`: “Identify which doctor has made the most prescriptions” - Uses `GROUP BY Doctor_ID` and `COUNT(Prescription_ID)` to aggregate prescription totals per doctor, combined with `ORDER BY` in descending order and `LIMIT 1` to retrieve the highest result.  
-`Query 6`: “Print a list of all doctors at the hospital with biggest size (number of beds)” - Uses a subquery to determine the maximum `Hospital_Size` value `MAX(Hospital_Size)` and joins the Hospitals and Doctors tables to return all doctors associated with that hospital.  


## IX. Discussion  
The database and queries were developed and tested using the provided dataset. Within the scope of this project, they work as expected and return accurate results.  
However, if the database were used with a much larger dataset or in a real-world hospital environment, further improvements might be necessary. For example, some queries use ordering and `LIMIT 1` to return a single top result. In cases where multiple records share the same highest value (such as doctors with the same number of prescriptions or hospitals with the same number of beds), the current approach would return only one of them. Additional logic or alternative query structures might be required to handle such cases more accurately.  
The system could be expanded to include additional features such as appointment scheduling, billing information, hospital departments, or allowing doctors to work across multiple hospitals. These additions would increase the complexity of the system and may require further adjustments to the database design and refinement of the existing queries.  


## X. GitHub Version Control  
This project was developed incrementally and tracked using Git version control. Commits were made throughout the development process to document database creation, schema modification, query implementation, debugging, and documentation updates.  
The repository commit history provides a clear record of the project’s progression from initial design to final implementation, demonstrating structured and continuous development.  



## XI. How to use this repository  
1. Clone the repository to your local machine:  
   git clone `https://github.com/ah1518/Hospital-Database.git`
2. Import the `Hospital_Database.sql` into MySQL command line interface.  
   mysql -u `your_username` -p `your_database_name` < `Hospital_Database.sql`  
   Replace 'your_username` and `your_database_name` with your actual MySQL username and database name.  
3. Open the `queries.sql` file and execute the queries within MySQL to interact with the database.    




