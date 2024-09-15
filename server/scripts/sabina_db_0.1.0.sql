CREATE DATABASE IF NOT EXISTS sabinaDB;

USE sabinaDB;

CREATE TABLE IF NOT EXISTS users(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    createdBy INT REFERENCES users(id),
    name      VARCHAR(100) NOT NULL,
    email     VARCHAR(100) NOT NULL,
    language  VARCHAR(10)  NOT NULL
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS devices(
    id        INT AUTO_INCREMENT PRIMARY KEY,:
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    token     VARCHAR(255) NOT NULL,
    family    CHAR(3), -- "IOS" o "AND"
    format    CHAR(6), -- "TABLET" o "PHONE"
    locked    BOOLEAN DEFAULT FALSE NOT NULL,
    defDevice BOOLEAN DEFAULT FALSE NOT NULL,
    phone     VARCHAR(30) NOT NULL,
    userId    INT NOT NULL REFERENCES users(id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS admins(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    userId    INT NOT NULL REFERENCES users(id)
    
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS therapists(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    userId    INT NOT NULL REFERENCES users(id)
   
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS patients(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    createdAt       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mainTherapistId INT NOT NULL REFERENCES therapists(id),
    userId          INT NOT NULL REFERENCES users(id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS sessions(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    createdAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    createdBy    INT REFERENCES users(id),
    patientId    INT NOT NULL REFERENCES patients(id),
    therapistId  INT NOT NULL REFERENCES therapists(id),
    sessionType  VARCHAR(20) NOT NULL, -- "CONSULTA", "TEÈFON", "VÍDEOCONF", "XAT"
    emergency    BOOLEAN NOT NULL DEFAULT FALSE,
    prevStart    DATETIME,
    prevDuration TIME,
    sessStart    DATETIME,
    sessDuration TIME
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS diseases(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    createdAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cie10        CHAR(15) NOT NULL UNIQUE KEY,
    description  VARCHAR(255) NOT NULL
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS diagnosis(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    createdAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    therapistId  INT NOT NULL REFERENCES therapists(id),
    patientId    INT NOT NULL REFERENCES patients(id),
    diseaseId    INT NOT NULL REFERENCES diseases(id),
    seassonId    INT NOT NULL REFERENCES seassons(id),
    ownDanger    INT NOT NULL, -- 0: No aplica, 5: Molt problable suïcida.
    outerDanger  INT NOT NULL, -- 0: Gens agressiu, 5: Molt agressiu.
    severity     INT NOT NULL -- 0: lleu, 2: moderada, 5: greu.
)

CREATE TABLE IF NOT EXISTS notes(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    createdAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    therapistId  INT NOT NULL REFERENCES therapists(id),
    seassonId    INT NOT NULL REFERENCES seassons(id),
    diagnosisId  INT NOT NULL REFERENCES diagosis(id),
    pinned       BOOLEAN NOT NULL DEFAULT FALSE,
    note         VARCHAR(255),
    severity     INT NOT NULL -- 0: lleu, 2: moderada, 5: greu.
)
