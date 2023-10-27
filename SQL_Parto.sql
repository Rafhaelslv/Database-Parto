USE master
DROP DATABASE PARTO
CREATE DATABASE PARTO
USE PARTO
GO
CREATE TABLE BEBE (
id_bebe			INT				NOT NULL IDENTITY(1, 1),
nome			VARCHAR(60)		NOT NULL,
data_nasc		DATE			NOT NULL DEFAULT(GETDATE()),
altura			DECIMAL(7,2)	NOT NULL CHECK(altura < 0),
peso			DECIMAL(4,3)	NOT NULL CHECK(peso < 0), 
maeid_mae		INT				NOT NULL,
PRIMARY KEY (id_bebe),
FOREIGN KEY (maeid_mae) REFERENCES MAE(id_mae)
)
GO
CREATE TABLE MAE (
id_mae			INT				NOT NULL IDENTITY(1001, 1),
nome			VARCHAR(60)		NOT NULL,
logradouro_end	VARCHAR(100)	NOT NULL,
numero_end		INT				NOT NULL CHECK(numero_end < 0),
cep_end			CHAR(8)			NOT NULL CHECK(cep_end = 8),
complemento_end	VARCHAR(200)	NOT NULL,
telefone		CHAR(8)			NOT NULL CHECK(telefone = 10),
data_nasc		DATE			NOT NULL
PRIMARY KEY (id_mae)
)
GO
CREATE TABLE MEDICOO (
crm_numero		INT				NOT NULL,
crm_uf			CHAR(2)			NOT NULL,
nome			VARCHAR(60)		NOT NULL,
tele_celular	CHAR(11)		NOT NULL UNIQUE, CHECK(tele_celular = 11),
especialidade	VARCHAR(30)		NOT NULL,
PRIMARY KEY (crm_numero, crm_uf)
)
GO
CREATE TABLE BEBE_MEDICO (
bebeid_bebe		INT				NOT NULL,
medicocrm_numero INT			NOT NULL,
medicocrm_uf	CHAR(2)			NOT NULL,
PRIMARY KEY (bebeid_bebe, medicocrm_numero, medicocrm_uf),
FOREIGN KEY (bebeid_bebe) REFERENCES BEBE(id_bebe),
FOREIGN KEY (medicocrm_numero, medicocrm_uf) REFERENCES MEDICOO(crm_numero, crm_uf)
)
