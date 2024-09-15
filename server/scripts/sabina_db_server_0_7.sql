-- SERVER DATABASE 0.7 ========================================================
-- mariadb --user=oper --password=Oper81Dev23 sabina
-- source D:\psicodex\sabina\db\server\sabina_db_server_0_7.sql
-- mariadb --user=oper --password=Oper81Dev23 < sabina_db_server_0_7.sql
DROP DATABASE IF EXISTS SABINA;
CREATE OR REPLACE DATABASE SABINA -- CHARACTER SET = 'latin1'
    -- COLLATE = 'latin1_spanish_ci';
    CHARACTER set utf8mb4 collate utf8mb4_bin;
USE SABINA;
-- USER AREA ==================================================================
-- USRMOD (1ra part)===================
CREATE TABLE USER (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    USER_TYPE INT UNSIGNED NOT NULL,
    PERMISSIONS INT UNSIGNED NOT NULL DEFAULT 0,
    ALIAS VARCHAR(100) NOT NULL,
    CERTIFICATE BLOB,
    STATE INT UNSIGNED NOT NULL,
    THERAPIST_ID INT UNSIGNED REFERENCES USER(ID),
    BIRTH_DATE DATE,
    FIRST_KEY INT NOT NULL,
    FIRST_CONN DATETIME,
    CREATED_BY INT UNSIGNED NOT NULL,
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME,
    INDEX (CREATED_BY)
) ENGINE = InnoDB;
CREATE TABLE DEVICE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DEVICE_TYPE INT UNSIGNED NOT NULL,
    DEVICE_STATE INT UNSIGNED NOT NULL,
    FCM_TOKEN VARCHAR(2048) NOT NULL,
    OWNER INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
CREATE TABLE FCM_HISTORY (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FCM_TOKEN VARCHAR(2048) NOT NULL,
    DEVICE_ID INT UNSIGNED NOT NULL REFERENCES DEVICE(ID),
    SINCE DATETIME,
    IS_CURRENT BOOLEAN NOT NULL DEFAULT FALSE,
    OWNER INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- LOCALIZATION AREA ==========================================================
-- LOCMOD =============================
CREATE TABLE LOCALE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LANG CHAR(2) NOT NULL,
    AUXILIAR VARCHAR(256),
    IS_DEFAULT BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE (LANG)
) ENGINE = InnoDB;
CREATE TABLE TEXT_KEY (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TEXT_KEY VARCHAR(100) NOT NULL,
    AUXILIAR VARCHAR(256),
    UNIQUE (TEXT_KEY)
) ENGINE = InnoDB;
CREATE TABLE TRANSLATION (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LOCALE INT UNSIGNED NOT NULL REFERENCES LOCALE(ID),
    TEXT_KEY_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    LITERAL VARCHAR(5000) NOT NULL,
    UNIQUE(TEXT_KEY_ID, LOCALE_ID),
    FULLTEXT (LITERAL)
) ENGINE = InnoDB;
-- USRMOD (2na part) ==================
ALTER TABLE USER
ADD COLUMN DEVICE INT UNSIGNED REFERENCES DEVICE(ID);
ALTER TABLE USER
ADD COLUMN LOCALE INT UNSIGNED NOT NULL REFERENCES LOCALE(ID);
-- LSTMOD =============================
CREATE TABLE LIST_CATEGORY (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    PARENT_ID INT UNSIGNED,
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME,
    INDEX(PARENT_ID)
) ENGINE = InnoDB;
CREATE TABLE OPTION_LIST (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    CATEGORY_ID INT UNSIGNED NOT NULL REFERENCES LIST_CATEGORY(ID),
    IS_ALPHA BOOLEAN NOT NULL DEFAULT FALSE,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
CREATE TABLE OPTION_ENTRY (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LIST_ID INT UNSIGNED NOT NULL REFERENCES OPTION_LIST(ID),
    IDX INT UNSIGNED NOT NULL,
    OPTION INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION INT UNSIGNED REFERENCES TEXT_KEY(ID),
    IS_ALPHA BOOLEAN NOT NULL DEFAULT FALSE,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- DEFINITIONS AREA ===========================================================
-- DISMOD =============================
-- DSM-V ------------------------------
CREATE TABLE DSM_V (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DNAME VARCHAR(400) NOT NULL,
    CIE_10 VARCHAR(20) NOT NULL,
    FULLTEXT (DNAME),
    FULLTEXT (CIE_10)
) ENGINE = InnoDB;
-- DISEASE ----------------------------
CREATE TABLE DISEASE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DSM_V INT UNSIGNED NOT NULL REFERENCES DSM_V(ID),
    DESCRIPTION_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    THERAPIST INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME,
    INDEX (DSM_V_ID)
) ENGINE = InnoDB;
-- PHASE ------------------------------
CREATE TABLE PHASE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IDX INT UNSIGNED NOT NULL,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DISEASE INT UNSIGNED NOT NULL REFERENCES DISEASE(ID),
    DESCRIPTION_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME,
    INDEX (DISEASE_ID, IDX)
) ENGINE = InnoDB;
-- GOAL -------------------------------
CREATE TABLE GOAL (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IDX INT UNSIGNED NOT NULL,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    PHASE INT UNSIGNED NOT NULL REFERENCES PHASE(ID),
    DESCRIPTION_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME,
    INDEX (PHASE_ID, IDX)
) ENGINE = InnoDB;
-- RESMOD =============================
-- PHASE RESOURCE ---------------------
CREATE TABLE RESOURCE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    VERSION INT UNSIGNED NOT NULL,
    ROOT_ID INT UNSIGNED NOT NULL REFERENCES RESOURCE(ID),
    LOCALE_ID INT UNSIGNED NOT NULL REFERENCES LOCALE(ID),
    TYPE INT UNSIGNED NOT NULL,
    PLAIN_TEXT INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    LINK VARCHAR(4096),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
