-- Inserting Doctors Records
INSERT INTO doctors VALUES(101,'Chauncey','Motley',"chauncey_motley@opclinic.com",5046218927);
INSERT INTO doctors VALUES(102,'Brittni','Gillaspie',"bgillaspie@opclinic.com",2082069848);
INSERT INTO doctors VALUES(103,'Dorothy','Chesterfield',"dorothyc@opclinic.com",8586177834);
INSERT INTO doctors VALUES(104,'Gilma','Liukko',"gilma_liukko@opclinic.com",5163939967);
INSERT INTO doctors VALUES(105,'Glory','Schieler',"glorys@opclinic.com",3258692649);
INSERT INTO doctors VALUES(106,'Nickolas','Juvera',"nickolas_juvera@opclinic.com",3525988301);
INSERT INTO doctors VALUES(107,'Leslie','Threets',"lthreets@opclinic.com",9148619748);
INSERT INTO doctors VALUES(108,'Jacqueline','Rowling',"jacqueline.rowling@opclinic.com",8148658113);
INSERT INTO doctors VALUES(109,'Keneth','Borgman',"kenethb@opclinic.com",6029194211);
INSERT INTO doctors VALUES(110,'Nichelle','Meteer',"nichelle_meteer@opclinic.com",7732259985);

-- Inserting Insurance Company Records
INSERT INTO Health_Insurance_Provider VALUES (121,'South Carolina Health Insurance','Greenville',7192232074);
INSERT INTO Health_Insurance_Provider VALUES (122,'Aetna','Columbia',2124225427);
INSERT INTO Health_Insurance_Provider VALUES (123,'United Health One','Charleston',6103787332);
INSERT INTO Health_Insurance_Provider VALUES (124,'Humana One','Clemson',4102342267);
INSERT INTO Health_Insurance_Provider VALUES (125,'CoventryOne','Spartanburg',9095891693);
INSERT INTO Health_Insurance_Provider VALUES (126,'Celtic','Newyork',3366702640);
INSERT INTO Health_Insurance_Provider VALUES (127,'United Health Care ','Alabama',7192232074);
INSERT INTO Health_Insurance_Provider VALUES (128,'CVS Health ','Atlanta',7145236653);
INSERT INTO Health_Insurance_Provider VALUES (129,'Kaiser Foundation ','California',5039393153);
INSERT INTO Health_Insurance_Provider VALUES (130,'Anthem ','Seattle',2153253042);

-- Inserting Patient Records
INSERT INTO patients VALUES (1, 'Portia', 'Stimmel', '1995-10-10', 129);
INSERT INTO patients VALUES (2, 'Rhea', 'Aredondo', '2008-06-07', 123);
INSERT INTO patients VALUES (3, 'Benedict', 'Sama', '1987-12-15', 124);
INSERT INTO patients VALUES (4, 'Alyce', 'Arias', '1988-08-26', 129);
INSERT INTO patients VALUES (5, 'Heike', 'Berganza', '1994-07-03', 123);
INSERT INTO patients VALUES (6, 'Carey', 'Dopico', '2001-08-16',128);
INSERT INTO patients VALUES (7, 'Dottie', 'Hellickson', '2014-10-28', 130);
INSERT INTO patients VALUES (8, 'Deandrea', 'Hughey', '2018-05-12', 122);
INSERT INTO patients VALUES (9, 'Kimberlie', 'Duenas', '2010-01-19', 128);
INSERT INTO patients VALUES (10, 'Martina', 'Staback', '2007-07-16', 130);

-- Inserting into patient_contact_details Records
INSERT INTO patient_contact_details VALUES ('3732 Sherman Ave','Bridgewater','NJ',1);
INSERT INTO patient_contact_details VALUES ('25657 Live Oak St','Brooklyn','NY',2);
INSERT INTO patient_contact_details VALUES ('4923 Carey Ave','Saint Louis','MO',3);
INSERT INTO patient_contact_details VALUES ('3196 S Rider Trl','Stockton','CA',4);
INSERT INTO patient_contact_details VALUES ('3 Railway Ave #75','Little Falls','NJ',5);
INSERT INTO patient_contact_details VALUES ('87393 E Highland Rd','Indianapolis','IN',6);
INSERT INTO patient_contact_details VALUES ('67 E Chestnut Hill Rd','Seattle','WA',7);
INSERT INTO patient_contact_details VALUES ('33 Lewis Rd #46','Burlington','NC',8);
INSERT INTO patient_contact_details VALUES ('8100 Jacksonville Rd #7','Hays','KS',9);
INSERT INTO patient_contact_details VALUES ('7 W Wabansia Ave #227','Orlando','FL',10);

