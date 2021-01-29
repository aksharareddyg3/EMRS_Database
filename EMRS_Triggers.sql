-- creating triggers 
-- Doctors table
DROP TRIGGER IF EXISTS doctors_after_Insert;
DROP TRIGGER IF EXISTS doctors_after_Update;
DROP TRIGGER IF EXISTS doctors_after_Delete;

-- patients table
DROP TRIGGER IF EXISTS patients_after_Insert;
DROP TRIGGER IF EXISTS patients_after_Update;
DROP TRIGGER IF EXISTS patients_after_Delete;

-- billing table
DROP TRIGGER IF EXISTS billing_after_Insert;
DROP TRIGGER IF EXISTS billing_after_Update;
DROP TRIGGER IF EXISTS billing_after_Delete;

-- visits table
DROP TRIGGER IF EXISTS visits_after_Insert;
DROP TRIGGER IF EXISTS visits_after_Update;
DROP TRIGGER IF EXISTS visits_after_Delete;

-- Diagnosis table
DROP TRIGGER IF EXISTS diagnosis_after_Insert;
DROP TRIGGER IF EXISTS diagnosis_after_Update;
DROP TRIGGER IF EXISTS diagnosis_after_Delete;

-- prescription table 
DROP TRIGGER IF EXISTS prescription_after_Insert;
DROP TRIGGER IF EXISTS prescription_after_Update;
DROP TRIGGER IF EXISTS prescription_after_Delete;

-- Doctors table
-- Insert trigger
DELIMITER //
CREATE TRIGGER doctors_after_Insert AFTER INSERT ON doctors
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO doctors_audit_table VALUES 
	(DEFAULT, 
	NEW.Doctor_ID ,
	NEW.Doctor_First_Name ,
	NEW.Doctor_Last_Name , 
	NEW.Doctor_Email ,
	NEW.Doctor_Contact, 
	'Insert',
	NOW(),
	u_name);
End//

-- Update trigger
DELIMITER //
CREATE TRIGGER doctors_after_Update AFTER UPDATE ON doctors
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO doctors_audit_table VALUES 
	(DEFAULT, 
	OLD.Doctor_ID ,
	OLD.Doctor_First_Name ,
	OLD.Doctor_Last_Name , 
	OLD.Doctor_Email ,
	OLD.Doctor_Contact,
	'Update',
	NOW(),
	u_name);
End//

-- Delete trigger
DELIMITER //
CREATE TRIGGER doctors_after_Delete AFTER DELETE ON doctors
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO doctors_audit_table VALUES 
	(DEFAULT, 
	OLD.Doctor_ID ,
	OLD.Doctor_First_Name ,
	OLD.Doctor_Last_Name , 
	OLD.Doctor_Email ,
	OLD.Doctor_Contact,
	'Delete',
	NOW(),
	u_name);
End//


-- Patients table
-- Insert trigger
DELIMITER //
CREATE TRIGGER patients_after_Insert AFTER INSERT ON patients
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO patients_audit_table VALUES 
	(DEFAULT, 
	NEW.Patient_ID ,
	NEW.First_Name ,
	NEW.Last_Name , 
	NEW.DOB ,
	NEW.Health_Insurance_Provider_Company_ID,
	'Insert',
	NOW(),
	u_name);
End//

DROP TRIGGER IF EXISTS patients_after_Update;
-- Update triger

DELIMITER //
CREATE TRIGGER patients_after_Update AFTER UPDATE ON patients
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO patients_audit_table VALUES 
	(DEFAULT, 
	OLD.Patient_ID ,
	OLD.First_Name ,
	OLD.Last_Name , 
	OLD.DOB ,
	OLD.Health_Insurance_Provider_Company_ID,
	'Update',
	NOW(),
	u_name);
End//

-- Delete triger
DELIMITER //
CREATE TRIGGER patients_after_Delete AFTER DELETE ON patients
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO patients_audit_table VALUES 
	(DEFAULT, 
	OLD.Patient_ID ,
	OLD.First_Name ,
	OLD.Last_Name , 
	OLD.DOB ,
	OLD.Health_Insurance_Provider_Company_ID,
	'Delete',
	NOW(),
	u_name);
End//

-- creating triggers on billing table 
-- Insert trigger
delimiter //
CREATE TRIGGER billing_after_Insert AFTER INSERT ON patient_bills
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO billing_auidt_table VALUES 
	(DEFAULT,    
	NEW.Bill_ID,
	NEW.Total_Bill , 
	NEW.Insuance_Amount,
	NEW.Balance_Due,
	NEW.Visits_Visit_ID,
	"Insert",
	NOW(),
	u_name);
End//