CREATE TABLE PHASE_RESOURCE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DISEASE_ID INT UNSIGNED NOT NULL REFERENCES DISEASE(ID),
    PHASE_ID INT UNSIGNED NOT NULL REFERENCES PHASE(ID),
    RESOURCE_ID INT UNSIGNED NOT NULL REFERENCES RESOURCE(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- TCKMOD =============================
-- TRACKING ---------------------------
CREATE TABLE TRACKING (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    VERSION INT UNSIGNED NOT NULL,
    THERAPIST_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    MAIN_ID INT UNSIGNED NOT NULL REFERENCES TRACKING(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- PHASE TRACKING ---------------------
CREATE TABLE PHASE_TRACKING (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PHASE_ID INT UNSIGNED NOT NULL REFERENCES PHASE(ID),
    TRACKING_ID INT UNSIGNED NOT NULL REFERENCES TRACKING(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- TRACKING COLUMN --------------------
CREATE TABLE TRACKING_COLUMN (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TRACKING_ID INT UNSIGNED NOT NULL REFERENCES TRACKING(ID),
    LIST_ID INT UNSIGNED REFERENCES OPTION_LIST(ID),
    TITLE INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    TYPE INT UNSIGNED NOT NULL,
    MANDATORY BOOLEAN NOT NULL DEFAULT TRUE,
    CUSTOMIZED BOOLEAN NOT NULL DEFAULT FALSE,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- TSTMOD =============================
-- TRACKING ---------------------------
CREATE TABLE TEST_CATEGORY (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TITLE_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    PARENT_ID INT UNSIGNED REFERENCES TEST_CATEGORY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- TEST -------------------------------
CREATE TABLE TEST (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CATEGORY_ID INT UNSIGNED NOT NULL REFERENCES TEST_CATEGORY(ID),
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    INSTRUCTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    VERSION INT UNSIGNED NOT NULL,
    ROOT_ID INT UNSIGNED REFERENCES TEST(ID),
    THERAPIST_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE InnoDB;
-- QUESTION ---------------------------
CREATE TABLE QUESTION (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TEST_ID INT UNSIGNED REFERENCES TEST(ID),
    TYPE INT UNSIGNED NOT NULL,
    BLOCK_ID INT UNSIGNED REFERENCES QUESTION(ID),
    TITLE_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    HELP_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    MANDATORY BOOLEAN NOT NULL DEFAULT TRUE,
    CUSTOMIZED BOOLEAN NOT NULL DEFAULT FALSE,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- EMOMOD =============================
-- MOOD -------------------------------
CREATE TABLE MOOD (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    VALUE INT UNSIGNED NOT NULL,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- EMOTION ----------------------------
CREATE TABLE EMOTION (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    PARENT INT UNSIGNED REFERENCES EMOTION(ID),
    VALUE INT UNSIGNED NOT NULL,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- ADMINISTRATION AREA (1ra. etapa) ===========================================
-- VISMOD =============================
-- VISIT ------------------------------
CREATE TABLE VISIT (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    THERAPIST_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    PATIENT_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    IS_FIRST BOOLEAN NOT NULL DEFAULT FALSE,
    DATE_TIME DATETIME NOT NULL,
    TYPE INT UNSIGNED NOT NULL,
    STATE INT UNSIGNED NOT NULL,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- WORKING AREA ===============================================================
-- DGNMOD =============================
-- DIAGNOSIS --------------------------
CREATE TABLE DIAGNOSIS (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DISEASE_ID INT UNSIGNED NOT NULL REFERENCES DISEASE(ID),
    THERAPIST_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    STATE INT UNSIGNED NOT NULL,
    ANNOTATIONS VARCHAR(2048),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- DIAGNOSIS PHASE --------------------
CREATE TABLE DIAGNOSIS_PHASE (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DIAGNOSIS_ID INT UNSIGNED NOT NULL REFERENCES DIAGNOSIS(ID),
    PHASE_ID INT UNSIGNED NOT NULL REFERENCES PHASE(ID),
    VISIT_ID INT UNSIGNED NOT NULL REFERENCES VISIT(ID),
    STATE INT UNSIGNED NOT NULL,
    RELAPSE_ID INT UNSIGNED REFERENCES DIAGNOSIS_PHASE(ID),
    ANNOTATIONS VARCHAR(2048),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- ACHIEVEMENT ------------------------
CREATE TABLE ACHIEVEMENT (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    GOAL_ID INT UNSIGNED NOT NULL REFERENCES GOAL(ID),
    PHASE_ID INT UNSIGNED NOT NULL REFERENCES DIAGNOSIS_PHASE(ID),
    STATE INT UNSIGNED NOT NULL,
    RELAPSE_ID INT UNSIGNED REFERENCES ACHIEVEMENT(ID),
    ANNOTATIONS VARCHAR(2048),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- MATMOD =============================
-- MATERIAL ---------------------------
CREATE TABLE MATERIAL (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME_ID INT UNSIGNED NOT NULL REFERENCES TEXT_KEY(ID),
    DESCRIPTION_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    RESOURCE_ID INT UNSIGNED NOT NULL REFERENCES RESOURCE(ID),
    TYPE INT UNSIGNED NOT NULL,
    PLAIN_TEXT_ID INT UNSIGNED REFERENCES TEXT_KEY(ID),
    LINK VARCHAR(4096),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- PHASE MATERIAL ---------------------
CREATE TABLE PHASE_MATERIAL (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PHASE_RESOURCE_ID INT UNSIGNED NOT NULL REFERENCES RESOURCE(ID),
    PATIENT_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE InnoDB;
-- REGMOD =============================
-- REGISTER ---------------------------
CREATE TABLE REGISTER (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TRACKING_ID INT UNSIGNED NOT NULL REFERENCES TRACKING(ID),
    PATIENT_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    FIRST_DATETMIE DATETIME,
    LAST_DATETIME DATETIME,
    STATE INT UNSIGNED NOT NULL,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- REGISTER COLUMN --------------------
CREATE TABLE REGISTER_COLUMN (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    REGISTER_ID INT UNSIGNED NOT NULL REFERENCES REGISTER(ID),
    TRACK_COL_ID INT UNSIGNED NOT NULL REFERENCES TRACKING_COLUMN(ID),
    OPTION_ID INT UNSIGNED REFERENCES OPTION_LIST(ID),
    EMOTION_ID INT UNSIGNED REFERENCES EMOTION(ID),
    MOOD_ID INT UNSIGNED REFERENCES MOOD(ID),
    VALUE VARCHAR(4096),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- RESMOD =============================
-- PATIENT TEST -----------------------
CREATE TABLE PATIENT_TEST (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    THERAPIST_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    PATIENT_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    ASSIGNATION DATETIME,
    COMPLETED DATETIME,
    REVISED_BY INT UNSIGNED REFERENCES USER(ID),
    REVISED_AT DATETIME,
    VALORATION VARCHAR(4096),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- ANSWER -----------------------------
CREATE TABLE ANSWER (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TEST_ID INT UNSIGNED NOT NULL REFERENCES PATIENT_TEST(ID),
    QUESTION_ID INT UNSIGNED NOT NULL REFERENCES QUESTION(ID),
    ANSWER VARCHAR(2048),
    OPTION_ID INT UNSIGNED REFERENCES OPTION_LIST(ID),
    EMOTION_ID INT UNSIGNED REFERENCES EMOTION(ID),
    MOOD_ID INT UNSIGNED REFERENCES MOOD(ID),
    COMPLETED DATETIME,
    REVISED_BY INT UNSIGNED REFERENCES USER(ID),
    REVISED_AT DATETIME,
    VALORATION VARCHAR(4096),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- ADMINISTRATION AREA (2na. etapa) ===========================================
-- TSKMOD =============================
-- TASK -------------------------------
CREATE TABLE TASK (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    THERAPIST_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    PATIENT_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    TYPE INT UNSIGNED NOT NULL,
    STATE INT UNSIGNED NOT NULL,
    DESCRIPTION VARCHAR(2048) NOT NULL,
    TEST_ID INT UNSIGNED REFERENCES PATIENT_TEST(ID),
    REGISTER_ID INT UNSIGNED REFERENCES REGISTER(ID),
    RESOURCE_ID INT UNSIGNED REFERENCES RESOURCE(ID),
    START_DATE DATETIME,
    END_DATE DATETIME,
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- NTFMOD =============================
-- NOTIFICATION -----------------------
CREATE TABLE NOTIFICATION (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT UNSIGNED NOT NULL REFERENCES USER(ID),
    NOTIFICATION VARCHAR(1024) NOT NULL,
    TYPE INT UNSIGNED NOT NULL,
    STATE INT UNSIGNED NOT NULL,
    TEST_ID INT UNSIGNED REFERENCES PATIENT_TEST(ID),
    REGISTER_ID INT UNSIGNED REFERENCES REGISTER(ID),
    RESOURCE_ID INT UNSIGNED REFERENCES RESOURCE(ID),
    CREATED_BY INT UNSIGNED NOT NULL REFERENCES USER(ID),
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_BY INT UNSIGNED REFERENCES USER(ID),
    UPDATED_AT DATETIME
) ENGINE = InnoDB;
-- INSERCIÓ DE DADES ORIGINALS ================================================
-- TRANSLATIONS -----------------------
INSERT INTO LOCALE (LANG, IS_DEFAULT)
VALUES ("es", true);
SET @loc_esid = LAST_INSERT_ID();
INSERT INTO LOCALE (LANG, IS_DEFAULT)
VALUES ("ca", false);
SET @loc_caid = LAST_INSERT_ID();
INSERT INTO LOCALE (LANG, IS_DEFAULT)
VALUES ("en", false);
SET @loc_enid = LAST_INSERT_ID();
INSERT INTO LOCALE (LANG, IS_DEFAULT)
VALUES ("fr", false);
SET @loc_frid = LAST_INSERT_ID();
INSERT INTO LOCALE (LANG, IS_DEFAULT)
VALUES ("pt", false);
SET @loc_ptid = LAST_INSERT_ID();
INSERT INTO USER (
        USER_TYPE,
        PERMISSIONS,
        ALIAS,
        CERTIFICATE,
        STATE,
        FIRST_KEY,
        FIRST_CONN,
        LAST_DEVICE_ID,
        LOCALE_ID,
        CREATED_BY,
        CREATED_AT
    )
VALUES (
        1,
        4294967295,
        "Root",
        NULL,
        100,
        1,
        CURRENT_TIMESTAMP,
        NULL,
        @loc_caid,
        1,
        CURRENT_TIMESTAMP
    );
ALTER TABLE USER
ADD CONSTRAINT FOREIGN KEY (CREATED_BY) REFERENCES USER(ID);
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("es");
SET @txt_esid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("ca");
SET @txt_caid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("en");
SET @txt_enid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("fr");
SET @txt_frid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("pt");
SET @txt_ptid = LAST_INSERT_ID();
-- CASTELLA -------
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL) -- CASTELLÀ
VALUES (@loc_esid, @txt_esid, 'Español'),
    (@loc_esid, @txt_caid, 'Catalán'),
    (@loc_esid, @txt_enid, 'Inglés'),
    (@loc_esid, @txt_frid, 'Francés'),
    (@loc_esid, @txt_ptid, 'Portugués'),
    -- CATALÀ
    (@loc_caid, @txt_esid, 'Espanyol'),
    (@loc_caid, @txt_caid, 'Català'),
    (@loc_caid, @txt_enid, 'Anglès'),
    (@loc_caid, @txt_frid, 'Francès'),
    (@loc_caid, @txt_ptid, 'Portuguès'),
    -- ANGLÈS
    (@loc_enid, @txt_esid, 'Spanish'),
    (@loc_enid, @txt_caid, 'Catalan'),
    (@loc_enid, @txt_enid, 'English'),
    (@loc_enid, @txt_frid, 'French'),
    (@loc_enid, @txt_ptid, 'Portuguese'),
    -- FRANCÈS
    (@loc_frid, @txt_esid, 'Espagnol'),
    (@loc_frid, @txt_caid, 'Catalan'),
    (@loc_frid, @txt_enid, 'Anglais'),
    (@loc_frid, @txt_frid, 'Français'),
    (@loc_frid, @txt_ptid, 'Portugais'),
    -- PORTUGUÈS
    (@loc_ptid, @txt_esid, 'Espanhol'),
    (@loc_ptid, @txt_caid, 'Catalão'),
    (@loc_ptid, @txt_enid, 'Inglês'),
    (@loc_ptid, @txt_frid, 'Francês'),
    (@loc_ptid, @txt_ptid, 'Português');
-- DSM-V ------------------------------
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("E66.9", "Sobrepeso u obesidad"),
    (
        "F01.50",
        "Trastorno neurocognitivo mayor posiblemente debido a una enfermedad vascular, sin alteración del comportamiento"
    ),
    (
        "F01.50",
        "Trastorno neurocognitivo mayor probablemente debido a una enfermedad vascular, sin alteración del comportamiento"
    ),
    (
        "F01.51",
        "Trastorno neurocognitivo mayor posiblemente debido a una enfermedad vascular, con alteración del comportamiento"
    ),
    (
        "F01.51",
        "Trastorno neurocognitivo mayor probablemente debido a una enfermedad vascular, con alteración del comportamiento"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a una degeneración del lóbulo frontotemporal posible, sin alteración del comportamiento (codificar en primer lugar G31.09 la enfermedad frontotemporal)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor posible con cuerpos de Lewy, sin alteración del comportamiento (codificar en primer lugar G31.83 la enfermedad con cuerpos de Lewy)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor posible debido a la enfermedad de Alzheimer, sin alteración del comportamiento (codificar en primer lugar 331.0 la enfermedad de Alzheimer)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor posiblemente debido a la enfermedad de Parkinson, sin alteración del comportamiento (codificar en primer lugar G20 enfermedad de Parkinson)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a la enfermedad de Huntington, sin alteración del comportamiento (codificar en primer lugar G10 enfermedad de Huntington)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a un traumatismo cerebral, sin alteración del comportamiento (codificar en primer lugar S06.2X9S traumatismo cerebral difuso con pérdida de la consciencia de duración sin especificar, secuela)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a enfermedad por priones, sin alteración del comportamiento (codificar en primer lugar A81.9 enfermedad por priones)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a etiologías múltiples, sin alteración del comportamiento"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a una degeneración del lóbulo frontotemporal probable, sin alteración del comportamiento (codificar en primer lugar G31.09 enfermedad frontotemporal)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor probable con cuerpos de Lewy, sin alteración del comportamiento (codificar en primer lugar G31.83 la enfermedad por cuerpos de Lewy)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor probable debido a la enfermedad de Alzheimer, sin alteración del comportamiento (codificar en primer lugar G30.9 enfermedad de Alzheimer)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor probablemente debido a la enfermedad de Parkinson, sin alteración del comportamiento (codificar en primer lugar G20 enfermedad de Parkinson)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a una infección por VIH, sin alteración del comportamiento (codificar en primer lugar B20 infección por VIH)"
    ),
    (
        "F02.80",
        "Trastorno neurocognitivo mayor debido a otra afección médica, sin alteración del comportamiento"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a enfermedad de Huntington, con alteración del comportamiento (codificar en primer lugar G10 enfermedad de Huntington)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a la enfermedad de Alzheimer probable, con alteración del comportamiento (codificar en primer lugar G30.9 enfermedad de Alzheimer)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a otra afección médica, con alteración del comportamiento"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a etiologías múltiples, con alteración del comportamiento"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a la enfermedad de Alzheimer posible, con alteración del comportamiento (codificar en primer lugar 331.0 la enfermedad de Alzheimer)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a un traumatismo cerebral, con alteración del comportamiento (codificar en primer lugar S06.2X9S traumatismo cerebral difuso con pérdida de la consciencia de duración sin especificar, secuela)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a una enfermedad por priones, con alteración del comportamiento (codificar en primer lugar A81.9 enfermedad por priones)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor debido a una infección por VIH, con alteración del comportamiento (codificar en primer lugar B20 infección por VIH)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor posible con cuerpos de Lewy, con alteración del comportamiento (codificar en primer lugar G31.83 la enfermedad con cuerpos de Lewy)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor posible debido a una degeneración del lóbulo frontotemporal, con alteración del comportamiento (codificar en primer lugar G31.09 la enfermedad frontotemporal"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F02.81",
        "Trastorno neurocognitivo mayor posiblemente debido a la enfermedad de Parkinson, con alteración del comportamiento (codificar en primer lugar G20 la enfermedad de Parkinson)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor probable con cuerpos de Lewy, con alteración del comportamiento (codificar en primer lugar G31.83 enfermedad por cuerpos de Lewy)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor probable debido a una degeneración del lóbulo frontotemporal, con alteración del comportamiento (codificar en primer lugar G31.09 enfermedad frontotemporal)"
    ),
    (
        "F02.81",
        "Trastorno neurocognitivo mayor probablemente debido a la enfermedad de Parkinson, con alteración del comportamiento (codificar en primer lugar G20 la enfermedad de Parkinson)"
    ),
    ("F05", "Delirium debido a otra afección médica"),
    ("F05", "Delirium debido a etiologías múltiples"),
    (
        "F06.0",
        "Trastorno psicótico debido a otra afección médica, con alucinaciones"
    ),
    (
        "F06.1",
        "Catatonia no especificada (codificar en primer lugar 829.818 otros síntomas que afectan los sistemas nervioso y musculoesquelético)"
    ),
    (
        "F06.1",
        "Catatonía asociada a otro trastorno mental (específicador de catatonía)"
    ),
    (
        "F06.1",
        "Trastorno catatónico debido a otra afección médica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F06.2",
        "Trastorno psicótico debido a otra afección médica, con delirios"
    ),
    (
        "F06.31",
        "Trastorno depresivo debido a otra afección médica, con características depresivas"
    ),
    (
        "F06.32",
        "Trastorno depresivo debido a otra afección médica, con episodio del tipo de depresión mayor"
    ),
    (
        "F06.33",
        "Trastorno bipolar y trastorno relacionado debido a otra afección médica, con características maníacas"
    ),
    (
        "F06.33",
        "Trastorno bipolar y trastorno relacionado debido a otra afección médica, con episodio de tipo maníaco o hipomaníaco"
    ),
    (
        "F06.34",
        "Trastorno bipolar y trastorno relacionado debido a otra afección médica, con características mixtas"
    ),
    (
        "F06.34",
        "Trastorno depresivo debido a otra afección médica, con características mixtas"
    ),
    (
        "F06.4",
        "Trastorno de ansiedad debido a otra afección médica"
    ),
    (
        "F06.8",
        "Otro trastorno mental especificado debido a otra afección médica"
    ),
    (
        "F06.8",
        "Trastorno obsesivo-compulsivo y trastorno relacionados debidos a otra afección médica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F07.0",
        "Cambio de la personalidad debido a otra afección médica"
    ),
    (
        "F09",
        "Trastorno mental no especificado debido a otra afección médica"
    ),
    (
        "F10.10",
        "Trastorno por consumo de alcohol, leve"
    ),
    (
        "F10.121",
        "Delirium por intoxicación por alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.129",
        "Intoxicación por alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.14",
        "Trastorno depresivo inducido por el alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.14",
        "Trastorno bipolar y trastorno relacionado inducido por el alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.159",
        "Trastorno psicótico inducido por el alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.180",
        "Trastorno de ansiedad inducido por el alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.181",
        "Disfunción sexual inducida por el alcohol, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.182",
        "Trastorno del sueño inducido por el alcohol, con trastorno por consumo leve"
    ),
    (
        "F10.20",
        "Trastorno por consume de alcohol, grave"
    ),
    (
        "F10.20",
        "Trastorno por consumo de alcohol, moderado"
    ),
    (
        "F10.221",
        "Delirium por intoxicación por alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.229",
        "Intoxicación por alcohol, con trastorno por consumo moderado o grave"
    ),
    ("F10.231", "Delirium por abstinencia de alcohol"),
    (
        "F10.232",
        "Delirium, con alteraciones de la percepción"
    ),
    (
        "F10.239",
        "Abstinencia de alcohol, sin alteraciones de la percepción"
    ),
    (
        "F10.24",
        "Trastorno bipolar y trastorno relacionado inducido por el alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.24",
        "Trastorno depresivo inducido por el alcohol, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.259",
        "Trastorno psicótico inducido por el alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.26",
        "Trastorno neurocognitivo mayor inducido por el alcohol, tipo amnésico confabulatorio, con trastorno por consumo moderado o grave)"
    ),
    (
        "F10.27",
        "Trastorno neurocognitivo mayor inducido por el alcohol, tipo no amnésico confabulatorio, con trastorno por consumo moderado o grave)"
    ),
    (
        "F10.280",
        "Trastorno de ansiedad inducido por el alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.281",
        "Disfunción sexual inducida por el alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.282",
        "Trastorno del sueño inducido por el alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.288",
        "Trastorno neurocognitivo leve inducido por el alcohol, con trastorno por consumo moderado o grave"
    ),
    (
        "F10.921",
        "Delirium por intoxicación por alcohol, sin trastorno por consumo"
    ),
    (
        "F10.929",
        "Intoxicación por alcohol, sin trastorno por consumo"
    ),
    (
        "F10.94",
        "Trastorno depresivo inducido por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.94",
        "Trastorno bipolar y trastorno relacionado inducido por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.959",
        "Trastorno psicótico inducido por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.96",
        "Trastorno neurocognitivo mayor inducido por el alcohol, tipo amnésico confabulatorio, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.97",
        "Trastorno neurocognitivo mayor inducido por el alcohol, tipo no amnésico confabulatorio, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.980",
        "Trastorno de ansiedad inducido por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.981",
        "Disfunción sexual inducida por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.982",
        "Trastorno del sueño inducido por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.988",
        "Trastorno neurocognitivo leve inducido por el alcohol, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F10.99",
        "Trastorno relacionado con el alcohol no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.10",
        "Trastorno por consumo de opiáceos, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.121",
        "Delirium por intoxicación por opiáceos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.122",
        "Intoxicación por opiáceos, con alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.129",
        "Intoxicación por opiáceos, sin alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.14",
        "Trastorno depresivo inducido por opiáceos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.181",
        "Disfunción sexual inducida por opiáceos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.182",
        "Trastorno del sueño inducido por opiáceos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.188",
        "Trastorno de ansiedad inducido por opiáceos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.20",
        "Trastorno por consumo de opiáceos, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.20",
        "Trastorno por consumo de opiáceos, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.221",
        "Delirium por intoxicación por opiáceos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.222",
        "Intoxicación por opiáceos, con alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.229",
        "Intoxicación por opiáceos, sin alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F11.23", "Abstinencia a opiáceos");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F11.23", "Delirium por abstinencia a opiáceos");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.24",
        "Trastorno depresivo inducido por opiáceos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.281",
        "Disfunción sexual inducida por opiáceos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.282",
        "Trastorno del sueño inducido por opiáceos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.288",
        "Trastorno de ansiedad inducido por opiáceos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F11.921", "Delirium inducido por opiáceos");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.921",
        "Delirium por intoxicación por opiáceos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.922",
        "Intoxicación por opiáceos, con alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.929",
        "Intoxicación por opiáceos, sin alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.94",
        "Trastorno depresivo inducido por opiáceos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.981",
        "Disfunción sexual inducida por opiáceos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.982",
        "Trastorno del sueño inducido por opiáceos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.988",
        "Trastorno de ansiedad inducido por opiáceos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F11.99",
        "Trastorno relacionado con los opiáceos no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.10",
        "Trastorno por consumo de cannabis, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.121",
        "Delirium por intoxicación por cannabis, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.122",
        "Intoxicación por cannabis, con alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.129",
        "Intoxicación por cannabis, sin alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.159",
        "Trastorno psicótico inducido por cannabis, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.180",
        "Trastorno de ansiedad inducido por cannabis, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.188",
        "Trastorno del sueño inducido por cannabis, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.20",
        "Trastorno por consumo de cannabis, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.20",
        "Trastorno por consumo de cannabis, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.221",
        "Delirium por intoxicación por cannabis, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.222",
        "Intoxicación por cannabis, con alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.229",
        "Intoxicación por cannabis, sin alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.259",
        "Trastorno psicótico inducido por cannabis, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.280",
        "Trastorno de ansiedad inducido por cannabis, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F12.288", "Abstinencia de cannabis");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.288",
        "Trastorno del sueño inducido por cannabis, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.921",
        "Delirium por intoxicación por cannabis, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.922",
        "Intoxicación por cannabis, con alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.929",
        "Intoxicación por cannabis, sin alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.959",
        "Trastorno psicótico inducido por cannabis, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.980",
        "Trastorno de ansiedad inducido por cannabis, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.988",
        "Trastorno del sueño inducido por cannabis, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F12.99",
        "Trastorno no especificado relacionado con el cannabis"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.10",
        "Trastorno por consumo de sedantes, hipnóticos o ansiolíticos, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.121",
        "Delirium por intoxicación por sedantes, hipnóticos o ansiolíticos con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.129",
        "Intoxicación por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.14",
        "Trastorno depresivo inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.14",
        "Trastorno bipolar y trastorno relacionado inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.159",
        "Trastorno psicótico inducido por sedantes, hipnóticos o ansiolíticos con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.180",
        "Trastorno de ansiedad inducido por sedantes, hipnóticos o ansiolíticos, con trastorno del consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.181",
        "Disfunción sexual inducida por sedantes, hipnóticos o con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.182",
        "Trastorno del sueño inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.20",
        "Trastorno por consumo de sedantes, hipnóticos o ansiolíticos, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.20",
        "Trastorno por consumo de sedantes, hipnóticos o ansiolíticos, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.221",
        "Delirium por intoxicación por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.229",
        "Intoxicación por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.231",
        "Delirium por abstinencia a sedantes, hipnóticos o ansiolíticos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.232",
        "Abstinencia a sedantes, hipnóticos o ansiolíticos, con alteraciones de la percepción"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13239",
        "Abstinencia a sedantes, hipnóticos o ansiolíticos, sin alteraciones de la percepción"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.24",
        "Trastorno bipolar y trastorno relacionado inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.24",
        "Trastorno depresivo inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.259",
        "Trastorno psicótico inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.27",
        "Trastorno neurocognitivo mayor inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.280",
        "Trastorno de ansiedad inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.281",
        "Disfunción sexual inducida por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.282",
        "Trastorno del sueño inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.288",
        "Trastorno neurocognitivo leve inducido por sedantes, hipnóticos o ansiolíticos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.921",
        "Delirium inducido por sedantes, hipnóticos o ansiolíticos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.921",
        "Delirium por intoxicación por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.929",
        "Intoxicación por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.94",
        "Trastorno bipolar y trastorno relacionado inducido por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.94",
        "Trastorno depresivo inducido por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.959",
        "Trastorno psicótico inducido por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.97",
        "Trastorno neurocognitivo mayor inducido por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.980",
        "Trastorno de ansiedad inducido por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.981",
        "Disfunción sexual inducida por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.982",
        "Trastorno del sueño inducido por sedantes, hipnóticos o ansiolíticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.988",
        "Trastorno neurocognitivo leve inducido por sedantes, hipnóticos o ansioliticos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F13.99",
        "Trastorno relacionado con los sedantes, hipnóticos o ansiolíticos no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.10",
        "Trastorno por consumo de cocaína, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.121",
        "Delirium por intoxicación por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.122",
        "Intoxicación por cocaína, con alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.129",
        "Intoxicación por cocaína, sin alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.14",
        "Trastorno bipolar y trastorno relacionado inducido por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.14",
        "Trastorno depresivo inducido por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.159",
        "Trastorno psicótico inducido por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.180",
        "Trastorno de ansiedad inducido por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.181",
        "Disfunción sexual inducida por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.182",
        "Trastorno del sueño inducido por cocaína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.188",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por cocaína, con trastorno del consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.20",
        "Trastorno por consumo de cocaína, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.20",
        "Trastorno por consumo de cocaína, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.221",
        "Síndrome de abstinencia por intoxicación por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.222",
        "Intoxicación por cocaína, con alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.229",
        "Intoxicación por cocaína, sin alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F14.23", "Abstinencia de cocaína");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.24",
        "Trastorno bipolar y trastorno relacionado inducido por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.24",
        "Trastorno depresivo inducido por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.259",
        "Trastorno psicótico inducido por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.280",
        "Trastorno de ansiedad inducido por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.281",
        "Disfunción sexual inducida por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.282",
        "Trastorno del sueño inducido por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.288",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por cocaína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.921",
        "Delirium por intoxicación por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.922",
        "Intoxicación por cocaína, con alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.929",
        "Intoxicación por cocaína, sin alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.94",
        "Trastorno bipolar y trastorno relacionado inducido por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.94",
        "Trastorno depresivo inducido por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.959",
        "Trastorno psicótico inducido por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.980",
        "Trastorno de ansiedad inducido por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.981",
        "Disfunción sexual inducida por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.982",
        "Trastorno del sueño inducido por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.988",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por cocaína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F14.99",
        "Trastorno relacionado con estimulantes no especificado, Trastorno relacionado con la cocaína no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.10",
        "Trastorno por consumo de sustancia anfetamínica, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.10",
        "Trastorno relacionado con el consumo de otro estimulante o un estimulante no especificado, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.121",
        "Delirium por intoxicación por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.122",
        "Intoxicación por anfetamina u otro estimulante, con alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.129",
        "Intoxicación por anfetamina u otro estimulante, sin alteraciones de la percepción, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.14",
        "Trastorno depresivo inducido por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.14",
        "Trastorno bipolar y trastorno relacionado inducido por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.159",
        "Trastorno psicótico inducido por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.180",
        "Trastorno de ansiedad inducido por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.180",
        "Trastorno de ansiedad inducido por cafeína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.181",
        "Disfunción sexual inducida por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.182",
        "Trastorno del sueño inducido por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.182",
        "Trastorno del sueño inducido por cafeína, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.188",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por anfetamina (u otro estimulante), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.20",
        "Trastorno por consumo de sustancia anfetamínica, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.20",
        "Trastorno por consumo de sustancia anfetamínica, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.20",
        "Trastorno relacionado con el consumo de otro estimulante o un estimulante no especificado, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.20",
        "Trastorno relacionado con el consumo de otro estimulante o un estimulante no especificado, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.221",
        "Delirium por intoxicación por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.222",
        "Intoxicación por anfetamina u otro estimulante, con alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.229",
        "Intoxicación por anfetamina u otro estimulante, sin alteraciones de la percepción, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.23",
        "Abstinencia a anfetamina (u otro estimulante)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.24",
        "Trastorno bipolar y trastorno relacionado inducido por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.24",
        "Trastorno depresivo inducido por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.259",
        "Trastorno psicótico inducido por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.280",
        "Trastorno de ansiedad inducido por cafeína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.280",
        "Trastorno de ansiedad inducido por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.281",
        "Disfunción sexual inducida por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.282",
        "Trastorno del sueño inducido por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.282",
        "Trastorno del sueño inducido por cafeína, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.288",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por anfetamina (u otro estimulante), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.921",
        "Delirium inducido por anfetamina (u otro estimulante)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.921",
        "Delirium por intoxicación por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.922",
        "Intoxicación por anfetamina (u otro estimulante), con alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.929",
        "Intoxicación por anfetamina (u otro estimulante), sin alteraciones de la percepción, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F15.929", "Intoxicación por cafeína");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F15.93", "Abstinencia de cafeína");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.94",
        "Trastorno bipolar y trastorno relacionado inducido por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.94",
        "Trastorno depresivo inducido por anfetamina (u otro estimulante) Trastorno depresivo, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.959",
        "Trastorno psicótico inducido por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.980",
        "Trastorno de ansiedad inducido por cafeína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.980",
        "Trastorno de ansiedad inducido por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.981",
        "Disfunción sexual inducida por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.982",
        "Trastorno del sueño inducido por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.982",
        "Trastorno del sueño inducido por cafeína, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.988",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por anfetamina (u otro estimulante), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.99",
        "Trastorno relacionado con el consumo de anfetamina u otro estimulante no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F15.99",
        "Trastorno relacionado con la cafeína no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.10",
        "Trastorno por consumo de fenciclidina, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.10",
        "Trastorno por consumo de otros alucinógenos, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.121",
        "Delirium por intoxicación por fenciclidina, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.121",
        "Delirium por intoxicación por otros alucinógenos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.129",
        "Intoxicación por fenciclidina, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.129",
        "Intoxicación por otros alucinógenos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.14",
        "Trastorno depresivo inducido por fenciclidina, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.14",
        "Trastorno bipolar y otro relacionado inducido por otros alucinógenos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.14",
        "Trastorno bipolar y trastorno relacionado inducido por fenciclidina, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.14",
        "Trastorno depresivo inducido por otro alucinógeno, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.159",
        "Trastorno psicótico inducido por otros alucinógenos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.159",
        "Trastorno psicótico inducido por fenciclidina, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.180",
        "Trastorno de ansiedad inducido por fenciclidina, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.180",
        "Trastorno de ansiedad inducido por otros alucinógenos, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.20",
        "Trastorno por consumo de fenciclidina, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.20",
        "Trastorno por consumo de fenciclidina, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.20",
        "Trastorno por consumo de otros alucinógenos, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.20",
        "Trastorno por consumo de otros alucinógenos, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.221",
        "Delirium por intoxicación por fenciclidina, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.221",
        "Delirium por intoxicación por otros alucinógenos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.229",
        "Intoxicación por fenciclidina, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.229",
        "Intoxicación por otros alucinógenos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.24",
        "Trastorno depresivo inducido por otro alucinógeno, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.24",
        "Trastorno bipolar y trastorno relacionado inducido por fenciclidina, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.24",
        "Trastorno bipolar y trastorno relacionado inducido por otro alucinógeno, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.24",
        "Trastorno depresivo inducido por fenciclidina, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.259",
        "Trastorno psicótico inducido por fenciclidina, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.259",
        "Trastorno psicótico inducido por otros alucinógenos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.280",
        "Trastorno de ansiedad inducido por fenciclidina, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.280",
        "Trastorno de ansiedad inducido por otros alucinógenos, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.921",
        "Delirium por intoxicación por fenciclidina, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.921",
        "Delirium por intoxicación por otros alucinógenos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.929",
        "Intoxicación por fenciclidina, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.929",
        "Intoxicación por otros alucinógenos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.94",
        "Trastorno depresivo inducido por otros alucinógenos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.94",
        "Trastorno bipolar y trastorno relacionado inducido por fenciclidina, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.94",
        "Trastorno bipolar y trastorno relacionado inducido por otro alucinógeno, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.94",
        "Trastorno depresivo inducido por fenciclidina, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.959",
        "Trastorno psicótico inducido por otros alucinógenos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.959",
        "Trastorno psicótico inducido por fenciclidina, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.980",
        "Trastorno de ansiedad inducido por fenciclidina, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.980",
        "Trastorno de ansiedad inducido por otros alucinógenos, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.983",
        "Trastorno de perceptivo persistente por alucinógenos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.99",
        "Trastorno relacionado con la fenciclidina no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F16.99",
        "Trastorno relacionado con los alucinógenos no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F17.200",
        "Trastorno por consumo de tabaco, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F17.200",
        "Trastorno por consumo de tabaco, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F17.203", "Abstinencia a tabaco");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F17.208",
        "Trastorno del sueño inducido por tabaco, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F17.209",
        "Trastorno relacionado con el tabaco no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.10",
        "Trastorno por consumo de inhalantes, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.121",
        "Delirium por intoxicación por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.129",
        "Intoxicación por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.14",
        "Trastorno depresivo inducido por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.159",
        "Trastorno psicótico inducido por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.17",
        "Trastorno neurocognitivo mayor inducido por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.180",
        "Trastorno de ansiedad inducido por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.188",
        "Trastorno neurocognitivo leve inducido por inhalantes, con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F1820",
        "Trastorno por consumo de inhalantes, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.20",
        "Trastorno por consumo de inhalantes, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.221",
        "Delirium por intoxicación por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.229",
        "Intoxicación por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.24",
        "Trastorno depresivo inducido por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.259",
        "Trastorno psicótico inducido por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.27",
        "Trastorno neucognitivo mayor inducido por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.280",
        "Trastorno de ansiedad inducido por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.288",
        "Trastorno neurocognitivo leve inducido por inhalantes, con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.921",
        "Delirium por intoxicación por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.929",
        "Intoxicación por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.94",
        "Trastorno depresivo inducido por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.959",
        "Trastorno psicótico inducido por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.97",
        "Trastorno neurocognitivo mayor inducido por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.980",
        "Trastorno de ansiedad inducido por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.988",
        "Trastorno neurocognitivo leve inducido por inhalantes, sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F18.99",
        "Trastorno relacionado con inhalantes no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.10",
        "Trastorno por consumo de otras sustancias (o sustancias desconocidas), leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.121",
        "Delirium por intoxicación por otra sustancia (o sustancia desconocida), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.129",
        "Intoxicación por otra sustancia (o sustancia desconocida), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.14",
        "Trastorno bipolar y trastorno relacionado inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.14",
        "Trastorno depresivo inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.159",
        "Trastorno psicótico inducido por otra sustancia (o sustancia desconocida), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.17",
        "Trastorno neurocognitivo mayor inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.180",
        "Trastorno de ansiedad inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.181",
        "Disfunción sexual inducida por otra sustancia (o sustancia desconocida), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.182",
        "Trastorno del sueño inducido por otra sustancia (o sustancia desconocida), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.188",
        "Trastorno neurocognitivo leve inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.188",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.20",
        "Trastorno por consumo de otras sustancias (o sustancias desconocidas), grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.20",
        "Trastorno por consumo de otras sustancias (o sustancias desconocidas), moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.221",
        "Delirium por intoxicación por otra sustancia (o sustancia desconocida), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.229",
        "Intoxicación por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.231",
        "Delirium por abstinencia a otra sustancia (o sustancia desconocida)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.239",
        "Abstinencia de otras sustancias (o sustancias desconocidas)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.24",
        "Trastorno bipolar y trastorno relacionado inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.24",
        "Trastorno depresivo inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.259",
        "Trastorno psicótico inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.27",
        "Trastorno neurocognitivo mayor inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.280",
        "Trastorno de ansiedad inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.281",
        "Disfunción sexual inducida por otra sustancia (o sustancia desconocida), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.282",
        "Trastorno del sueño inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.288",
        "Trastorno neurocognitivo leve inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.288",
        "Trastorno obsesivo-compulsivo y trastornos relacionados inducido por otras sustancias (o sustancias desconocidas), con trastorno por consumo moderado o grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.921",
        "Delirium inducido por otra sustancia (o sustancia desconocida)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.921",
        "Delirium por intoxicación por otra sustancia (o sustancia desconocida), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.929",
        "Intoxicación por otra sustancia (o sustancia desconocida), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.94",
        "Trastorno bipolar y trastorno relacionado inducido por otras sustancias (o sustancias desconocidas), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.94",
        "Trastorno depresivo inducido por otras sustancias (o sustancias desconocidas), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.959",
        "Trastorno psicótico inducido por otra sustancia (o sustancia desconocida), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.97",
        "Trastorno neurocognitivo mayor inducido por otras sustancias (o sustancias desconocidas), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.980",
        "Trastorno de ansiedad inducido por otra sustancia (o sustancia desconocida), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.981",
        "Disfunción sexual inducida por otra sustancia (o sustancia desconocida), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.982",
        "Trastorno del sueño inducido por otras sustancias (o sustancias desconocidas), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.988",
        "Trastorno neurocognitivo leve inducido por otras sustancias (o sustancias desconocidas), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.988",
        "Trastorno obsesivo-compulsivo y trastorno relacionado inducido por otra sustancia (o sustancia desconocida), sin trastorno por consumo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F19.99",
        "Trastorno relacionado con el uso de otras sustancias (o sustancias desconocidas) no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F20.81", "Trastorno esquizofreniforme");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F20.9", "Esquizofrenia");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F21",
        "Trastorno de la personalidad esquizotípica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F22", "Trastorno delirante");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F23", "Trastorno psicótico breve");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F25.0",
        "Trastorno esquizoafectivo, tipo bipolar"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F25.1",
        "Trastorno esquizoafectivo, tipo depresivo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F28",
        "Otro trastorno del espectro de la esquizofrenia especificado y otro trastorno psicótico"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F29",
        "Trastorno del espectro de la esquizofrenia no especificado y otro trastorno psicótico"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.0",
        "Trastorno bipolar I, episodio hipomaníaco actual o más reciente"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.11",
        "Trastorno bipolar I, episodio maniaco actual o más reciente, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.12",
        "Trastorno bipolar I, episodio maníaco actual o más reciente, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.13",
        "Trastorno bipolar I, episodio maníaco actual o más reciente, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.2",
        "Trastorno bipolar I, episodio maníaco actual o más reciente, con características psicóticas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.31",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.32",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.4",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.5",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, con características psicóticas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.71",
        "Trastorno bipolar I, episodio hipomaníaco actual o más reciente, en remisión parcial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.72",
        "Trastorno bipolar I, episodio hipomaníaco actual o más reciente, en remisión total"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.73",
        "Trastorno bipolar I, episodio maníaco actual o más reciente, en remisión parcial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.74",
        "Trastorno bipolar I, episodio maníaco actual o más reciente, en remisión total"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.75",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, en remisión parcial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.76",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, en remisión total"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F31.81", "Trastorno bipolar II");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.89",
        "Otro trastorno bipolar y trastorno relacionado especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.9",
        "Trastorno bipolar I, episodio actual o más reciente no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.9",
        "Trastorno bipolar I, episodio depresivo actual o más reciente, no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.9",
        "Trastorno bipolar I, episodio hipomaníaco actual o más reciente, no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.9",
        "Trastorno bipolar I, episodio maníaco actual o más reciente, no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F31.9",
        "Trastorno bipolar y trastorno relacionado no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.0",
        "Trastorno de depresión mayor, episodio único, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.1",
        "Trastorno de depresión mayor, episodio único, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.2",
        "Trastorno de depresión mayor, episodio único, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.3",
        "Trastorno de depresión mayor, episodio único, con características psicóticas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.4",
        "Trastorno de depresión mayor, episodio único, en remisión parcial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.5",
        "Trastorno de depresión mayor, episodio único, en remisión total"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F32.8", "Otro trastorno depresivo especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.9",
        "Otro trastorno depresivo no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F32.9",
        "Trastorno de depresión mayor, episodio único, no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.0",
        "Trastorno de depresión mayor, episodio recurrente, leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.1",
        "Trastorno de depresión mayor, episodio recurrente, moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.2",
        "Trastorno de depresión mayor, episodio recurrente, grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.3",
        "Trastorno de depresión mayor, episodio recurrente, con características psicóticas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.41",
        "Trastorno de depresión mayor, episodio recurrente, en remisión parcial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.42",
        "Trastorno de depresión, episodio recurrente, en remisión total"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F33.9",
        "Trastorno de depresión mayor, episodio recurrente, no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F34.0", "Trastorno ciclotímico");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F34.1",
        "Trastorno depresivo persistente (distimia)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F34.8",
        "Trastorno de desregulación disruptiva del estado de ánimo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F40.00", "Agorafobia");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F40.10",
        "Trastorno de ansiedad social (fobia social)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F40.218", "Fobia específica, animal");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F40.228", "Fobia específica, entorno natural");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F40.230", "Fobia específica, miedo a la sangre");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F40.231",
        "Fobia específica, miedo a las inyecciones y transfusiones"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F40.232",
        "Fobia específica, miedo a otra atención médica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F40.233",
        "Fobia específica, miedo a una lesión"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F40.248", "Fobia específica, situacional");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F40.298", "Fobia específica, otra");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F41.0", "Trastorno de pánico");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F41.1", "Trastorno de ansiedad generalizada");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F41.8",
        "Otro trastorno de ansiedad especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F41.9",
        "Otro trastorno de ansiedad no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F42",
        "Otro trastorno obsesivo-compulsivo y trastornos relacionados especificados"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F42", "Trastorno de acumulación");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F42", "Trastorno obsesivo-compulsivo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F42",
        "Trastorno obsesivo-compulsivo y trastornos relacionados no especificados"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F43.0", "Trastorno de estrés agudo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F43.10", "Trastorno de estrés postraumático");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.20",
        "Trastorno de adaptación, sin especificar"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.21",
        "Trastornos de adaptación, con estado de ánimo deprimido"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.22",
        "Trastorno de adaptación, con ansiedad"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.23",
        "Trastorno de adaptación, con ansiedad mixta y estado de ánimo deprimido"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.24",
        "Trastorno de adaptación, con alteración de la conducta"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.25",
        "Trastorno de adaptación, con alteración mixta de las emociones o la conducta"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.8",
        "Otro trastorno relacionado con traumas y factores de estrés especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F43.9",
        "Trastorno relacionado con traumas y factores de estrés especificado no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F44.0", "Amnesia disociativa");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.1",
        "Amnesia disociativa, con fuga disociativa"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.4",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con síntoma del habla"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.4",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con debilidad o parálisis"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.4",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con movimiento anómalo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.4",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con síntomas de la deglución"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.5",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con ataques o convulsiones"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.6",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con anestesia o pérdida sensitiva"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.6",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con síntoma sensitivo especial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.7",
        "Trastorno de conversión (trastorno de síntomas neurológicos funcionales), con síntomas mixtos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F44.81", "Trastorno de identidad disociativo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F44.89",
        "Otro trastorno disociativo especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F44.9", "Trastorno disociativo no especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F45.1", "Trastorno de síntomas somáticos");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F45.21", "Trastorno de ansiedad por enfermedad");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F45.22", "Trastorno dismórfico corporal");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F45.8",
        "Otros trastorno de síntomas somáticos y trastornos relacionados especificados"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F45.9",
        "Trastorno de síntomas somáticos y trastornos relacionados no especificados"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F48.1",
        "Trastorno de despersonalización/desrealización"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F50.01", "Anorexia nerviosa, tipo restrictivo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F50.02",
        "Anorexia nerviosa, tipo con atracones/purgas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F50.2", "Bulimia nerviosa");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F50.8",
        "Otro trastorno de la conducta alimentaria o de la ingesta de alimentos especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F50.8", "Pica, en adultos");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F50.8", "Trastorno de atracones");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F50.8",
        "Trastorno de evitación/restricción de la ingesta de alimentos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F50.9",
        "Trastorno de la conducta alimentaria o de la ingesta de alimentos no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F51.01", "Trastorno de insomnio");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F51.11", "Trastorno de hipersomnia");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F51.3",
        "Trastornos del despertar del sueño no REM, tipo con sonambulismo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F51.4",
        "Trastornos del despertar del sueño no REM, tipo con terrores nocturnos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F51.5", "Trastorno de pesadillas");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F52.0",
        "Trastorno de deseo sexual hipoactivo en el varón"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F52.21", "Trastorno eréctil");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F52.22",
        "Trastorno del interés/excitación sexual femenino"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F52.31", "Trastorno orgásmico femenino");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F52.32", "Eyaculación retardada");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F52.4", "Eyaculación prematura (precoz)");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F52.6",
        "Trastorno de dolor génito-pélvico/penetración"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F52.8", "Otra disfunción sexual especificada");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F52.9", "Disfunción sexual no especificada");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F54",
        "Factores psicológicos que influyen en otras afecciones médicas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.0",
        "Trastorno de la personalidad paranoide"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.1",
        "Trastorno de la personalidad esquizoide"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.2",
        "Trastorno de la personalidad antisocial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F60.3", "Trastorno de la personalidad límite");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.4",
        "Trastorno de la personalidad histriónica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.5",
        "Trastorno de la personalidad obsesivo-compulsiva"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.6",
        "Trastorno de la personalidad evitativa"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.7",
        "Trastorno de la personalidad dependiente"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.81",
        "Trastorno de la personalidad narcisista"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.89",
        "Otro trastorno de la personalidad especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F60.9",
        "Trastorno de la personalidad no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F63.0", "Juego patológico");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F63.1", "Piromanía");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F63.2", "Cleptomanía");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F63.3",
        "Tricotilomanía (trastorno de arrancarse el cabello)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F63.81", "Trastorno explosivo intermitente");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F64.1",
        "Disforia de género en adolescentes y adultos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F64.2", "Disforia de género en niños");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F64.8", "Otra disforia de género especificada");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F64.9", "Disforia de género no especificada");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.0", "Trastorno de fetichismo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.1", "Trastorno de travestismo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.2", "Trastorno de exhibicionismo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.3", "Trastorno de voyeurismo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.4", "Trastorno de pedofilia");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.51", "Trastorno de masoquismo sexual");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.52", "Trastorno de sadismo sexual");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.81", "Trastorno de frotteurismo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F65.89",
        "Otro trastorno parafílico especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F65.9", "Trastorno parafílico no especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F68.10", "Trastorno facticio");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F70",
        "Discapacidad intelectual (trastorno del desarrollo intelectual), leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F71",
        "Discapacidad intelectual (trastorno del desarrollo intelectual), moderado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F72",
        "Discapacidad intelectual (trastorno del desarrollo intelectual), grave"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F73",
        "Discapacidad intelectual (trastorno del desarrollo intelectual), profundo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F79",
        "Discapacidad intelectual (trastorno del desarrollo intelectual) no especificada"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F80.0", "Trastorno fonológico");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F80.2", "Trastorno del lenguaje");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F80.81",
        "Trastorno de la fluidez de inicio en la infancia (tartamudeo)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F80.89",
        "Trastorno de la comunicación social (pragmático)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F80.9",
        "Trastorno de la comunicación no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F81.0",
        "Trastorno específico del aprendizaje, con dificultades en la lectura"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F81.2",
        "Trastorno específico del aprendizaje, con dificultad en matemáticas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F81.81",
        "Trastorno específico del aprendizaje, con dificultad en la expresión escrita"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F82",
        "Trastorno del desarrollo de la coordinación"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F84.0", "Trastorno del espectro autista");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F88",
        "Otro trastorno del neurodesarrollo especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F88", "Retraso global del desarrollo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F89",
        "Trastorno del neurodesarrollo no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F90.0",
        "Trastorno por déficit de atención/hiperactividad, presentación predominante con falta de atención"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F90.1",
        "Trastorno por déficit de atención/hiperactividad, presentación predominante hiperactiva /impulsiva"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F90.2",
        "Trastorno por déficit de atención/hiperactividad, presentación combinada"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F90.8",
        "Otro trastorno por déficit de atención/hiperactividad especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F90.9",
        "Trastorno por déficit de atención/hiperactividad no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F91.1",
        "Trastorno de conducta, tipo de inicio infantil"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F91.2",
        "Trastorno de conducta, tipo de inicio adolescente"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F91.3", "Trastorno negativista desafiante");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F91.8",
        "Otro trastorno disruptivo, del control de los impulsos y de la conducta, especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F91.9",
        "Trastorno de conducta, tipo de inicio no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F91.9",
        "Trastorno disruptivo, del control de impulsos y de la conducta no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F93.0", "Trastorno de ansiedad por separación");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F94.0", "Mutismo selectivo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F94.1", "Trastorno de apego reactivo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F94.2",
        "Trastorno de relación social desinhibido"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F95.0", "Trastorno de tics transitorio");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F95.1",
        "Trastorno de tics motores o vocales persistente (crónico)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F95.2", "Trastorno de la Tourette");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F95.8", "Otro trastorno de tics especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F95.9", "Trastorno de tics no especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F98.0", "Enuresis");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F98.1", "Encopresis");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F98.21", "Trastorno de rumiación");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F98.3", "Pica, en niños");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F98.4",
        "Trastorno de movimientos estereotipados"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "F98.5",
        "Trastorno de la fluidez de inicio en el adulto"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F99", "Otro trastorno mental especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("F99", "Trastorno mental no especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("G21.0", "Síndrome neuroléptico maligno");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G21.11",
        "Parkinsonismo inducido por neurolépticos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G21.19",
        "Parkinsonismo inducido por otros medicamentos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("G24.01", "Discinesia tardía");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G24.02",
        "Distonía aguda inducida por medicamentos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("G24.09", "Distonía tardía");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G25.1",
        "emblor postural inducido por medicamentos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G25.71",
        "Acatisia aguda inducida por medicamentos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("G25.71", "Acatisia tardía");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G25.79",
        "Otro trastorno motor inducido por medicamentos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("G25.81", "Síndrome de las piernas inquietas");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve con cuerpos de Lewy"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a etiologías múltiples"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a infección por VIH"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a la enfermedad de Alzheimer"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a la enfermedad de Huntington"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a la enfermedad de Parkinson"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a otra afección médica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a un traumatismo cerebral"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a una degeneración del lóbulo frontotemporal"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo leve debido a una enfermedad por priones"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G31.84",
        "Trastorno neurocognitivo vascular leve"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.00",
        "Trastorno de insomnio no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.09",
        "Otro trastorno de insomnio especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.10",
        "Trastorno de hipersomnia no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.19",
        "Otro trastorno de hipersomnia especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.20",
        "Trastorno del ritmo circadiano de sueño-vigilia, tipo no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.21",
        "Trastorno del ritmo circadiano de sueño-vigilia, tipo de fases de sueño retrasadas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.22",
        "Trastorno del ritmo circadiano de sueño-vigilia, tipos de fases de sueño avanzadas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.23",
        "Trastorno del ritmo circadiano de sueño-vigilia, tipo de sueño-vigilia irregular"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.24",
        "Trastorno del ritmo circadiano de sueño-vigilia, tipo no ajustado a las 24 horas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.26",
        "Trastorno del ritmo circadiano de sueño-vigilia, tipo asociado a turnos laborales"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.31",
        "Apnea central del sueño, apnea central del sueño idiopática"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.33",
        "Apnea e hipoapnea obstructiva del sueño"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.34",
        "Hipoventilación relacionada con el sueño, hipoventilación idiopática"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.35",
        "Hipoventilación relacionada con el sueño, hipoventilación alveolar central congénita"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.36",
        "Hipoventilación relacionada con el sueño, hipoventilación concurrente relacionada con el sueño"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.37",
        "Apnea central del sueño con consumo concurrente de opiáceos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.411",
        "Narcolepsia con cataplejía pero sin deficiencia de hipocretina"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.419",
        "Ataxia cerebelosa autosómica dominante, sordera y narcolepsia"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.419",
        "Narcolepsia autosómica dominante, obesidad y diabetes de tipo 2"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.419",
        "Narcolepsia sin cataplejía pero con deficiencia de hipocretina"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.429",
        "Narcolepsia secundaria a otra afección médica"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.52",
        "Trastorno del comportamiento del sueño REM"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.8",
        "Otro trastorno del sueño-vigilia especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "G47.9",
        "Trastorno del sueño-vigilia no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "L98.1",
        "Trastorno de excoriación (rascarse la piel)"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "N39.498",
        "Otro trastorno de la excreción especificado, con síntomas urinarios"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("N94.3", "Trastorno disfórico premenstrual");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "R06.3",
        "Apnea central del sueño, respiración de Cheyne-Stokes"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "R15.9",
        "Otro trastorno de la excreción especificado, con síntomas fecales"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "R15.9",
        "Trastorno de la excreción no especificado, con síntomas fecales"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "R32",
        "Trastorno de la excreción no especificado, con síntomas urinarios"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("R41.0", "Otro delirium especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("R41.0", "Delirium no especificado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("R41.83", "Funcionamiento intelectual límite");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "R41.9",
        "Trastorno neurocognitivo no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T43.205A",
        "Síndrome de suspensión de antidepresivos, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T43.205D",
        "Síndrome de suspensión de antidepresivos, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T43.205S",
        "Síndrome de suspensión de antidepresivos, secuelas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T50.905A",
        "Otro efecto adverso de medicamentos, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T50.905D",
        "Otro efecto adverso de medicamentos, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T50.905S",
        "Otro efecto adverso de medicamentos, secuelas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.01XA",
        "Negligencia por parte del cónyuge o la pareja, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.01XD",
        "Negligencia por parte del cónyuge o la pareja, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.02XA",
        "Negligencia infantil, confirmada, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.02XD",
        "Negligencia infantil, confirmada, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.11XA",
        "Maltrato físico del adulto por parte de una persona distinta del cónyuge o la pareja, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.11XA",
        "Violencia física por parte del cónyuge o la pareja, confirmada, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.11XD",
        "Maltrato físico del adulto por parte de una persona distinta del cónyuge o la pareja, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.11XD",
        "Violencia física por parte del cónyuge o la pareja, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.12XA",
        "Maltrato físico infantil, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.12XD",
        "Maltrato físico infantil, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.21XA",
        "Abuso sexual del adulto por parte de una persona distinta del cónyuge o la pareja, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.21XA",
        "Violencia sexual por parte del cónyuge o la pareja, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.21XD",
        "Abuso sexual del adulto por parte de una persona distinta del cónyuge o la pareja, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.21XD",
        "Violencia sexual por parte del cónyuge o la pareja, confirmada, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.22XA",
        "Abuso sexual infantil, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.22XD",
        "Abuso sexual infantil, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.31XA",
        "Maltrato psicológico del adulto por parte de una persona distinta del cónyuge o la pareja, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.31XA",
        "Maltrato psicológico por parte del cónyuge o la pareja, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.31XD",
        "Maltrato psicológico del adulto por parte de una persona distinta del cónyuge o la pareja, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.31XD",
        "Maltrato psicológico por parte del cónyuge o la pareja, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.32XA",
        "Maltrato psicológico infantil, confirmado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T74.32XD",
        "Maltrato psicológico infantil, confirmado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.01XA",
        "Negligencia por parte del cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.01XD",
        "Negligencia por parte del cónyuge o la pareja, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.02XA",
        "Negligencia infantil, sospechada, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.02XD",
        "Negligencia infantil, sospechada, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.11XA",
        "Maltrato físico del adulto por parte de una persona distinta del cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.11XA",
        "Violencia física por parte del cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.11XD",
        "Maltrato físico del adulto por parte de una persona distinta al cónyuge o la pareja, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.11XD",
        "Violencia física por parte del cónyuge o la pareja, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.12XA",
        "Maltrato físico infantil, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.12XD",
        "Maltrato físico infantil, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.21XA",
        "Abuso sexual del adulto por parte de una persona distinta al cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.21XA",
        "Violencia sexual por parte del cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.21XD",
        "Abuso sexual del adulto por parte de una persona distinta al cónyuge o la pareja, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.21XD",
        "Violencia sexual por parte del cónyuge o la pareja, sospechada, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.22XA",
        "Abuso sexual infantil, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.22XD",
        "Abuso sexual infantil, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.31XA",
        "Maltrato psicológico del adulto por parte de una persona distinta del cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.31XA",
        "Maltrato psicológico por parte del cónyuge o la pareja, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.31XD",
        "Maltrato psicológico por parte de una persona distinta del cónyuge o la pareja, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.31XD",
        "Maltrato psicológico por parte del cónyuge o la pareja, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.32XA",
        "Maltrato psicológico infantil, sospechado, hallazgo inicial"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "T76.32XD",
        "Maltrato psicológico infantil, sospechado, hallazgo ulterior"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z55.9", "Problema académico o educativo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z56.82",
        "Problema relacionado con el estado actual de despliegue militar"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z56.9",
        "Otro problema relacionado con el empleo"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z59.0", "Personas sin hogar");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z59.1", "Alojamiento inadecuado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z59.2",
        "Discordia con vecino, inquilino o arrendador"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z59.3",
        "Problema relacionado con la vida en una residencia institucional"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z59.4",
        "Falta de alimentos adecuados o agua potable"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z59.5", "Pobreza extrema");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z59.6", "Ingresos bajos");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z59.7",
        "Seguro social o asistencia pública insuficiente"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z59.9",
        "Problema de vivienda o económico no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z60.0", "Problema de fase de la vida");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z60.2", "Problema relacionado con vivir solo");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z60.3", "Dificultad de aculturación");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z60.4", "Exclusión o rechazo social");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z60.5",
        "Blanco (percibido) de discriminación adversa o persecución"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z60.9",
        "Problema relacionado con el entorno social no especificado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z62.29", "Educación lejos de los padres");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.810",
        "Historia personal (antecedentes) de abuso sexual infantil"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.810",
        "Historia personal (antecedentes) de maltrato físico infantil"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.811",
        "Historia personal (antecedentes) de maltrato psicológico infantil"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.812",
        "Historia personal (antecedentes) de negligencia infantil"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.820",
        "Problema de relación entre padres e hijos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.891",
        "Problema de relación con los hermanos"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z62.898",
        "Niño afectado por relación parental conflictiva"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z63.0",
        "Relación conflictiva con el cónyuge o la pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z63.4", "Duelo no complicado");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z63.5",
        "Ruptura familiar por separación o divorcio"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z63.8",
        "Nivel elevado de emoción expresada en la familia"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z64.0",
        "Problemas relacionados con embarazo no deseado"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z64.1",
        "Problemas relacionados con multiparidad"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z64.4",
        "Discordia con el proveedor de servicios sociales, incluido perito, gestor de casos o asistente social"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z65.0",
        "Sentencia civil o penal sin encarcelamiento"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z65.1", "Encarcelamiento u otra reclusión");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z65.2",
        "Problemas relacionados con la excarcelación"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z65.3",
        "Problemas relacionados con otras circunstancias legales"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z65.4", "Víctima de delincuencia");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z65.4", "Víctima de terrorismo o tortura");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z65.5",
        "Exposición a catástrofe, guerra u otras hostilidades"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z65.8",
        "Otro problema relacionado con circunstancias psicosociales"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z65.8", "Problema religioso o espiritual");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z65.9",
        "Problema no especificado relacionado con circunstancias psicosociales no especificadas"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.010",
        "Visita de salud mental para la víctima de abuso sexual infantil por parte de los padres"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.010",
        "Visita de salud mental para la víctima de maltrato psicológico infantil por parte de los padres"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.010",
        "Visita de salud mental para la víctima de maltrato infantil por parte de los padres"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.010",
        "Visita de salud mental para la víctima de negligencia infantil parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.011",
        "Visita de salud mental para el autor de abuso sexual infantil parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.011",
        "Visita de salud mental para el autor de la negligencia infantil parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.011",
        "Visita de salud mental para el autor de maltrato psicológico infantil parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.011",
        "Visita de salud mental para el autor el autor de maltrato infantil parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.020",
        "Visita de salud mental para la víctima de abuso sexual infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.020",
        "Visita de salud mental para la víctima de maltrato infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.020",
        "Visita de salud mental para la víctima de maltrato psicológico infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.020",
        "Visita de salud mental para la víctima de negligencia infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.021",
        "Visita de salud mental para el autor de maltrato infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.021",
        "Visita de salud mental para el autor de abuso sexual infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.021",
        "Visita de salud mental para el autor de maltrato psicológico infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.021",
        "Visita de salud mental para el autor de negligencia infantil no parental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.11",
        "Visita de salud mental para la víctima de maltrato psicológico por parte del cónyuge o la pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.11",
        "Visita de salud mental para la víctima de negligencia por parte del cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.11",
        "Visita de salud mental para la víctima de violencia física por parte del cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.12",
        "Visita de salud mental para el autor de maltrato psicológico hacia el cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.12",
        "Visita de salud mental para el autor de negligencia hacia del cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.12",
        "Visita de salud mental para el autor de violencia física hacia el cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.12",
        "Visita de salud mental para el autor de violencia sexual hacia del cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.81",
        "Visita de salud mental para la víctima de maltrato o abuso del adulto por parte de una persona distinta del cónyuge"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.81",
        "Visita de salud mental para la víctima de violencia sexual por parte del cónyuge o pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z69.82",
        "Visita de salud mental para el autor de maltrato o abuso del adulto por parte de una persona distinta del cónyuge"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z70.9", "Asesoramiento sexual");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z71.9", "Otro asesoramiento o consulta");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z72.0", "Trastorno por consume de tabaco, leve");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z72.810",
        "Comportamiento antisocial infantil o adolescente"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z72.811",
        "Comportamiento antisocial del adulto"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z72.9",
        "Problema relacionado con el estilo de vida"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z75.3",
        "No disponibilidad o acceso a centros de asistencia sanitaria"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z75.4",
        "No disponibilidad o acceso a otros centros de ayuda"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z76.5", "Simulación");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.19",
        "Incumplimiento del tratamiento médico"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.410",
        "Historia personal (antecedentes) de violencia física por parte del cónyuge o la pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.410",
        "Historia personal (antecedentes) de violencia sexual por parte del cónyuge o la pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.411",
        "Historia personal (antecedentes) de maltrato psicológico por parte del cónyuge o la pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.412",
        "Historia personal (antecedentes) de negligencia por parte del cónyuge o la pareja"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.49",
        "Otra historia personal de trauma psicológico"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z91.5", "Historia personal de autolesión");
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.82",
        "Historia personal de despliegue militar"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES (
        "Z91.83",
        "Vagabundeo asociado a un trastorno mental"
    );