-- Inserting into exam_rooms Records
INSERT INTO exam_rooms VALUES (501, 'Cavity and Toothache Room');
INSERT INTO exam_rooms VALUES ('502', 'Braces and Dental surgery Room');
INSERT INTO exam_rooms VALUES ('503', 'Other Dental issues Room');

-- Inserting into Visits Records
INSERT INTO visits VALUES(2000, 'Toothache ward', '2020-01-20 13:50:22', '2020-01-20 16:50:22', 1, 105,502);
INSERT INTO visits VALUES(2001, 'Cavity filling ward', '2020-01-20 10:50:22', '2020-01-20 12:50:22', 2, 106,503);
INSERT INTO visits VALUES(2002, 'Dental Surgery ward', '2020-01-20 06:50:22', '2020-01-20 09:50:22', 3, 107,501);
INSERT INTO visits VALUES(2003, 'Cavity filling ward', '2020-01-20 16:50:22', '2020-01-20 19:50:22', 4, 108,502);
INSERT INTO visits VALUES(2004, 'Toothache ward', '2020-01-20 16:50:22', '2020-01-20 19:50:22', 5, 105,501);
INSERT INTO visits VALUES(2005, 'Dental braces ward', '2020-01-20 20:50:22', '2020-01-20 23:50:22', 6, 106,502);
INSERT INTO visits VALUES(2006, 'Dental braces ward', '2020-01-20 16:50:22', '2020-01-20 19:50:22', 7, 107,501);
INSERT INTO visits VALUES(2007, 'Dental Surgery ward', '2020-01-20 09:50:22', '2020-01-20 12:50:22', 8, 108,503);
INSERT INTO visits VALUES(2008, 'Toothache ward', '2020-01-20 09:50:22', '2020-01-20 12:50:22', 9, 105,502);
INSERT INTO visits VALUES(2009, 'Cavity filling ward', '2020-01-20 09:50:22', '2020-01-20 12:50:22', 10, 106,501);
INSERT INTO visits VALUES(2010, 'Dental Surgery ward', '2020-01-22 11:50:22', '2020-01-22 12:50:22', 2, 107,502);
INSERT INTO visits VALUES(2011, 'Dental braces ward', '2020-01-22 09:50:22', '2020-01-22 12:50:22', 1, 106,502);


-- Inserting into Diagnosis Records
INSERT INTO diagnosis VALUES(4000, 'Toothache - Sensitive teeth - ache due to cold food items', 2000);
INSERT INTO diagnosis VALUES(4001, 'Cavities caused due to Chocolates/sugar', 2001);
INSERT INTO diagnosis VALUES(4002, 'Dental Implants ', 2002);
INSERT INTO diagnosis VALUES(4003, 'Cavities caused due to consumption of Chocolates/sugar', 2003 );
INSERT INTO diagnosis VALUES(4004, 'Toothache', 2004);
INSERT INTO diagnosis VALUES(4005, 'Braces for crooked teeth', 2005);
INSERT INTO diagnosis VALUES(4006, 'Braces for Filling teeth gap ', 2006);
INSERT INTO diagnosis VALUES(4007, 'Dental Implantation', 2007);
INSERT INTO diagnosis VALUES(4008, ' Toothache - wisdom tooth ', 2008);
INSERT INTO diagnosis VALUES(4009, 'Root canal', 2009);
INSERT INTO diagnosis VALUES(4010, 'Braces for crooked tooth', 2010);
INSERT INTO diagnosis VALUES(4011, 'Cavities', 2011);

