-- 1. shows a view of patient visits, the doctors visited and diagnosis given
DROP VIEW IF EXISTS patient_diagnosis_view;
CREATE VIEW patient_diagnosis_view AS
SELECT p.Patient_ID, p.First_Name, p.Last_Name,
       v.Visit_ID, v.IN_time,
       d.Diagnosis_Description, concat(dd.Doctor_First_Name," ",dd.Doctor_Last_Name) AS Doctor_NAME
FROM patients p
JOIN visits v 
ON v.Patients_Patient_ID=p.Patient_ID
JOIN diagnosis d 
ON d.Visits_Visit_ID = v.Visit_ID
JOIN doctors dd 
ON v.Doctors_Doctor_ID = dd.Doctor_ID;

-- 2. patient bill details for each visit
DROP VIEW IF EXISTS patient_bill_view;
CREATE VIEW patient_bill_view AS
SELECT p.Patient_ID, p.First_Name, p.Last_Name, 
       v.Visit_ID, v.IN_time,  
       b.Total_Bill, b.Insuance_Amount,b.Balance_Due 
FROM patients p
JOIN visits v 
ON v.Patients_Patient_ID=p.Patient_ID
RIGHT JOIN patient_bills b 
ON b.Visits_Visit_ID = v.Visit_ID;

-- 3. view that displays patient name,ID,doctor name and medication details in each visit to the hospital
DROP VIEW IF EXISTS patient_prescription_view;
CREATE VIEW patient_prescription_view AS
SELECT v.Patients_Patient_ID,v.visit_id,
       CONCAT(First_name," ",Last_name) as Patient_Name,
       p.medication_description AS "Medication",
       CONCAT(doctor_first_name," ",doctor_last_name) as Docotor_Name
FROM patients t
JOIN visits v ON t.patient_id=v.Patients_Patient_ID
JOIN prescription p ON p.Visits_Visit_ID=v.visit_id
JOIN doctors d ON d.doctor_id=v.Doctors_Doctor_ID;

-- 4. patients and their visits
DROP VIEW IF EXISTS patient_visits_view;
CREATE VIEW patient_visits_view AS
SELECT CONCAT(first_name," ",last_name) as Patient_Name,
       count(t.Patients_Patient_ID) "Number of visits"
FROM visits t
JOIN patients p ON t.Patients_Patient_ID=p.patient_id
GROUP BY patient_name
HAVING count(t.Patients_Patient_ID)>=1;

-- 5. patient ID and their total billing amount of all visits to clinic
DROP VIEW IF EXISTS patient_billing_allvisits_view;
CREATE VIEW patient_billing_allvisits_view AS
SELECT v.Patients_Patient_ID, SUM(Total_bill) AS "Total Billing amount of all visits"
FROM patients p 
JOIN visits v
on v.Patients_Patient_ID=p.Patient_ID
JOIN patient_bills b
on b.Visits_Visit_ID=v.Visit_ID
GROUP BY(v.Patients_Patient_ID);