INSERT INTO DSM_V (CIE_10, DNAME)
VALUES ("Z91.89", "Otros factores de riesgo personal");
-- MOODS ------------------------------
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_DESPERATION");
set @mood_desesperationid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_ANGER");
set @mood_angerid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_ANXIETY");
set @mood_anxietyid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_INSECURITY");
set @mood_insecurityid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_SADNESS");
set @mood_sadnessid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_BOREDOM");
set @mood_boredomid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_INDIFFERENCE");
set @mood_indifferenceid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_CALM");
set @mood_calmid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_HAPPINESS");
set @mood_happinessid = LAST_INSERT_ID();
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#MOOD_GRATITUDE");
set @mood_gratitudeid = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(
        @loc_esid,
        @mood_desesperationid,
        "😱 Desesperación"
    ),
    (
        @loc_caid,
        @mood_desesperationid,
        "😱 Desesperació"
    ),
    (
        @loc_enid,
        @mood_desesperationid,
        "😱 Desperation"
    ),
    (@loc_frid, @mood_desesperationid, "😱 Désespoir"),
    (@loc_ptid, @mood_desesperationid, "😱 Desespero"),
    (@loc_esid, @mood_angerid, "😡 Ira"),
    (@loc_caid, @mood_angerid, "😡 Ira"),
    (@loc_enid, @mood_angerid, "😡 Anger"),
    (@loc_frid, @mood_angerid, "😡 Colère"),
    (@loc_ptid, @mood_angerid, "😡 Raiva"),
    (@loc_esid, @mood_anxietyid, "😰 Ansiedad"),
    (@loc_caid, @mood_anxietyid, "😰 Ansietat"),
    (@loc_enid, @mood_anxietyid, "😰 Anxiety"),
    (@loc_frid, @mood_anxietyid, "😰 Anxiété"),
    (@loc_ptid, @mood_anxietyid, "😰 Ansiedade"),
    (@loc_esid, @mood_insecurityid, "🤔 Inseguridad"),
    (@loc_caid, @mood_insecurityid, "🤔 Inseguretat"),
    (@loc_enid, @mood_insecurityid, "🤔 Insecurity"),
    (@loc_frid, @mood_insecurityid, "🤔 Insécurité"),
    (@loc_ptid, @mood_insecurityid, "🤔 Insegurança"),
    (@loc_esid, @mood_sadnessid, "😔 Tristeza"),
    (@loc_caid, @mood_sadnessid, "😔 Tristesa"),
    (@loc_enid, @mood_sadnessid, "😔 Sadness"),
    (@loc_frid, @mood_sadnessid, "😔 Tristesse"),
    (@loc_ptid, @mood_sadnessid, "😔 Tristeza"),
    (@loc_esid, @mood_boredomid, "🥱 Aburrimiento"),
    (@loc_caid, @mood_boredomid, "🥱 Avorriment"),
    (@loc_enid, @mood_boredomid, "🥱 Boredom"),
    (@loc_frid, @mood_boredomid, "🥱 L'ennui"),
    (@loc_ptid, @mood_boredomid, "🥱 Tédio"),
    (
        @loc_esid,
        @mood_indifferenceid,
        "😒 Indiferencia"
    ),
    (
        @loc_caid,
        @mood_indifferenceid,
        "😒 Indiferència"
    ),
    (
        @loc_enid,
        @mood_indifferenceid,
        "😒 Indifference"
    ),
    (
        @loc_frid,
        @mood_indifferenceid,
        "😒 Indifférence"
    ),
    (
        @loc_ptid,
        @mood_indifferenceid,
        "😒 Indiferença"
    ),
    (@loc_esid, @mood_calmid, "😶 Calma"),
    (@loc_caid, @mood_calmid, "😶 Calma"),
    (@loc_enid, @mood_calmid, "😶 Calm"),
    (@loc_frid, @mood_calmid, "😶 Calme"),
    (@loc_ptid, @mood_calmid, "😶 Calma"),
    (@loc_esid, @mood_happinessid, "😊 Felicidad"),
    (@loc_caid, @mood_happinessid, "😊 Felicitat"),
    (@loc_enid, @mood_happinessid, "😊 Happiness"),
    (@loc_frid, @mood_happinessid, "😊 Le bonheur"),
    (@loc_ptid, @mood_happinessid, "😊 Felicidade"),
    (@loc_esid, @mood_gratitudeid, "😉 Gratitud"),
    (@loc_caid, @mood_gratitudeid, "😉 Gratitud"),
    (@loc_enid, @mood_gratitudeid, "😉 Gratitude"),
    (
        @loc_frid,
        @mood_gratitudeid,
        "😉 Reconnaissance"
    ),
    (@loc_ptid, @mood_gratitudeid, "😉 Gratidão");
