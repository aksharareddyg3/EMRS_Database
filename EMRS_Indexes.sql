Create index diagnosis_description_index on diagnosis(diagnosis_description);
Create index doctors_index on doctors(doctor_last_name);
Create index patient_lastname_index on patients(last_name);
Create index city_index on patient_contact_details(city);
Create index bills_visitID_index on patient_bills(visits_visit_ID);
Create index IN_Time_index on visits(IN_Time);





