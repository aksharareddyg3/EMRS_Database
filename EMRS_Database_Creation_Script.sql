-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Dental_Clinic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Dental_Clinic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Dental_Clinic` DEFAULT CHARACTER SET utf8 ;
USE `Dental_Clinic` ;

-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Health_Insurance_Provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Health_Insurance_Provider` (
  `Company_ID` INT NOT NULL,
  `Company_Name` VARCHAR(45) NOT NULL,
  `Company_Location` VARCHAR(60) NOT NULL,
  `Company_Contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Company_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Patients` (
  `Patient_ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `DOB` DATE NULL,
  `Health_Insurance_Provider_Company_ID` INT NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  INDEX `fk_Patients_Health_Insurance_Provider1_idx` (`Health_Insurance_Provider_Company_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Patients_Health_Insurance_Provider1`
    FOREIGN KEY (`Health_Insurance_Provider_Company_ID`)
    REFERENCES `Dental_Clinic`.`Health_Insurance_Provider` (`Company_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Patient_Contact_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Patient_Contact_Details` (
  `Home_Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Patients_Patient_ID` INT NOT NULL,
  INDEX `fk_Patient_Contact_Details_Patients1_idx` (`Patients_Patient_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Contact_Details_Patients1`
    FOREIGN KEY (`Patients_Patient_ID`)
    REFERENCES `Dental_Clinic`.`Patients` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Exam_Rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Exam_Rooms` (
  `Room_ID` INT NOT NULL,
  `Exam_Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Room_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Doctors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Doctors` (
  `Doctor_ID` INT NOT NULL,
  `Doctor_First_Name` VARCHAR(45) NOT NULL,
  `Doctor_Last_Name` VARCHAR(45) NOT NULL,
  `Doctor_Email` VARCHAR(45) NOT NULL,
  `Doctor_Contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Doctor_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Visits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Visits` (
  `Visit_ID` INT NOT NULL,
  `Visit_Facility` VARCHAR(45) NOT NULL,
  `In_Time` DATETIME NULL,
  `Out_Time` DATETIME NULL,
  `Patients_Patient_ID` INT NOT NULL,
  `Doctors_Doctor_ID` INT NOT NULL,
  `Exam_Rooms_Room_ID` INT NOT NULL,
  PRIMARY KEY (`Visit_ID`),
  INDEX `fk_Visits_Patients1_idx` (`Patients_Patient_ID` ASC) VISIBLE,
  INDEX `fk_Visits_Doctors1_idx` (`Doctors_Doctor_ID` ASC) VISIBLE,
  INDEX `fk_Visits_Exam_Rooms1_idx` (`Exam_Rooms_Room_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Visits_Patients1`
    FOREIGN KEY (`Patients_Patient_ID`)
    REFERENCES `Dental_Clinic`.`Patients` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visits_Doctors1`
    FOREIGN KEY (`Doctors_Doctor_ID`)
    REFERENCES `Dental_Clinic`.`Doctors` (`Doctor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visits_Exam_Rooms1`
    FOREIGN KEY (`Exam_Rooms_Room_ID`)
    REFERENCES `Dental_Clinic`.`Exam_Rooms` (`Room_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Diagnosis` (
  `Diagnosis_ID` INT NOT NULL,
  `Diagnosis_Description` VARCHAR(1000) NOT NULL,
  `Visits_Visit_ID` INT NOT NULL,
  PRIMARY KEY (`Diagnosis_ID`),
  INDEX `fk_Diagnosis_Visits1_idx` (`Visits_Visit_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Diagnosis_Visits1`
    FOREIGN KEY (`Visits_Visit_ID`)
    REFERENCES `Dental_Clinic`.`Visits` (`Visit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Patient_Bills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Patient_Bills` (
  `Bill_ID` INT NOT NULL,
  `Total_Bill` DECIMAL(10,2) NOT NULL,
  `Insuance_Amount` DECIMAL(10,2) NOT NULL,
  `Balance_Due` DECIMAL(10,2) NOT NULL,
  `Visits_Visit_ID` INT NOT NULL,
  PRIMARY KEY (`Bill_ID`),
  INDEX `fk_Patient_Bills_Visits1_idx` (`Visits_Visit_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Bills_Visits1`
    FOREIGN KEY (`Visits_Visit_ID`)
    REFERENCES `Dental_Clinic`.`Visits` (`Visit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Prescription` (
  `Prescription_ID` INT NOT NULL,
  `Medication_Description` VARCHAR(200) NOT NULL,
  `Visits_Visit_ID` INT NOT NULL,
  PRIMARY KEY (`Prescription_ID`),
  INDEX `fk_Prescription_Visits1_idx` (`Visits_Visit_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Prescription_Visits1`
    FOREIGN KEY (`Visits_Visit_ID`)
    REFERENCES `Dental_Clinic`.`Visits` (`Visit_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Medicine_Supplier_Company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Medicine_Supplier_Company` (
  `Supplier_ID` INT NOT NULL,
  `Supplier_Address` VARCHAR(45) NULL,
  `Supplier_Name` VARCHAR(45) NOT NULL,
  `Supplier_Contact` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Supplier_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dental_Clinic`.`Medicines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Medicines` (
  `Item_ID` INT NOT NULL,
  `Item_Description` VARCHAR(45) NOT NULL,
  `Medicine_Supplier_Company_Supplier_ID` INT NOT NULL,
  PRIMARY KEY (`Item_ID`),
  INDEX `fk_Medicines_Medicine_Supplier_Company1_idx` (`Medicine_Supplier_Company_Supplier_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Medicines_Medicine_Supplier_Company1`
    FOREIGN KEY (`Medicine_Supplier_Company_Supplier_ID`)
    REFERENCES `Dental_Clinic`.`Medicine_Supplier_Company` (`Supplier_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Patients_audit_table` (
  `P_audit_ID` INT NOT NULL AUTO_INCREMENT,
  `Patient_ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `DOB` DATE NULL,
  `Health_Insurance_Provider_Company_ID` INT NOT NULL,
  `action_type` VARCHAR(20) NULL,
  `action_date` DATETIME NULL,
  `user_name` VARCHAR(50) NULL,
  PRIMARY KEY (`P_audit_ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Billing_audit_table` (
  `b_audit_ID` INT NOT NULL AUTO_INCREMENT,
  `Bill_ID` INT NOT NULL,
  `Total_Bill` DECIMAL(10,2) NOT NULL,
  `Insuance_Amount` DECIMAL(10,2) NOT NULL,
  `Balance_Due` DECIMAL(10,2) NOT NULL,
  `Visits_Visit_ID` INT NOT NULL,
  `action_type` VARCHAR(20) NULL,
  `action_date` DATETIME NULL,
  `user_name` VARCHAR(50) NULL,
  PRIMARY KEY (`b_audit_ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Visits_audit_table` (
  `v_audit_ID` INT NOT NULL AUTO_INCREMENT,
  `Visit_ID` INT NOT NULL,
  `Visit_Facility` VARCHAR(45) NOT NULL,
  `In_Time` DATETIME NULL,
  `Out_Time` DATETIME NULL,
  `Patients_Patient_ID` INT NOT NULL,
  `Doctors_Doctor_ID` INT NOT NULL,
  `Exam_Rooms_Room_ID` INT NOT NULL,
  `action_type` VARCHAR(20) NULL,
  `action_date` DATETIME NULL,
  `user_name` VARCHAR(50) NULL,
  PRIMARY KEY (`v_audit_ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Diagnosis_audit_table` (
  `d_audit_ID` INT NOT NULL AUTO_INCREMENT,
  `Diagnosis_ID` INT NOT NULL,
  `Diagnosis_Description` VARCHAR(1000) NOT NULL,
  `Visits_Visit_ID` INT NOT NULL,
  `action_type` VARCHAR(20) NULL,
  `action_date` DATETIME NULL,
  `user_name` VARCHAR(50) NULL,
  PRIMARY KEY (`d_audit_ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Doctors_audit_table` (
  `D_audit_ID` INT NOT NULL AUTO_INCREMENT,
 `Doctor_ID` INT NOT NULL,
  `Doctor_First_Name` VARCHAR(45) NOT NULL,
  `Doctor_Last_Name` VARCHAR(45) NOT NULL,
  `Doctor_Email` VARCHAR(45) NOT NULL,
  `Doctor_Contact` VARCHAR(45) NOT NULL,
  `action_type` VARCHAR(20) NULL,
  `action_date` DATETIME NULL,
  `user_name` VARCHAR(50) NULL,
  PRIMARY KEY (`D_audit_ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`prescription_audit_table` (
  `pres_audit_ID` INT NOT NULL AUTO_INCREMENT,
  `Prescription_ID` INT NOT NULL,
  `Medication_Description` VARCHAR(200) NOT NULL,
  `Visits_Visit_ID` INT NOT NULL,
  `action_type` VARCHAR(20) NULL,
  `action_date` DATETIME NULL,
  `user_name` VARCHAR(50) NULL,
  PRIMARY KEY (`pres_audit_ID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Dental_Clinic`.`Users` (
  `user_name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `Role` VARCHAR(50) NULL,
  PRIMARY KEY (`user_name`, `password`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