-- EMOTIONS ---------------------------
-- 1. Irat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_EMOTION_ANGER");
set @emo_anger_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_anger_id, NULL, 0, 1);
set @parent_level_1 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_anger_id, "Ira"),
    (@loc_caid, @emo_anger_id, "Irat/da"),
    (@loc_enid, @emo_anger_id, "Anger"),
    (@loc_frid, @emo_anger_id, "Colère"),
    (@loc_ptid, @emo_anger_id, "Furioso");
set @emo_grandpa_id = LAST_INSERT_ID() - 4;
-- 1.1 Odiós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_1_EMOTION_HATE");
set @emo_hate_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_hate_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_hate_id, "Odio"),
    (@loc_caid, @emo_hate_id, "Odiós/a"),
    (@loc_enid, @emo_hate_id, "Hate"),
    (@loc_frid, @emo_hate_id, "Haineux"),
    (@loc_ptid, @emo_hate_id, "Odiar");
-- 1.1.1 Ultratjat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_1_1_EMOTION_OTRAGED");
set @emo_outraged_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_outraged_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_outraged_id, "Ultrajado/a"),
    (@loc_caid, @emo_outraged_id, "Ultratjat/da"),
    (@loc_enid, @emo_outraged_id, "Outraged"),
    (@loc_frid, @emo_outraged_id, "Insulté"),
    (@loc_ptid, @emo_outraged_id, "Indignado");
