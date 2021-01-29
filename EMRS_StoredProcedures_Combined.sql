-- Drop all the following procedures if they already exist
DROP PROCEDURE IF EXISTS all_dentists_details;
DROP PROCEDURE IF EXISTS delete_patient_records;
DROP PROCEDURE IF EXISTS medicines_by_supplierID;
DROP PROCEDURE IF EXISTS new_dentists;
DROP PROCEDURE IF EXISTS num_of_visits;
DROP PROCEDURE IF EXISTS patient_info;
DROP PROCEDURE IF EXISTS patient_visits;
DROP PROCEDURE IF EXISTS queries_on_insurance;
DROP PROCEDURE IF EXISTS queries_on_MedicineSuppliers;
DROP PROCEDURE IF EXISTS update_bill;
DROP PROCEDURE IF EXISTS update_patient_details;
DROP PROCEDURE IF EXISTS update_visit_information;

-- 1. This will display all the medicines produced by a given medicine_supplier_id as input by the user. 

DELIMITER // 
CREATE PROCEDURE `medicines_by_supplierID` (SupplierID int)
BEGIN
select * from medicines where Medicine_Supplier_Company_Supplier_ID= SupplierID;
end//

-- 2. This will display all the visits made by a patient, given his first and last name as input by the user. 

DELIMITER // 
CREATE PROCEDURE `patient_visits` (
PatientFName varchar(20),
PatientLName varchar(20))
BEGIN
select * from visits where Patients_Patient_ID = (
select Patient_ID from patients where First_Name=PatientFName 
and Last_Name=PatientLname);
end//

-- 3. This Stored Procedure will display details of all the dentists in the hospital.

DELIMITER // 
CREATE PROCEDURE `all_dentists_details` ()
BEGIN
select * from doctors;
end//

-- 4. This Stored Procedure is used to update a patients bill

select * from patient_bills where visits_visit_id = 2010;
DELIMITER //
CREATE PROCEDURE update_bill(new_bill int, visit_id int)
BEGIN
UPDATE patient_bills
SET total_bill = new_bill, balance_due = total_bill - Insuance_Amount
WHERE visits_visit_id = visit_id;
end//

-- 5. This Stored Procedure will display number of visits made by all the patients

DELIMITER //
CREATE PROCEDURE num_of_visits()
BEGIN
SELECT CONCAT(First_name," ",Last_name) as Patient_Full_Name,
       count(v.patients_patient_id) "Number_of_visits"
FROM visits v
JOIN patients p 
ON v.patients_patient_id=p.patient_id
GROUP BY patient_Full_name
HAVING count(v.patients_patient_id)>=1
ORDER BY number_of_visits DESC;
end//

-- 6. This will update a patient_contact_details when their address is changed.

select * from patient_contact_details where Patients_Patient_ID=2;
DELIMITER //
CREATE PROCEDURE update_patient_details(
Patient_ID int,
new_Home varchar(30),
new_city varchar(30),
new_state varchar(30))
BEGIN
UPDATE patient_contact_details SET Home_Address= new_Home, 
city = new_city, state = new_state WHERE patients_patient_id=Patient_ID;
end//

-- 7. This will insert a new dentist record whenever a new dentist joins the hospital.

select * from doctors;
DELIMITER //
Create procedure new_dentists
(
  doc_id int,
  doc_first_name varchar(20) ,
  doc_last_name varchar(20),
  doc_email varchar(30),
  doc_contact varchar(50)
)
begin
	insert into doctors values (doc_id,doc_first_name,doc_last_name,
    doc_email,doc_contact);
end //

-- 8. This Stored Procedure is used to perform Update, Insert or Delete operations on the health_insurance_provider table.

select * from health_insurance_provider where Company_ID=121 ;
DELIMITER // 
CREATE PROCEDURE queries_on_insurance
(
company_id int ,
company_name varchar(40),
company_location varchar(40),
company_contact varchar(40),
query_type char(1)
)
begin
SET FOREIGN_KEY_CHECKS=OFF;
	if (query_type ='I') then 
    		INSERT INTO health_insurance_provider values (company_id,company_name,
            company_location,company_contact);
	elseif (query_type ='U') then
			UPDATE health_insurance_provider set Company_Name=company_name,  
			Company_Location=company_location, Company_Contact=company_contact where 
			Company_ID=company_id;
	elseif (query_type ='D') then
			DELETE from health_insurance_provider where Company_ID=company_id;
	End if;
SET FOREIGN_KEY_CHECKS=ON;
end //

-- 9. This Stored Procedure is used to delete a patients record from the hospital database. (Deletes all the records from all the tables related to a patients)

select * from patients where Patient_ID=10;
DELIMITER //
Create procedure delete_patient_records
(
p_id int
)
begin
SET FOREIGN_KEY_CHECKS=OFF;
		DELETE from patient_contact_details where Patients_Patient_ID=p_id;
		DELETE from visits where Patients_Patient_ID=p_id;
		DELETE from patients where Patient_ID=p_id;
SET FOREIGN_KEY_CHECKS=ON;
end //

-- 10. This Stored Procedure is used to update the reason for hospital visit of a patient information in the visits table.

select * from visits where visit_id=2000;
DELIMITER //
Create procedure update_visit_information
(
visit_id int,
p_id int,
visit_facility varchar(20),
doc_id int
)
begin
UPDATE visits set Visit_Facility=visit_facility,
			Doctors_Doctor_ID=doc_id where Visit_ID=visit_id 
            and Patients_Patient_ID=p_id;
end //

-- 11. This Stored Procedure is used to perform Update, Insert or Delete operations on the medical_supplier_company table.

select * from medicine_supplier_company;
DELIMITER // 
CREATE PROCEDURE queries_on_MedicineSuppliers
(
sup_id int ,
sup_name varchar(40),
sup_address varchar(40),
sup_contact varchar(40),
query_type char(1)
)
begin
SET FOREIGN_KEY_CHECKS=OFF;
	if (query_type ='I') then 
    		INSERT INTO medicine_supplier_company values (sup_id,sup_add,
            sup_name,sup_contact);
	elseif (query_type ='U') then
			UPDATE medicine_supplier_company set Supplier_Name=sup_name,  
			Supplier_Address=sup_address, sup_contact=sup_contact where 
			Supplier_ID=sup_id;
	elseif (query_type ='D') then
			DELETE from medicine_supplier_company where Supplier_ID=sup_id;
	End if;
SET FOREIGN_KEY_CHECKS=ON;
end //

-- 12. This Stored Procedure is used to view all the patients complete Information by joining the patients and patient_contact_details information.

DELIMITER //
Create procedure patient_info()
begin
	select * from patients join patient_contact_details on 
    patients.Patient_ID=patient_contact_details.Patients_Patient_ID;
end //