-- Update trigger
delimiter //
CREATE TRIGGER billing_after_Update AFTER UPDATE ON patient_bills
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO billing_auidt_table VALUES 
	(DEFAULT,    
	OLD.Bill_ID,
	OLD.Total_Bill , 
	OLD.Insuance_Amount,
	OLD.Balance_Due,
	OLD.Visits_Visit_ID,
	"Update",
	NOW(),
	u_name);
End//

-- Delete trigger
delimiter //
CREATE TRIGGER billing_after_Delete AFTER DELETE ON patient_bills
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO billing_auidt_table VALUES 
	(DEFAULT,    
	OLD.Bill_ID,
	OLD.Total_Bill , 
	OLD.Insuance_Amount,
	OLD.Balance_Due,
	OLD.Visits_Visit_ID,
	"Delete",
	NOW(),
	u_name);
End//

-- insert triger
DELIMITER //
CREATE TRIGGER visits_after_Insert AFTER INSERT ON visits
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO visit_audit_table VALUES 
	(default,  
	NEW.Visit_ID  ,
	NEW.Visit_Facility ,
	NEW.In_time ,
	NEW.Out_time ,
	NEW.Patients_Patient_ID ,
	NEW.Doctors_Doctor_ID ,
	NEW.Exam_Rooms_Room_ID ,
	'Insert',
	 NOW(),
	u_name);
END//

-- update triger
DELIMITER //
CREATE TRIGGER visits_after_Update AFTER UPDATE ON visits
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO visit_audit_table VALUES 
	(default,  
	OLD.Visit_ID  ,
	OLD.Visit_Facility ,
	OLD.In_time ,
	OLD.Out_time ,
	OLD.Patients_Patient_ID ,
	OLD.Doctors_Doctor_ID ,
	OLD.Exam_Rooms_Room_ID ,
	'Update',
	 NOW(),
	u_name);
END//

-- delete triger
DELIMITER //
CREATE TRIGGER visits_after_Delete AFTER DELETE ON visits
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO visit_audit_table VALUES 
	(default,  
	OLD.Visit_ID  ,
	OLD.Visit_Facility ,
	OLD.In_time ,
	OLD.Out_time ,
	OLD.Patients_Patient_ID ,
	OLD.Doctors_Doctor_ID ,
	OLD.Exam_Rooms_Room_ID ,
	'Delete',
	 NOW(),
	u_name);
END//


-- Diagnosis table
-- Insert trigger
DELIMITER //
CREATE TRIGGER diagnosis_after_Insert AFTER INSERT ON diagnosis
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO diagnosis_audit_table VALUES 
	(DEFAULT, 
	NEW.Diagnosis_ID ,
	NEW.Diagnosis_Description ,
	NEW.Visits_Visit_ID , 
	'Insert',
	NOW(),
	u_name);
End//

-- Update trigger
DELIMITER //
CREATE TRIGGER diagnosis_after_Update AFTER UPDATE ON diagnosis
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO diagnosis_audit_table VALUES 
	(DEFAULT, 
	OLD.Diagnosis_ID ,
	OLD.Diagnosis_Description ,
	OLD.Visits_Visit_ID , 
	'Update',
	NOW(),
	u_name);
End//

-- Delete trigger
DELIMITER //
CREATE TRIGGER diagnosis_after_Delete AFTER DELETE ON diagnosis
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO diagnosis_audit_table VALUES 
	(DEFAULT, 
	OLD.Diagnosis_ID ,
	OLD.Diagnosis_Description ,
	OLD.Visits_Visit_ID ,  
	'Delete',
	NOW(),
	u_name);
End//

-- Insert trigger
DELIMITER //
CREATE TRIGGER prescription_after_Insert AFTER INSERT ON prescription
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO prescription_audit_table VALUES 
	(DEFAULT, 
	NEW.Prescription_ID ,
	NEW.Medication_Description ,
    NEW.Visits_Visit_ID,
	'Insert',
	NOW(),
	u_name);
End//

-- Update trigger
DELIMITER //
CREATE TRIGGER prescription_after_Update AFTER UPDATE ON prescription
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO prescription_audit_table VALUES 
	(DEFAULT, 
	OLD.Prescription_ID ,
	OLD.Medication_Description ,
    OLD.Visits_Visit_ID,
	'Update',
	NOW(),
	u_name);
End//

-- Delete trigger
DELIMITER //
CREATE TRIGGER prescription_after_delete AFTER DELETE ON prescription
FOR EACH ROW 
BEGIN 
	DECLARE u_name VARCHAR(50);
	SELECT USER() INTO u_name;
	INSERT INTO prescription_audit_table VALUES 
	(DEFAULT, 
	OLD.Prescription_ID ,
	OLD.Medication_Description ,
    OLD.Visits_Visit_ID,
	'Delete',
	NOW(),
	u_name);
End//