-- 1.1.2 Ressentit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_1_2_EMOTION_RESENTFUL");
set @emo_resentful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_resentful_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_resentful_id, "Resentido/a"),
    (@loc_caid, @emo_resentful_id, "Ressentit/da"),
    (@loc_enid, @emo_resentful_id, "Resentful"),
    (@loc_frid, @emo_resentful_id, "Insulté"),
    (@loc_ptid, @emo_resentful_id, "Indignado");
-- 1.2 Embogit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_2_EMOTION_MADNESS");
set @emo_madness_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_madness_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_madness_id, "Locura"),
    (@loc_caid, @emo_madness_id, "Embogit/da"),
    (@loc_enid, @emo_madness_id, "Madness"),
    (@loc_frid, @emo_madness_id, "Folie"),
    (@loc_ptid, @emo_madness_id, "Loucura");
-- 1.2.1 Rabiós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_2_1_EMOTION_ANGRY");
set @emo_angry_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_angry_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_angry_id, "Rabioso/a"),
    (@loc_caid, @emo_angry_id, "Rabiós/a"),
    (@loc_enid, @emo_angry_id, "Angry"),
    (@loc_frid, @emo_angry_id, "Enragé"),
    (@loc_ptid, @emo_angry_id, "Irritado");
-- 1.2.2 Embogit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_2_2_EMOTION_MADNESS");
set @emo_madness_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_madness_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_madness_id, "Locura"),
    (@loc_caid, @emo_madness_id, "Embogit/da"),
    (@loc_enid, @emo_madness_id, "Madness"),
    (@loc_frid, @emo_madness_id, "Folie"),
    (@loc_ptid, @emo_madness_id, "Indignado");
-- 1.3 Agressiu/va
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_3_EMOTION_AGGRESSION");
set @emo_aggression_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_aggression_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_aggression_id, "Agresividad"),
    (@loc_caid, @emo_aggression_id, "Agressiu/va"),
    (@loc_enid, @emo_aggression_id, "Aggression"),
    (@loc_frid, @emo_aggression_id, "Agressif"),
    (@loc_ptid, @emo_aggression_id, "Agressão");
-- 1.3.1 Hostil
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_3_1_EMOTION_HOSTILE");
set @emo_hostile_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_hostile_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_hostile_id, "Hostil"),
    (@loc_caid, @emo_hostile_id, "Hostil"),
    (@loc_enid, @emo_hostile_id, "Hostile"),
    (@loc_frid, @emo_hostile_id, "Hostile"),
    (@loc_ptid, @emo_hostile_id, "Hostil");