-- Inserting into Patient_Bills Records
INSERT INTO patient_bills VALUES (8001, 500, 299.12, 200.88, 2000);
INSERT INTO patient_bills VALUES (8002, 280, 150.75, 129.25, 2001);
INSERT INTO patient_bills VALUES (8003, 280, 120.85, 159.15, 2002);
INSERT INTO patient_bills VALUES (8004, 280, 120.85, 159.15, 2003);
INSERT INTO patient_bills VALUES (8005, 280, 200.5, 79.5, 2004);
INSERT INTO patient_bills VALUES (8006, 200, 166.75, 33.25, 2005);
INSERT INTO patient_bills VALUES (8007, 280, 170.89, 109.11, 2006);
INSERT INTO patient_bills VALUES (8008, 280, 99.99, 180.01, 2007);
INSERT INTO patient_bills VALUES (8009, 280, 99.99, 180.01, 2008);
INSERT INTO patient_bills VALUES (8010, 200, 130.99, 69.01, 2009);
INSERT INTO patient_bills VALUES (8011, 280, 129.99, 150.01, 2010);

-- Inserting into medicine_supplier_company Records
INSERT INTO medicine_supplier_company VALUES (123,'Market Point Drive, Greenville, SC, 29707' ,  'David','supplier1@dc.com');
INSERT INTO medicine_supplier_company VALUES (345, 'Downtown, Greenville, SC, 28080','Jennifer','supplier2@dc.com');
INSERT INTO medicine_supplier_company VALUES (567, 'Riverside Point Dr, Greenville, SC, 29101', 'Desom','supplier3@dc.com');

-- Inserting into Medicines Records
INSERT INTO medicines VALUES (801, 'Amoxicilin ', 123);
INSERT INTO medicines VALUES (802, 'Penciclovic ', 345);
INSERT INTO medicines VALUES (803, 'erythromycin ', 123);
INSERT INTO medicines VALUES (804, 'cephalexin', 567);
INSERT INTO medicines VALUES (805, 'pencillin ', 345);
INSERT INTO medicines VALUES (806, 'celecoxib', 345);
INSERT INTO medicines VALUES (807, ' chloral hydrate ', 567);
INSERT INTO medicines VALUES (808, 'triazolam ', 123);
INSERT INTO medicines VALUES (809, 'midazolam ', 567);
INSERT INTO medicines VALUES (810, 'pilocarpine ', 345);


-- Inserting into Prescription Records
INSERT INTO prescription VALUES ('900', 'Amoxicilin - 2 times a day', 2000);
INSERT INTO prescription VALUES ('901', 'Penciclovic - 4 times a day', 2001);
INSERT INTO prescription VALUES ('902', 'pencillin - 2 times a day', 2002);
INSERT INTO prescription VALUES ('903', 'chloral hydrate- 1 times a day', 2003);
INSERT INTO prescription VALUES ('904', 'Amoxicilin - 2 times a day', 2004);
INSERT INTO prescription VALUES ('905', 'pilocarpine - 3 times a day', 2005);
INSERT INTO prescription VALUES ('906', 'midazolam - 1 times a day', 2006);
INSERT INTO prescription VALUES ('907', 'triazolam- 2 times a day', 2007);
INSERT INTO prescription VALUES ('908', 'celecoxib - 3 times a day', 2008);
INSERT INTO prescription VALUES ('909', 'Amoxicilin - 2 times a day', 2009);
INSERT INTO prescription VALUES ('910', 'triazolam - 2 times a day', 2010);
INSERT INTO prescription VALUES ('911', 'midazolam - 1 times a day', 2011);

-- Inserting into Users records
INSERT INTO users VALUES ('admin', 'admin', 'admin');
INSERT INTO users VALUES ('doctor', 'doctor', 'doctor');
INSERT INTO users VALUES ('receptionist', 'receptionist', 'receptionist');

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM patient_contact_details;
SELECT * FROM health_insurance_provider;
SELECT * FROM visits;
SELECT * FROM diagnosis;
SELECT * FROM prescription;
SELECT * FROM patient_bills;
SELECT * FROM exam_rooms;
SELECT * FROM medicines;
SELECT * FROM medicine_supplier_company;
SELECT * FROM users;
