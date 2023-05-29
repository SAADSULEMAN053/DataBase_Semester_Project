-- Development SQL file
-- Queries Start Here

--Creating Database

Create Database Dental_Clinic_Project;

Use Dental_Clinic_Project;


--Creating Tables
create table Patient (
   patient_Id         int,
   patient_fname      nvarchar(20)    null,
   patient_lname      nvarchar(20)    null,
   patient_gender     nvarchar(10)    null,
   patient_dob		  date,
   patient_ssn		  nvarchar(15) not null,
   patient_email      nvarchar(50) null,
   patient_address    nvarchar(60) null,
   patient_phone      nvarchar(15) null
   constraint PK_PATIENT primary key (patient_Id)
);

create table Dentist (
   dentist_Id         int,
   dentist_fname      nvarchar(20)    null,
   dentist_lname      nvarchar(20)    null,
   dentist_gender     nvarchar(10)    null,
   dentist_dob		  date,
   dentist_ssn		  nvarchar(15) not null,
   dentist_email      nvarchar(50) null,
   dentist_specialization    nvarchar(60) null,
   dentist_status      nvarchar(15) null
   
   constraint PK_DENTIST primary key (dentist_Id)
);


create table Treatment (
   treatment_Id         int,
   patient_Id int,
   dentist_Id int,
   treatment_code nvarchar(5),
   treatment_description varchar(30),
   treatment_cost smallmoney,
   constraint FK_DENTIST foreign key (dentist_Id) references Dentist(dentist_Id),
   constraint FK_PATIENT foreign key (patient_Id) references Patient(patient_Id),
   constraint PK_TREATMENT primary key (treatment_Id)
);


create table Appointments (
   appointment_Id         int,
   patient_Id int,
   dentist_Id int,
   appointment_date date,
   appointment_status varchar(10), -- Status can be i) Scheduled ii) Pending iii) In-progress iv) Completed v) Cancelled
   constraint FK_DENTIST_IN_APPOINTMENT foreign key (dentist_Id) references Dentist(dentist_Id),
   constraint FK_PATIENT_IN_APPOINTMENT foreign key (patient_Id) references Patient(patient_Id),
   constraint PK_APPOINTMENT primary key (appointment_Id)
);

create table Receipt (
   receipt_Id int,
   patient_Id int,
   treatment_Id int,
   constraint FK_PATIENT_IN_RECEIPT foreign key (patient_Id) references Patient(patient_Id),
   constraint PK_RECEIPT primary key (receipt_Id)
);

create table Insurance (
   insurance_Id int,
   patient_Id int,
   insurance_provider varchar(50),
   insurance_status varchar(10), -- Status can be i) Active ii) In-Active
   insurance_type varchar(10), 
   remaining_amount smallmoney,
   constraint FK_PATIENT_IN_INSURANCE  foreign key (patient_Id) references Patient(patient_Id),
   constraint PK_INSURANCE primary key (insurance_Id)
);


create table Employee (
   employee_Id         int,
   employee_fname      nvarchar(20)    null,
   employee_lname      nvarchar(20)    null,
   employee_gender     nvarchar(10)    null,
   employee_dob		  date,
   employee_email      nvarchar(50) null,
   employee_salary    smallmoney,
   employee_designation nvarchar(50),
   constraint PK_EMPLOYEE primary key (employee_Id)
);

create table Equiptments (
   equipment_Id         int,
   equipment_name      nvarchar(20)    null,
   quantity int,
   availibility varchar(20),
   constraint PK_EQUIPMENT primary key (equipment_Id)
);

create table Analysis_Reports (
   report_Id         int,
   report_type      nvarchar(20)    null,
   report_date date,
   analysis_data varchar(50),
   constraint PK_REPORT primary key (report_Id)
);

create table Tax(
   tax_Id         int,
   tax_type      nvarchar(20)    null,
   tax_rate      decimal ,
   constraint PK_TAX primary key (tax_Id)
);