-- 1.3.2 Provocador/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_3_2_EMOTION_PROVOCATEUR");
set @emo_provocateur_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_provocateur_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_provocateur_id, "Provocador/a"),
    (@loc_caid, @emo_provocateur_id, "Provocador/a"),
    (@loc_enid, @emo_provocateur_id, "Provocateur"),
    (@loc_frid, @emo_provocateur_id, "Provocant"),
    (@loc_ptid, @emo_provocateur_id, "Provocador");
-- 1.4 Ferit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_4_EMOTION_INJURED");
set @emo_injured_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_injured_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_injured_id, "Herido/a"),
    (@loc_caid, @emo_injured_id, "Ferit/da"),
    (@loc_enid, @emo_injured_id, "Injured"),
    (@loc_frid, @emo_injured_id, "Blessé"),
    (@loc_ptid, @emo_injured_id, "Ferido");
-- 1.4.1 Devastat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_4_1_EMOTION_DEVASTATED");
set @emo_devastated_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_devastated_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_devastated_id, "Devastado/a"),
    (@loc_caid, @emo_devastated_id, "Devastat/da"),
    (@loc_enid, @emo_devastated_id, "Devastated"),
    (@loc_frid, @emo_devastated_id, "Dévasté"),
    (@loc_ptid, @emo_devastated_id, "Devastado");
-- 1.4.2 Afligit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_4_2_EMOTION_DISTRESSED");
set @emo_distressed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_distressed_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_distressed_id, "Apenado/a"),
    (@loc_caid, @emo_distressed_id, "Afligit/da"),
    (@loc_enid, @emo_distressed_id, "Distressed"),
    (@loc_frid, @emo_distressed_id, "Provocant"),
    (@loc_ptid, @emo_distressed_id, "Provocador");
-- 1.5 Amenaçat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_5_EMOTION_THREATENED");
set @emo_threatened_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_threatened_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_threatened_id, "Amenazado/a"),
    (@loc_caid, @emo_threatened_id, "Amenaçat/da"),
    (@loc_enid, @emo_threatened_id, "Threatened"),
    (@loc_frid, @emo_threatened_id, "Menacé"),
    (@loc_ptid, @emo_threatened_id, "Ameaçado");
-- 1.5.1 Atacat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_5_1_EMOTION_ATTACKED");
set @emo_attacked_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_attacked_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_attacked_id, "Atacado/da"),
    (@loc_caid, @emo_attacked_id, "Atacat/da"),
    (@loc_enid, @emo_attacked_id, "Attacked"),
    (@loc_frid, @emo_attacked_id, "Insécure"),
    (@loc_ptid, @emo_attacked_id, "Atacado");
-- 1.5.2 Gelós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_5_2_EMOTION_JEALOUS");
set @emo_jealous_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_jealous_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_jealous_id, "Apenado/a"),
    (@loc_caid, @emo_jealous_id, "Gelós/a"),
    (@loc_enid, @emo_jealous_id, "Jealous"),
    (@loc_frid, @emo_jealous_id, "Jaloux"),
    (@loc_ptid, @emo_jealous_id, "Ciúme");
-- 1.6 Frustrat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_6_EMOTION_FRUSTRATED");
set @emo_frustrated_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_frustrated_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_frustrated_id, "Frustrado/a"),
    (@loc_caid, @emo_frustrated_id, "Frustrat/da"),
    (@loc_enid, @emo_frustrated_id, "Frustrated"),
    (@loc_frid, @emo_frustrated_id, "Frustré"),
    (@loc_ptid, @emo_frustrated_id, "Frustrado");
-- 1.6.1 Enfurismat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_6_1_EMOTION_ENRAGED");
set @emo_enraged_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_enraged_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_enraged_id, "Enfurecido/a"),
    (@loc_caid, @emo_enraged_id, "Enfurismat/da"),
    (@loc_enid, @emo_enraged_id, "Enraged"),
    (@loc_frid, @emo_enraged_id, "Furieux"),
    (@loc_ptid, @emo_enraged_id, "Enfurecido");
-- 1.6.2 Irritat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_6_2_EMOTION_IRRITATED");
set @emo_irritated_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_irritated_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_irritated_id, "Irritado/a"),
    (@loc_caid, @emo_irritated_id, "Irritat/da"),
    (@loc_enid, @emo_irritated_id, "Irritated"),
    (@loc_frid, @emo_irritated_id, "Irrité"),
    (@loc_ptid, @emo_irritated_id, "Irritado");
-- 1.7 Crític/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_7_EMOTION_CRITIC");
set @emo_critic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_critic_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_critic_id, "Crítico/a"),
    (@loc_caid, @emo_critic_id, "Crític/a"),
    (@loc_enid, @emo_critic_id, "Critic"),
    (@loc_frid, @emo_critic_id, "Critique"),
    (@loc_ptid, @emo_critic_id, "Crítico");
-- 1.7.1 Sarcàstic/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_7_1_EMOTION_SARCASTIC");
set @emo_sarcastic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_sarcastic_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_sarcastic_id, "Sarcástico/a"),
    (@loc_caid, @emo_sarcastic_id, "Sarcàstic/a"),
    (@loc_enid, @emo_sarcastic_id, "Sarcastic"),
    (@loc_frid, @emo_sarcastic_id, "Sarcastique"),
    (@loc_ptid, @emo_sarcastic_id, "Sarcástico");
-- 1.7.2 Escèptic/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_7_2_EMOTION_SKEPTIC");
set @emo_skeptic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_skeptic_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_skeptic_id, "Escéptico/a"),
    (@loc_caid, @emo_skeptic_id, "Escèptic/a"),
    (@loc_enid, @emo_skeptic_id, "Skeptic"),
    (@loc_frid, @emo_skeptic_id, "Irrité"),
    (@loc_ptid, @emo_skeptic_id, "Irritado");
-- 1.8 Distant
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_8_EMOTION_DISTANT");
set @emo_distant_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_distant_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_distant_id, "Distante"),
    (@loc_caid, @emo_distant_id, "Distant"),
    (@loc_enid, @emo_distant_id, "Distant"),
    (@loc_frid, @emo_distant_id, "Distant"),
    (@loc_ptid, @emo_distant_id, "Distante");
-- 1.8.1 Desconfiat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_8_1_EMOTION_DISTRUSTFUL");
set @emo_distrustful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_distrustful_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_distrustful_id, "Desconfiado/a"),
    (@loc_caid, @emo_distrustful_id, "Desconfiat/da"),
    (@loc_enid, @emo_distrustful_id, "Distrustful"),
    (@loc_frid, @emo_distrustful_id, "Suspect"),
    (@loc_ptid, @emo_distrustful_id, "Desconfiado");
-- 1.8.2 Introvertit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#1_8_2_EMOTION_SKEPTIC");
set @emo_introvert_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_introvert_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_introvert_id, "Introvertido/a"),
    (@loc_caid, @emo_introvert_id, "Introvertit/da"),
    (@loc_enid, @emo_introvert_id, "Introvert"),
    (@loc_frid, @emo_introvert_id, "Irrité"),
    (@loc_ptid, @emo_introvert_id, "Irritado");
-- 2. Fastiguejat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_EMOTION_DISGUST");
set @emo_disgust_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_disgust_id, NULL, 0, 1);
set @parent_level_1 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_disgust_id, "Asco"),
    (@loc_caid, @emo_disgust_id, "Fastiguejat/da"),
    (@loc_enid, @emo_disgust_id, "Disgust"),
    (@loc_frid, @emo_disgust_id, "Dégoût"),
    (@loc_ptid, @emo_disgust_id, "Nojo");
-- 2.1 Decebut/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_1_EMOTION_DISAPPOINTED");
set @emo_disappointed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_disappointed_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(
        @loc_esid,
        @emo_disappointed_id,
        "Decepcionado/a"
    ),
    (@loc_caid, @emo_disappointed_id, "Decebut/da"),
    (@loc_enid, @emo_disappointed_id, "Disappointed"),
    (@loc_frid, @emo_disappointed_id, "Déception"),
    (@loc_ptid, @emo_disappointed_id, "Decepcionado");
-- 2.1.1 Repugnant
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_1_1_EMOTION_DISGUSTING");
set @emo_disgusting_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_disgusting_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_disgusting_id, "Repugnante"),
    (@loc_caid, @emo_disgusting_id, "Repugnant"),
    (@loc_enid, @emo_disgusting_id, "Disgusting"),
    (@loc_frid, @emo_disgusting_id, "Répugant"),
    (@loc_ptid, @emo_disgusting_id, "Nojento");
-- 2.1.2 Revoltós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_1_2_EMOTION_UNRULY");
set @emo_unruly_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_unruly_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_unruly_id, "Revoltoso/a"),
    (@loc_caid, @emo_unruly_id, "Revoltós/a"),
    (@loc_enid, @emo_unruly_id, "Unruly"),
    (@loc_frid, @emo_unruly_id, "Révolté"),
    (@loc_ptid, @emo_unruly_id, "Indisciplinado");
-- 2.2 Disconforme/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_2_EMOTION_DISSATISFIED");
set @emo_dissatisfied_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_dissatisfied_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_dissatisfied_id, "Disconforme/a"),
    (@loc_caid, @emo_dissatisfied_id, "Disconforme/a"),
    (@loc_enid, @emo_dissatisfied_id, "Dissatisfied"),
    (@loc_frid, @emo_dissatisfied_id, "Réprobation"),
    (@loc_ptid, @emo_dissatisfied_id, "Insatisfeito");
-- 2.2.1 Moralista
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_2_1_EMOTION_MORALIST");
set @emo_moralist_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_moralist_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_moralist_id, "Moralista"),
    (@loc_caid, @emo_moralist_id, "Moralista"),
    (@loc_enid, @emo_moralist_id, "Moralist"),
    (@loc_frid, @emo_moralist_id, "Jugement"),
    (@loc_ptid, @emo_moralist_id, "Moralista");
-- 2.2.2 Reticent
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_2_2_EMOTION_RELUCTANT");
set @emo_reluctant_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_reluctant_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_reluctant_id, "Reacio/a"),
    (@loc_caid, @emo_reluctant_id, "Reticent"),
    (@loc_enid, @emo_reluctant_id, "Reluctant"),
    (@loc_frid, @emo_reluctant_id, "Réticent"),
    (@loc_ptid, @emo_reluctant_id, "Relutante");
-- 2.3 Abstinent
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_3_EMOTION_ABSTINENT");
set @emo_abstinent_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_abstinent_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_abstinent_id, "Abstinente"),
    (@loc_caid, @emo_abstinent_id, "Abstinent"),
    (@loc_enid, @emo_abstinent_id, "Abstinent"),
    (@loc_frid, @emo_abstinent_id, "Évitement"),
    (@loc_ptid, @emo_abstinent_id, "Abstinente");
-- 2.3.1 Aversiu/va
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_3_1_EMOTION_DISLIKE");
set @emo_dislike_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_dislike_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_dislike_id, "Aversión"),
    (@loc_caid, @emo_dislike_id, "Aversiu/va"),
    (@loc_enid, @emo_dislike_id, "Dislike"),
    (@loc_frid, @emo_dislike_id, "Aversion"),
    (@loc_ptid, @emo_dislike_id, "Aversão");
-- 2.3.2 Vacil·lant
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_3_2_EMOTION_HESITANT");
set @emo_hesitant_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_hesitant_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_hesitant_id, "Vacilante"),
    (@loc_caid, @emo_hesitant_id, "Vacil·lant"),
    (@loc_enid, @emo_hesitant_id, "Hesitant"),
    (@loc_frid, @emo_hesitant_id, "Hésitant"),
    (@loc_ptid, @emo_hesitant_id, "Hesitante");
-- 2.4 Horrible
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_4_EMOTION_HORRIBLE");
set @emo_horrible_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_horrible_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_horrible_id, "Horrible"),
    (@loc_caid, @emo_horrible_id, "Horrible"),
    (@loc_enid, @emo_horrible_id, "Horrible"),
    (@loc_frid, @emo_horrible_id, "Terrible"),
    (@loc_ptid, @emo_horrible_id, "Horrível");
-- 2.4.1 Odiós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_4_1_EMOTION_HATEFUL");
set @emo_hateful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_hateful_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_hateful_id, "Odioso/a"),
    (@loc_caid, @emo_hateful_id, "Odiós/a"),
    (@loc_enid, @emo_hateful_id, "Hateful"),
    (@loc_frid, @emo_hateful_id, "Détestable"),
    (@loc_ptid, @emo_hateful_id, "Odioso");
-- 2.4.2 Fastiguejat/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#2_4_2_EMOTION_DISGUSTED");
set @emo_disgusted_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_disgusted_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_disgusted_id, "Asqueado/a"),
    (@loc_caid, @emo_disgusted_id, "Fastiguejat/a"),
    (@loc_enid, @emo_disgusted_id, "Disgusted"),
    (@loc_frid, @emo_disgusted_id, "Dégout"),
    (@loc_ptid, @emo_disgusted_id, "Enojado");
-- 3. Poruc/ga
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_EMOTION_FEAR");
set @emo_fear_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_fear_id, NULL, 0, 1);
set @parent_level_1 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_fear_id, "Miedo"),
    (@loc_caid, @emo_fear_id, "Poruc/ga"),
    (@loc_enid, @emo_fear_id, "Fear"),
    (@loc_frid, @emo_fear_id, "Peur"),
    (@loc_ptid, @emo_fear_id, "Medo");
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_fear_id, NULL, 0, 1);
-- 3.1 Humiliat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_1_EMOTION_HUMILIATED");
set @emo_humiliated_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_humiliated_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_humiliated_id, "Humillado/a"),
    (@loc_caid, @emo_humiliated_id, "Humiliat/da"),
    (@loc_enid, @emo_humiliated_id, "Humiliated"),
    (@loc_frid, @emo_humiliated_id, "Humilié"),
    (@loc_ptid, @emo_humiliated_id, "Humilhado");
-- 3.1.1 Ridiculitzat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_1_1_EMOTION_RIDICULE");
set @emo_ridiculed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_ridiculed_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_ridiculed_id, "Ridiculizado/a"),
    (@loc_caid, @emo_ridiculed_id, "Ridiculitzat/da"),
    (@loc_enid, @emo_ridiculed_id, "Ridiculed"),
    (@loc_frid, @emo_ridiculed_id, "Ridiculisé"),
    (@loc_ptid, @emo_ridiculed_id, "Ridicularizado");
-- 3.1.2 Irrespetat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_1_2_EMOTION_DISRESPECTED");
set @emo_disrespected_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_disrespected_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_disrespected_id, "Irrespetado/a"),
    (@loc_caid, @emo_disrespected_id, "Irrespetat/da"),
    (@loc_enid, @emo_disrespected_id, "Disrespected"),
    (@loc_frid, @emo_disrespected_id, "Non respecté"),
    (@loc_ptid, @emo_disrespected_id, "Desrespeitado");
-- 3.2 Refusat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_2_EMOTION_REJECTED");
set @emo_rejected_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_rejected_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_rejected_id, "Rechazado/a"),
    (@loc_caid, @emo_rejected_id, "Refusat/da"),
    (@loc_enid, @emo_rejected_id, "Rejected"),
    (@loc_frid, @emo_rejected_id, "Rejeté"),
    (@loc_ptid, @emo_rejected_id, "Rejeitado");
-- 3.2.1 Marginat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_2_1_EMOTION_MARGINALIZED");
set @emo_marginalized_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_marginalized_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_marginalized_id, "Marginado/a"),
    (@loc_caid, @emo_marginalized_id, "Marginat/da"),
    (@loc_enid, @emo_marginalized_id, "Marginalized"),
    (@loc_frid, @emo_marginalized_id, "Inadéquat"),
    (@loc_ptid, @emo_marginalized_id, "Marginalizado");
-- 3.2.2 Alienat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_2_2_EMOTION_ALIENATED");
set @emo_alienated_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_alienated_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_alienated_id, "Alienado/a"),
    (@loc_caid, @emo_alienated_id, "Alienat/da"),
    (@loc_enid, @emo_alienated_id, "Alienated"),
    (@loc_frid, @emo_alienated_id, "Exclus"),
    (@loc_ptid, @emo_alienated_id, "Alienado");
