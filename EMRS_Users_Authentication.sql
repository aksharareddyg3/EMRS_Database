-- creating a admin user
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT SELECT ON dental_clinic.* TO 'admin'@'localhost';
GRANT INSERT ON dental_clinic.* TO 'admin'@'localhost';
GRANT UPDATE ON dental_clinic.* TO 'admin'@'localhost';
GRANT DELETE ON dental_clinic.* TO 'admin'@'localhost';


-- creating a doctor user
CREATE USER 'doctor'@'localhost' IDENTIFIED BY 'doctor';
GRANT SELECT ON patients TO 'doctor'@'localhost';
GRANT INSERT ON patients TO 'doctor'@'localhost';
GRANT UPDATE ON patients TO 'doctor'@'localhost';
GRANT SELECT ON patient_contact_details TO 'doctor'@'localhost';
GRANT INSERT ON patient_contact_details TO 'doctor'@'localhost';
GRANT UPDATE ON patient_contact_details TO 'doctor'@'localhost';
GRANT SELECT ON diagnosis TO 'doctor'@'localhost';
GRANT INSERT ON diagnosis TO 'doctor'@'localhost';
GRANT UPDATE ON diagnosis TO 'doctor'@'localhost';
GRANT SELECT ON prescription TO 'doctor'@'localhost';
GRANT INSERT ON prescription TO 'doctor'@'localhost';
GRANT UPDATE ON prescription TO 'doctor'@'localhost';
GRANT SELECT ON visits TO 'doctor'@'localhost';
GRANT INSERT ON visits TO 'doctor'@'localhost';
GRANT UPDATE ON visits TO 'doctor'@'localhost';

-- creating a receptionist user
CREATE USER 'receptionist'@'localhost' IDENTIFIED BY 'receptionist';
GRANT SELECT ON patients TO 'receptionist'@'localhost';
GRANT INSERT ON patients TO 'receptionist'@'localhost';
GRANT UPDATE ON patients TO 'receptionist'@'localhost';
GRANT DELETE ON patients TO 'receptionist'@'localhost';
GRANT SELECT ON patient_contact_details TO 'receptionist'@'localhost';
GRANT INSERT ON patient_contact_details TO 'receptionist'@'localhost';
GRANT UPDATE ON patient_contact_details TO 'receptionist'@'localhost';
GRANT DELETE ON patient_contact_details TO 'receptionist'@'localhost';
GRANT SELECT ON visits TO 'receptionist'@'localhost';
GRANT INSERT ON visits TO 'receptionist'@'localhost';
GRANT UPDATE ON visits TO 'receptionist'@'localhost';
GRANT DELETE ON visits TO 'receptionist'@'localhost';
GRANT SELECT ON patient_bills TO 'receptionist'@'localhost';
GRANT INSERT ON patient_bills TO 'receptionist'@'localhost';
GRANT UPDATE ON patient_bills TO 'receptionist'@'localhost';
GRANT DELETE ON patient_bills TO 'receptionist'@'localhost';
