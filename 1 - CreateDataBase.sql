/**
 This script will create database and few tables in SQL server with some relationships
*/

/**
Create database named "RelationalDbEssentials"
*/

CREATE DATABASE [RelationalDbEssentials]
GO

/**
Create table patient_demographics
*/
USE [RelationalDbEssentials]
GO

CREATE TABLE [dbo].[patient_demographics](
	[patient_id] [int] NOT NULL,
	[patient_firstname] [varchar](100) NOT NULL,
	[patient_lastname] [varchar](100) NOT NULL,
	[patient_middlename] [varchar](100) NULL,
	[patient_dob] [date] NOT NULL,
	[patient_gender] [varchar](20) NOT NULL,
	[created_datetime] [datetime] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
 CONSTRAINT [PK_patient_demographics] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[patient_demographics] ADD  CONSTRAINT [DF_patient_demographics_created_datetime]  DEFAULT (getdate()) FOR [created_datetime]
GO

/**
Create table patient_contacts
*/

USE [RelationalDbEssentials]
GO

CREATE TABLE [dbo].[patient_contacts](
	[contact_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[contact_type] [varchar](50) NOT NULL,
	[contact_no] [varchar](20) NOT NULL,
 CONSTRAINT [PK_patient_contacts] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[patient_contacts]  WITH CHECK ADD  CONSTRAINT [FK_patient_contacts_patient_demographics] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient_demographics] ([patient_id])
GO

ALTER TABLE [dbo].[patient_contacts] CHECK CONSTRAINT [FK_patient_contacts_patient_demographics]
GO

/**
Create table patient_registration
*/

USE [RelationalDbEssentials]
GO

CREATE TABLE [dbo].[patient_registration](
	[registration_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[registration_datetime] [datetime] NOT NULL,
	[referral_doctor] [varchar](200) NULL,
	[created_datetime] [datetime] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
 CONSTRAINT [PK_patient_registration] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[patient_registration]  WITH CHECK ADD  CONSTRAINT [FK_patient_registration_patient_demographics] FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient_demographics] ([patient_id])
GO

ALTER TABLE [dbo].[patient_registration] CHECK CONSTRAINT [FK_patient_registration_patient_demographics]
GO

/**
Create table audit_patient_registration
*/

USE [RelationalDbEssentials]
GO

CREATE TABLE [dbo].[audit_patient_registration](
	[registration_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[registration_datetime] [datetime] NOT NULL,
	[referral_doctor] [varchar](200) NULL,
	[created_datetime] [datetime] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[action] [varchar](20) NOT NULL,
	[logdate] [datetime] NOT NULL
) ON [PRIMARY]
GO