-- 3.3 Espantat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_3_EMOTION_SCARED");
set @emo_scared_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_scared_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_scared_id, "Asustado/a"),
    (@loc_caid, @emo_scared_id, "Espantat/da"),
    (@loc_enid, @emo_scared_id, "Scared"),
    (@loc_frid, @emo_scared_id, "Apeuré"),
    (@loc_ptid, @emo_scared_id, "Assustado");
-- 3.3.1 Aterrat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_3_1_EMOTION_TERRIFIED");
set @emo_terrified_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_terrified_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_terrified_id, "Aterrado/a"),
    (@loc_caid, @emo_terrified_id, "Aterrat/da"),
    (@loc_enid, @emo_terrified_id, "Terrified"),
    (@loc_frid, @emo_terrified_id, "Terrifié"),
    (@loc_ptid, @emo_terrified_id, "Aterrorizado");
-- 3.3.2 Vulnerable
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_3_2_EMOTION_FRIGHTENED");
set @emo_frightened_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_frightened_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_frightened_id, "Espantado/a"),
    (@loc_caid, @emo_frightened_id, "Vulnerable"),
    (@loc_enid, @emo_frightened_id, "Frightened"),
    (@loc_frid, @emo_frightened_id, "Effrayé"),
    (@loc_ptid, @emo_frightened_id, "Com Medo");
-- 3.3.3 Amoïnat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_3_3_EMOTION_FEARFUL");
set @emo_fearful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_fearful_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_fearful_id, "Temeroso/a"),
    (@loc_caid, @emo_fearful_id, "Amoïnat/da"),
    (@loc_enid, @emo_fearful_id, "Fearful"),
    (@loc_frid, @emo_fearful_id, "Craintif"),
    (@loc_ptid, @emo_fearful_id, "Medo");
-- 3.4 Ansiós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_4_EMOTION_ANXIOUS");
set @emo_anxious_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_anxious_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_anxious_id, "Ansioso/a"),
    (@loc_caid, @emo_anxious_id, "Ansiós/a"),
    (@loc_enid, @emo_anxious_id, "Anxious"),
    (@loc_frid, @emo_anxious_id, "Anxieux"),
    (@loc_ptid, @emo_anxious_id, "Ansioso");
-- 3.4.1 Aclaparat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_4_1_EMOTION_OVERWHELMED");
set @emo_overwhelmed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_overwhelmed_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_overwhelmed_id, "Agobiado/a"),
    (@loc_caid, @emo_overwhelmed_id, "Aclaparat/da"),
    (@loc_enid, @emo_overwhelmed_id, "Overwhelmed"),
    (@loc_frid, @emo_overwhelmed_id, "Accablé"),
    (@loc_ptid, @emo_overwhelmed_id, "Sobrecarregado");
-- 3.4.2 Preocupat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_4_2_EMOTION_CONCERNED");
set @emo_concerned_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_concerned_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_concerned_id, "Preocupado/a"),
    (@loc_caid, @emo_concerned_id, "Preocupat/da"),
    (@loc_enid, @emo_concerned_id, "Concerned"),
    (@loc_frid, @emo_concerned_id, "Préocupé"),
    (@loc_ptid, @emo_concerned_id, "Preocupado");
-- 3.5 Submís/sa
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_5_EMOTION_SUBMISSIVE");
set @emo_submissive_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_submissive_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_submissive_id, "Sumiso/a"),
    (@loc_caid, @emo_submissive_id, "Submís/sa"),
    (@loc_enid, @emo_submissive_id, "Submissive"),
    (@loc_frid, @emo_submissive_id, "Docile"),
    (@loc_ptid, @emo_submissive_id, "Submisso");
-- 3.5.1 Inútil
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_5_1_EMOTION_USELESS");
set @emo_Useless_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_Useless_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_Useless_id, "Inútil"),
    (@loc_caid, @emo_Useless_id, "Inútil"),
    (@loc_enid, @emo_Useless_id, "Useless"),
    (@loc_frid, @emo_Useless_id, "Sans Valeur"),
    (@loc_ptid, @emo_Useless_id, "Inútil");
-- 3.5.2 Insignificant
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_5_2_EMOTION_NEGLIGIBLE");
set @emo_negligible_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_negligible_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_negligible_id, "Insignificante"),
    (@loc_caid, @emo_negligible_id, "Insignificant"),
    (@loc_enid, @emo_negligible_id, "Negligible"),
    (@loc_frid, @emo_negligible_id, "Insignifiant"),
    (@loc_ptid, @emo_negligible_id, "Desprezível");
-- 3.6 Insegur/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_6_EMOTION_INSECURE");
set @emo_insecure_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_insecure_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_insecure_id, "Inseguro/a"),
    (@loc_caid, @emo_insecure_id, "Insegur/a"),
    (@loc_enid, @emo_insecure_id, "Insecure"),
    (@loc_frid, @emo_insecure_id, "Insécure"),
    (@loc_ptid, @emo_insecure_id, "Inseguro");
-- 3.6.1 Inferior
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_6_1_EMOTION_INFERIOR");
set @emo_inferior_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_inferior_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_inferior_id, "Inferior"),
    (@loc_caid, @emo_inferior_id, "Inferior"),
    (@loc_enid, @emo_inferior_id, "Inferior"),
    (@loc_frid, @emo_inferior_id, "Inférieur"),
    (@loc_ptid, @emo_inferior_id, "Inferior");
-- 3.6.2 Insuficient
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#3_6_2_EMOTION_INSUFFICIENT");
set @emo_insufficient_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_insufficient_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_insufficient_id, "Insuficiente"),
    (@loc_caid, @emo_insufficient_id, "Insuficient"),
    (@loc_enid, @emo_insufficient_id, "Insufficient"),
    (@loc_frid, @emo_insufficient_id, "Incapable"),
    (@loc_ptid, @emo_insufficient_id, "Insuficiente");
-- 4. Trist/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_EMOTION_SADNESS");
set @emo_sadness_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_sadness_id, NULL, 0, 1);
set @parent_level_1 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_sadness_id, "Tristeza"),
    (@loc_caid, @emo_sadness_id, "Trist/a"),
    (@loc_enid, @emo_sadness_id, "Sadness"),
    (@loc_frid, @emo_sadness_id, "Tristesse"),
    (@loc_ptid, @emo_sadness_id, "Tristeza");
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_sadness_id, NULL, 0, 1);
-- 4.1 Desesperat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_1_EMOTION_DESPERATE");
set @emo_desperate_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_desperate_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_desperate_id, "Desesperado/a"),
    (@loc_caid, @emo_desperate_id, "Desesperat/da"),
    (@loc_enid, @emo_desperate_id, "Desperate"),
    (@loc_frid, @emo_desperate_id, "Désespoir"),
    (@loc_ptid, @emo_desperate_id, "Desesperado");
-- 4.1.1 Desvalgut/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_1_1_EMOTION_HELPLESS");
set @emo_helpless_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_helpless_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_helpless_id, "Desvalido/a"),
    (@loc_caid, @emo_helpless_id, "Desvalgut/da"),
    (@loc_enid, @emo_helpless_id, "Helpless"),
    (@loc_frid, @emo_helpless_id, "Impuissant"),
    (@loc_ptid, @emo_helpless_id, "Indefeso");
-- 4.1.2 Vulnerable
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_1_2_EMOTION_VULNERABLE");
set @emo_vulnerable_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_vulnerable_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_vulnerable_id, "Vulnerable"),
    (@loc_caid, @emo_vulnerable_id, "Vulnerable"),
    (@loc_enid, @emo_vulnerable_id, "Vulnerable"),
    (@loc_frid, @emo_vulnerable_id, "Vulnérable"),
    (@loc_ptid, @emo_vulnerable_id, "Vulnerável");
-- 4.2 Deprimit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_2_EMOTION_DEPRESSED");
set @emo_depressed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_depressed_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_depressed_id, "Deprimido/a"),
    (@loc_caid, @emo_depressed_id, "Deprimit/da"),
    (@loc_enid, @emo_depressed_id, "Depressed"),
    (@loc_frid, @emo_depressed_id, "Dépression"),
    (@loc_ptid, @emo_depressed_id, "Deprimido");
-- 4.2.1 Buit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_2_1_EMOTION_EMPTY");
set @emo_empty_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_empty_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_empty_id, "Vacío/a"),
    (@loc_caid, @emo_empty_id, "Buit/da"),
    (@loc_enid, @emo_empty_id, "Empty"),
    (@loc_frid, @emo_empty_id, "Vide"),
    (@loc_ptid, @emo_empty_id, "Vazio");
-- 4.2.2 Melancòlic/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_2_2_EMOTION_MELANCHOLIC");
set @emo_melancholic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_melancholic_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_melancholic_id, "Melancólico/a"),
    (@loc_caid, @emo_melancholic_id, "Melancòlic/a"),
    (@loc_enid, @emo_melancholic_id, "Melancholic"),
    (@loc_frid, @emo_melancholic_id, "Mélancolique"),
    (@loc_ptid, @emo_melancholic_id, "Melancólico");
-- 4.3 Culpable
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_3_EMOTION_GUILTY");
set @emo_guilty_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_guilty_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_guilty_id, "Culpable"),
    (@loc_caid, @emo_guilty_id, "Culpable"),
    (@loc_enid, @emo_guilty_id, "Guilty"),
    (@loc_frid, @emo_guilty_id, "Culpabilité"),
    (@loc_ptid, @emo_guilty_id, "Culpado");
-- 4.3.1 Avergonyit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_3_1_EMOTION_ASHAMED");
set @emo_ashamed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_ashamed_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_ashamed_id, "Avergonzado/a"),
    (@loc_caid, @emo_ashamed_id, "Avergonyit/da"),
    (@loc_enid, @emo_ashamed_id, "Ashamed"),
    (@loc_frid, @emo_ashamed_id, "Honteux"),
    (@loc_ptid, @emo_ashamed_id, "Envergonhado");
-- 4.3.2 Penedit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_3_2_EMOTION_REGRETFUL");
set @emo_regretful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_regretful_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_regretful_id, "Arrepentido/a"),
    (@loc_caid, @emo_regretful_id, "Penedit/da"),
    (@loc_enid, @emo_regretful_id, "Regretful"),
    (@loc_frid, @emo_regretful_id, "Remords"),
    (@loc_ptid, @emo_regretful_id, "Arrependido");
-- 4.4 Abandonat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_4_EMOTION_ABANDONED");
set @emo_abandoned_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_abandoned_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_abandoned_id, "Abandonado/a"),
    (@loc_caid, @emo_abandoned_id, "Abandonat/da"),
    (@loc_enid, @emo_abandoned_id, "Abandoned"),
    (@loc_frid, @emo_abandoned_id, "Abandon"),
    (@loc_ptid, @emo_abandoned_id, "Abandonado");
-- 4.4.1 Ignorat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_4_1_EMOTION_IGNORED");
set @emo_ignored_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_ignored_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_ignored_id, "Ignorado/a"),
    (@loc_caid, @emo_ignored_id, "Ignorat/da"),
    (@loc_enid, @emo_ignored_id, "Ignored"),
    (@loc_frid, @emo_ignored_id, "Ignoré"),
    (@loc_ptid, @emo_ignored_id, "Ignorado");
-- 4.4.2 Victimitzat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_4_2_EMOTION_VICTIMIZED");
set @emo_victimized_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_victimized_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_victimized_id, "Victimitzado/a"),
    (@loc_caid, @emo_victimized_id, "Victimitzat/da"),
    (@loc_enid, @emo_victimized_id, "Victimized"),
    (@loc_frid, @emo_victimized_id, "Intimidé"),
    (@loc_ptid, @emo_victimized_id, "Vitimado");
-- 4.5 Sol/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_5_EMOTION_ALONE");
set @emo_alone_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_alone_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_alone_id, "Solo/a"),
    (@loc_caid, @emo_alone_id, "Sol/a"),
    (@loc_enid, @emo_alone_id, "Alone"),
    (@loc_frid, @emo_alone_id, "Solitude"),
    (@loc_ptid, @emo_alone_id, "Sozinho");
-- 4.5.1 Desemparat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_5_1_EMOTION_HOMELESS");
set @emo_homeless_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_homeless_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_homeless_id, "Desamparado/a"),
    (@loc_caid, @emo_homeless_id, "Desemparat/da"),
    (@loc_enid, @emo_homeless_id, "Homeless"),
    (@loc_frid, @emo_homeless_id, "Abandonné"),
    (@loc_ptid, @emo_homeless_id, "Desamparado");
-- 4.5.2 Aïllat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_5_2_EMOTION_ISOLATED");
set @emo_isolated_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_isolated_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_isolated_id, "Aislado/a"),
    (@loc_caid, @emo_isolated_id, "Aïllat/da"),
    (@loc_enid, @emo_isolated_id, "Isolated"),
    (@loc_frid, @emo_isolated_id, "Isolé"),
    (@loc_ptid, @emo_isolated_id, "Isolado");
-- 4.6 Avorrit/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_6_EMOTION_BORED");
set @emo_bored_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_bored_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_bored_id, "Aburrido/a"),
    (@loc_caid, @emo_bored_id, "Avorrit/da"),
    (@loc_enid, @emo_bored_id, "Bored"),
    (@loc_frid, @emo_bored_id, "Ennui"),
    (@loc_ptid, @emo_bored_id, "Entediado");
-- 4.6.1 Apàtic/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_6_1_EMOTION_APATHETIC");
set @emo_apathetic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_sarcastic_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_apathetic_id, "Apático/a"),
    (@loc_caid, @emo_apathetic_id, "Apàtic/a"),
    (@loc_enid, @emo_apathetic_id, "Apathetic"),
    (@loc_frid, @emo_apathetic_id, "Amorphe"),
    (@loc_ptid, @emo_apathetic_id, "Apático");
-- 4.6.2 Indiferent
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#4_6_2_EMOTION_INDIFFERENT");
set @emo_indifferent_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_indifferent_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_indifferent_id, "Indiferente"),
    (@loc_caid, @emo_indifferent_id, "Indiferent"),
    (@loc_enid, @emo_indifferent_id, "Indifferent"),
    (@loc_frid, @emo_indifferent_id, "Indifférend"),
    (@loc_ptid, @emo_indifferent_id, "Indiferente");
-- 5. Desconcertat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_EMOTION_SUPRISE");
set @emo_surprise_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_surprise_id, NULL, 0, 1);
set @parent_level_1 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_surprise_id, "Sorpresa"),
    (@loc_caid, @emo_surprise_id, "Desconcertat/da"),
    (@loc_enid, @emo_surprise_id, "Surprise"),
    (@loc_frid, @emo_surprise_id, "Surprise"),
    (@loc_ptid, @emo_surprise_id, "Surpresa");
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_surprise_id, NULL, 0, 1);
-- 5.1 Confús/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_1_EMOTION_CONFUSED");
set @emo_confused_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_confused_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_confused_id, "Confundido/a"),
    (@loc_caid, @emo_confused_id, "Confús/a"),
    (@loc_enid, @emo_confused_id, "Confused"),
    (@loc_frid, @emo_confused_id, "Confu"),
    (@loc_ptid, @emo_confused_id, "Confuso");
-- 5.1.1 Desil·lusionat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_1_1_EMOTION_DISILLUSIONED");
set @emo_disillusioned_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_disillusioned_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(
        @loc_esid,
        @emo_disillusioned_id,
        "Desilusionado/a"
    ),
    (
        @loc_caid,
        @emo_disillusioned_id,
        "Desil·lusionat/da"
    ),
    (
        @loc_enid,
        @emo_disillusioned_id,
        "Disillusioned"
    ),
    (
        @loc_frid,
        @emo_disillusioned_id,
        "Désillusionné"
    ),
    (@loc_ptid, @emo_disillusioned_id, "Desiludido");
-- 5.1.2 Perplex/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_1_2_EMOTION_PERPLEXED");
set @emo_perplexed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_perplexed_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_perplexed_id, "Perplejo/a"),
    (@loc_caid, @emo_perplexed_id, "Perplex/a"),
    (@loc_enid, @emo_perplexed_id, "Perplexed"),
    (@loc_frid, @emo_perplexed_id, "Perplexe"),
    (@loc_ptid, @emo_perplexed_id, "Perplexo");
-- 5.2 Sorprès/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_2_EMOTION_SURPRISED");
set @emo_surprised_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_surprised_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_surprised_id, "Sorprendido/a"),
    (@loc_caid, @emo_surprised_id, "Sorprès/a"),
    (@loc_enid, @emo_surprised_id, "Surprised"),
    (@loc_frid, @emo_surprised_id, "Surpris"),
    (@loc_ptid, @emo_surprised_id, "Surpreso");
-- 5.2.1 Abatut/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_2_1_EMOTION_DEJECTED");
set @emo_dejected_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_dejected_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_dejected_id, "Abatido/a"),
    (@loc_caid, @emo_dejected_id, "Abatut/da"),
    (@loc_enid, @emo_dejected_id, "Dejected"),
    (@loc_frid, @emo_dejected_id, "Consterné"),
    (@loc_ptid, @emo_dejected_id, "Abatido");
-- 5.2.2 Commocionat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_2_2_EMOTION_SHOCKED");
set @emo_shocked_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_shocked_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_shocked_id, "Conmocionado/a"),
    (@loc_caid, @emo_shocked_id, "Commocionat/da"),
    (@loc_enid, @emo_shocked_id, "Shocked"),
    (@loc_frid, @emo_shocked_id, "Choqué"),
    (@loc_ptid, @emo_shocked_id, "Chocado");
-- 5.3 Impressionat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_3_EMOTION_ASTONISHED");
set @emo_astonished_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_astonished_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_astonished_id, "Asombrado/a"),
    (@loc_caid, @emo_astonished_id, "Impressionat/da"),
    (@loc_enid, @emo_astonished_id, "Astonished"),
    (@loc_frid, @emo_astonished_id, "Étonné"),
    (@loc_ptid, @emo_astonished_id, "Surpreso");
-- 5.3.1 Estupefacte/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_3_1_EMOTION_STUPEFIED");
set @emo_stupefied_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_stupefied_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_stupefied_id, "Estupefacto/a"),
    (@loc_caid, @emo_stupefied_id, "Estupefacte/a"),
    (@loc_enid, @emo_stupefied_id, "Stupefied"),
    (@loc_frid, @emo_stupefied_id, "Stupéfait"),
    (@loc_ptid, @emo_stupefied_id, "Estupefato");
-- 5.3.2 Impressionat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_3_2_EMOTION_IMPRESSED");
set @emo_impressed_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_impressed_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_impressed_id, "Impresionado/a"),
    (@loc_caid, @emo_impressed_id, "Impressionat/da"),
    (@loc_enid, @emo_impressed_id, "Impressed"),
    (@loc_frid, @emo_impressed_id, "Impressionné"),
    (@loc_ptid, @emo_impressed_id, "Impressionado");
-- 5.4 Entusiasmat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_4_EMOTION_ENTHUSIASTIC");
set @emo_enthusiastic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_enthusiastic_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(
        @loc_esid,
        @emo_enthusiastic_id,
        "Entusiasmado/a"
    ),
    (
        @loc_caid,
        @emo_enthusiastic_id,
        "Entusiasmat/da"
    ),
    (@loc_enid, @emo_enthusiastic_id, "Enthusiastic"),
    (@loc_frid, @emo_enthusiastic_id, ""),
    (@loc_ptid, @emo_enthusiastic_id, "");
-- 5.4.1 Entusiasta
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_4_1_EMOTION_ENTHUSIAST");
set @emo_enthusiast_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_enthusiast_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_enthusiast_id, "Entusiasta"),
    (@loc_caid, @emo_enthusiast_id, "Entusiasta"),
    (@loc_enid, @emo_enthusiast_id, "Enthusiast"),
    (@loc_frid, @emo_enthusiast_id, "Avide"),
    (@loc_ptid, @emo_enthusiast_id, "Entusiasta");
-- 5.4.2 Enèrgic/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#5_4_2_EMOTION_ENERGETIC");
set @emo_energetic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_energetic_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_energetic_id, "Enérgico/a"),
    (@loc_caid, @emo_energetic_id, "Enèrgic/a"),
    (@loc_enid, @emo_energetic_id, "Energetic"),
    (@loc_frid, @emo_energetic_id, "Énergétique"),
    (@loc_ptid, @emo_energetic_id, "Energético");
-- 6. Feliç
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_EMOTION_HAPPINESS");
set @emo_happiness_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_happiness_id, NULL, 0, 1);
set @parent_level_1 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_happiness_id, "Felicidad"),
    (@loc_caid, @emo_happiness_id, "Feliç"),
    (@loc_enid, @emo_happiness_id, "Happiness"),
    (@loc_frid, @emo_happiness_id, "Heureux"),
    (@loc_ptid, @emo_happiness_id, "Felicidade");
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_happiness_id, NULL, 0, 1);
-- 6.1 Interessat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_1_EMOTION_INTERESTED");
set @emo_interested_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_interested_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_interested_id, "Interesado/a"),
    (@loc_caid, @emo_interested_id, "Interessat/da"),
    (@loc_enid, @emo_interested_id, "Interested"),
    (@loc_frid, @emo_interested_id, "Intéressée"),
    (@loc_ptid, @emo_interested_id, "Interessado");
-- 6.1.1 Entretingut/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_1_1_EMOTION_ENTERTAINING");
set @emo_entertaining_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_entertaining_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_entertaining_id, "Entretenido/a"),
    (
        @loc_caid,
        @emo_entertaining_id,
        "Entretingut/da"
    ),
    (@loc_enid, @emo_entertaining_id, "Entertaining"),
    (@loc_frid, @emo_entertaining_id, "Amusé"),
    (@loc_ptid, @emo_entertaining_id, "Divertido");
-- 6.1.2 Curiós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_1_2_EMOTION_CURIOUS");
set @emo_curious_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_curious_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_curious_id, "Curioso/a"),
    (@loc_caid, @emo_curious_id, "Curiós/a"),
    (@loc_enid, @emo_curious_id, "Curious"),
    (@loc_frid, @emo_curious_id, "Curieux"),
    (@loc_ptid, @emo_curious_id, "Curioso");
-- 6.2 Calmat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_2_EMOTION_CALM");
set @emo_calm_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_calm_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_calm_id, "Calmado/a"),
    (@loc_caid, @emo_calm_id, "Calmat/da"),
    (@loc_enid, @emo_calm_id, "Calm"),
    (@loc_frid, @emo_calm_id, "Calme"),
    (@loc_ptid, @emo_calm_id, "Calma");
-- 6.2.1 Sensible
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_2_1_EMOTION_SENSITIVE");
set @emo_sensitive_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_sensitive_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_sensitive_id, "Sensible"),
    (@loc_caid, @emo_sensitive_id, "Sensible"),
    (@loc_enid, @emo_sensitive_id, "Sensitive"),
    (@loc_frid, @emo_sensitive_id, "Sensible"),
    (@loc_ptid, @emo_sensitive_id, "Sensível");
-- 6.2.2 Bromista
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_2_2_EMOTION_PRANKSTER");
set @emo_prankster_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_prankster_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_prankster_id, "Bromista"),
    (@loc_caid, @emo_prankster_id, "Bromista"),
    (@loc_enid, @emo_prankster_id, "Prankster"),
    (@loc_frid, @emo_prankster_id, "Espiègle"),
    (@loc_ptid, @emo_prankster_id, "Brincalhão");
-- 6.3 Acceptat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_3_EMOTION_ACCEPTED");
set @emo_accepted_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_accepted_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_accepted_id, "Acceptado/a"),
    (@loc_caid, @emo_accepted_id, "Acceptat/da"),
    (@loc_enid, @emo_accepted_id, "Accepted"),
    (@loc_frid, @emo_accepted_id, "Accepté"),
    (@loc_ptid, @emo_accepted_id, "Aceito");
-- 6.3.1 Respectat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_3_1_EMOTION_RESPECTED");
set @emo_respected_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_respected_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_respected_id, "Respetado/a"),
    (@loc_caid, @emo_respected_id, "Respectat/da"),
    (@loc_enid, @emo_respected_id, "Respected"),
    (@loc_frid, @emo_respected_id, "Respecté"),
    (@loc_ptid, @emo_respected_id, "Respeitado");
-- 6.3.2 Satisfet/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_3_2_EMOTION_SATISFIED");
set @emo_satisfied_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_satisfied_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_satisfied_id, "Satisfecho/a"),
    (@loc_caid, @emo_satisfied_id, "Satisfet/a"),
    (@loc_enid, @emo_satisfied_id, "Satisfied"),
    (@loc_frid, @emo_satisfied_id, "Accompli"),
    (@loc_ptid, @emo_satisfied_id, "Satisfeito");
-- 6.4 Pacífic/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_4_EMOTION_PACIFIC");
set @emo_pacific_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_pacific_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_pacific_id, "Pacífico/a"),
    (@loc_caid, @emo_pacific_id, "Pacífic/a"),
    (@loc_enid, @emo_pacific_id, "Pacific"),
    (@loc_frid, @emo_pacific_id, "Paisible"),
    (@loc_ptid, @emo_pacific_id, "Pacífico");
-- 6.4.1 Afectuós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_4_1_EMOTION_AFFECTIONATE");
set @emo_affectionate_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_affectionate_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_affectionate_id, "Cariñoso/a"),
    (@loc_caid, @emo_affectionate_id, "Afectuós/a"),
    (@loc_enid, @emo_affectionate_id, "Affectionate"),
    (@loc_frid, @emo_affectionate_id, "Aimant"),
    (@loc_ptid, @emo_affectionate_id, "Carinhoso");
-- 6.4.2 Esperançat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_4_2_EMOTION_HOPEFUL");
set @emo_hopeful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_hopeful_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_hopeful_id, "Esperanzado/a"),
    (@loc_caid, @emo_hopeful_id, "Esperançat/da"),
    (@loc_enid, @emo_hopeful_id, "Hopeful"),
    (@loc_frid, @emo_hopeful_id, "Optimiste"),
    (@loc_ptid, @emo_hopeful_id, "Esperançoso");
-- 6.5 Optimista
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_5_EMOTION_OPTIMISTIC");
set @emo_optimistic_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_optimistic_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_optimistic_id, "Optimista"),
    (@loc_caid, @emo_optimistic_id, "Optimista"),
    (@loc_enid, @emo_optimistic_id, "Optimistic"),
    (@loc_frid, @emo_optimistic_id, "Optimiste"),
    (@loc_ptid, @emo_optimistic_id, "Otimista");
-- 6.5.1 Obert/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_5_1_EMOTION_OPEN");
set @emo_open_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_open_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_open_id, "Abierto/a"),
    (@loc_caid, @emo_open_id, "Obert/a"),
    (@loc_enid, @emo_open_id, "Open"),
    (@loc_frid, @emo_open_id, "Ouvert"),
    (@loc_ptid, @emo_open_id, "Abrir");
-- 6.5.2 Inspirat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_5_2_EMOTION_INSPIRED");
set @emo_inspired_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_inspired_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_inspired_id, "Inspirado/a"),
    (@loc_caid, @emo_inspired_id, "Inspirat/da"),
    (@loc_enid, @emo_inspired_id, "Inspired"),
    (@loc_frid, @emo_inspired_id, "Inspiré"),
    (@loc_ptid, @emo_inspired_id, "Inspirado");
-- 6.6 Alegre
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_6_EMOTION_CHEERFUL");
set @emo_cheerful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_cheerful_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_cheerful_id, "Alegre"),
    (@loc_caid, @emo_cheerful_id, "Alegre"),
    (@loc_enid, @emo_cheerful_id, "Cheerful"),
    (@loc_frid, @emo_cheerful_id, "Joyeux"),
    (@loc_ptid, @emo_cheerful_id, "Alegre");
-- 6.6.1 Alliberat/da
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_6_1_EMOTION_RELEASED");
set @emo_released_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_released_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_released_id, "Liberado/a"),
    (@loc_caid, @emo_released_id, "Alliberat/da"),
    (@loc_enid, @emo_released_id, "Released"),
    (@loc_frid, @emo_released_id, "Liberé"),
    (@loc_ptid, @emo_released_id, "Liberado");
-- 6.6.2 Eufòric/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_6_2_EMOTION_EUPHORIC");
set @emo_euphoric_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_euphoric_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_euphoric_id, "Eufórico/a"),
    (@loc_caid, @emo_euphoric_id, "Eufòric/a"),
    (@loc_enid, @emo_euphoric_id, "Euphoric"),
    (@loc_frid, @emo_euphoric_id, "Extasié"),
    (@loc_ptid, @emo_euphoric_id, "Eufórico");
-- 6.7 Orgullós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_7_EMOTION_PROUD");
set @emo_proud_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_proud_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_proud_id, "Orgulloso/a"),
    (@loc_caid, @emo_proud_id, "Orgullós/a"),
    (@loc_enid, @emo_proud_id, "Proud"),
    (@loc_frid, @emo_proud_id, "Fier"),
    (@loc_ptid, @emo_proud_id, "Orgulhoso");
-- 6.7.1 Important
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_7_1_EMOTION_IMPORTANT");
set @emo_important_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_important_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_important_id, "Importante"),
    (@loc_caid, @emo_important_id, "Important"),
    (@loc_enid, @emo_important_id, "Important"),
    (@loc_frid, @emo_important_id, "Important"),
    (@loc_ptid, @emo_important_id, "Important");
-- 6.7.2 Segur/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_7_2_EMOTION_INSURANCE");
set @emo_insurance_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_insurance_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_insurance_id, "Seguro/a"),
    (@loc_caid, @emo_insurance_id, "Segur/a"),
    (@loc_enid, @emo_insurance_id, "Insurance"),
    (@loc_frid, @emo_insurance_id, "Confiant"),
    (@loc_ptid, @emo_insurance_id, "Seguro");
-- 6.8 Poderós/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_8_EMOTION_POWERFUL");
set @emo_powerful_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_powerful_id, @parent_level_1, 0, 1);
set @parent_level_2 = LAST_INSERT_ID();
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_powerful_id, "Poderoso/a"),
    (@loc_caid, @emo_powerful_id, "Poderós/a"),
    (@loc_enid, @emo_powerful_id, "Powerful"),
    (@loc_frid, @emo_powerful_id, "Fort"),
    (@loc_ptid, @emo_powerful_id, "Poderoso");
-- 6.8.1 Valent/a
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_8_1_EMOTION_BRAVE");
set @emo_brave_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_brave_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_brave_id, "Valiente"),
    (@loc_caid, @emo_brave_id, "Valent/a"),
    (@loc_enid, @emo_brave_id, "Brave"),
    (@loc_frid, @emo_brave_id, "Courageux"),
    (@loc_ptid, @emo_brave_id, "Corajoso");
-- 6.8.2 Provocatiu/va
INSERT INTO TEXT_KEY (TEXT_KEY)
VALUES ("#6_8_2_EMOTION_PROVOCATIVE");
set @emo_provocative_id = LAST_INSERT_ID();
INSERT INTO EMOTION (NAME_ID, PARENT_ID, VALUE, CREATED_BY)
VALUES(@emo_provocative_id, @parent_level_2, 0, 1);
INSERT INTO TRANSLATION (LOCALE_ID, TEXT_KEY_ID, LITERAL)
VALUES(@loc_esid, @emo_provocative_id, "Provocativo/a"),
    (@loc_caid, @emo_provocative_id, "Provocatiu/va"),
    (@loc_enid, @emo_provocative_id, "Provocative"),
    (@loc_frid, @emo_provocative_id, "Provocant"),
    (@loc_ptid, @emo_provocative_id, "Provocativo");