--------------------------------------------------------
--  File created - Tuesday-January-17-2017
--------------------------------------------------------
DROP TABLE "HVK_DAILY_RATE" CASCADE CONSTRAINTS;
DROP TABLE "HVK_DISCOUNT" CASCADE CONSTRAINTS;
DROP TABLE "HVK_FOOD" CASCADE CONSTRAINTS;
DROP TABLE "HVK_KENNEL_LOG" CASCADE CONSTRAINTS;
DROP TABLE "HVK_MEDICATION" CASCADE CONSTRAINTS;
DROP TABLE "HVK_OWNER" CASCADE CONSTRAINTS;
DROP TABLE "HVK_PET" CASCADE CONSTRAINTS;
DROP TABLE "HVK_PET_FOOD" CASCADE CONSTRAINTS;
DROP TABLE "HVK_PET_RESERVATION" CASCADE CONSTRAINTS;
DROP TABLE "HVK_PET_RESERVATION_DISCOUNT" CASCADE CONSTRAINTS;
DROP TABLE "HVK_PET_RESERVATION_SERVICE" CASCADE CONSTRAINTS;
DROP TABLE "HVK_PET_VACCINATION" CASCADE CONSTRAINTS;
DROP TABLE "HVK_RESERVATION" CASCADE CONSTRAINTS;
DROP TABLE "HVK_RESERVATION_DISCOUNT" CASCADE CONSTRAINTS;
DROP TABLE "HVK_RUN" CASCADE CONSTRAINTS;
DROP TABLE "HVK_SERVICE" CASCADE CONSTRAINTS;
DROP TABLE "HVK_VACCINATION" CASCADE CONSTRAINTS;
DROP TABLE "HVK_VETERINARIAN" CASCADE CONSTRAINTS;
--------------------------------------------------------
--  DDL for Table HVK_DAILY_RATE
--------------------------------------------------------
CREATE TABLE "HVK_DAILY_RATE"
  (
    "DAILY_RATE_NUMBER"   NUMBER(7,0),
    "DAILY_RATE"          NUMBER(5,2),
    "DAILY_RATE_DOG_SIZE" CHAR(1 BYTE),
    "SERV_SERVICE_NUMBER" NUMBER(7,0)
  ) ;
--------------------------------------------------------
--  DDL for Table HVK_DISCOUNT
--------------------------------------------------------
CREATE TABLE "HVK_DISCOUNT"
  (
    "DISCOUNT_NUMBER"      NUMBER(7,0),
    "DISCOUNT_DESCRIPTION" VARCHAR2(50 BYTE),
    "DISCOUNT_PERCENTAGE"  NUMBER(3,2),
    "DISCOUNT_TYPE"        CHAR(1 BYTE) DEFAULT 'D'
  ) ;
--------------------------------------------------------
--  DDL for Table HVK_FOOD
--------------------------------------------------------
CREATE TABLE "HVK_FOOD"
  (
    "FOOD_NUMBER"  NUMBER(7,0),
    "FOOD_BRAND"   VARCHAR2(50 BYTE),
    "FOOD_VARIETY" VARCHAR2(100 BYTE)
  ) ;
--------------------------------------------------------
--  DDL for Table HVK_KENNEL_LOG
--------------------------------------------------------
CREATE TABLE "HVK_KENNEL_LOG"
  (
    "KENNEL_LOG_DATE"            DATE,
    "KENNEL_LOG_SEQUENCE_NUMBER" NUMBER DEFAULT 1,
    "KENNEL_LOG_NOTES"           VARCHAR2(200 BYTE),
    "PR_PET_RES_NUMBER"          NUMBER(7,0),
    "KENNEL_LOG_VIDEO" BLOB
  ) ;
COMMENT ON COLUMN "HVK_KENNEL_LOG"."KENNEL_LOG_SEQUENCE_NUMBER"
IS
  'Sequence number defaults to 1 and allows for more than 1 kennel log entry in a day. ';
  --------------------------------------------------------
  --  DDL for Table HVK_MEDICATION
  --------------------------------------------------------
  CREATE TABLE "HVK_MEDICATION"
    (
      "MEDICATION_NUMBER"           NUMBER(7,0),
      "MEDICATION_NAME"             VARCHAR2(50 BYTE),
      "MEDICATION_DOSAGE"           VARCHAR2(50 BYTE),
      "MEDICATION_SPECIAL_INSTRUCT" VARCHAR2(50 BYTE),
      "MEDICATION_END_DATE"         DATE,
      "PR_PET_RES_NUMBER"           NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_OWNER
  --------------------------------------------------------
  CREATE TABLE "HVK_OWNER"
    (
      "OWNER_NUMBER"                 NUMBER(7,0),
      "OWNER_FIRST_NAME"             VARCHAR2(25 BYTE),
      "OWNER_LAST_NAME"              VARCHAR2(25 BYTE),
      "OWNER_STREET"                 VARCHAR2(40 BYTE),
      "OWNER_CITY"                   VARCHAR2(25 BYTE),
      "OWNER_PROVINCE"               CHAR(2 BYTE) DEFAULT 'QC',
      "OWNER_POSTAL_CODE"            CHAR(6 BYTE),
      "OWNER_PHONE"                  CHAR(10 BYTE),
      "OWNER_EMAIL"                  VARCHAR2(50 BYTE),
      "EMERGENCY_CONTACT_FIRST_NAME" VARCHAR2(25 BYTE),
      "EMERGENCY_CONTACT_LAST_NAME"  VARCHAR2(25 BYTE),
      "EMERGENCY_CONTACT_PHONE"      CHAR(10 BYTE),
      "VET_VET_NUMBER"               NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_PET
  --------------------------------------------------------
  CREATE TABLE "HVK_PET"
    (
      "PET_NUMBER"       NUMBER(7,0),
      "PET_NAME"         VARCHAR2(25 BYTE),
      "PET_GENDER"       CHAR(1 BYTE),
      "PET_FIXED"        CHAR(1 BYTE),
      "PET_BREED"        VARCHAR2(50 BYTE),
      "PET_BIRTHDATE"    DATE,
      "OWN_OWNER_NUMBER" NUMBER(7,0),
      "PET_PICTURE" BLOB,
      "DOG_SIZE"      CHAR(1 BYTE),
      "SPECIAL_NOTES" VARCHAR2(200 BYTE)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_PET_FOOD
  --------------------------------------------------------
  CREATE TABLE "HVK_PET_FOOD"
    (
      "PET_FOOD_FREQUENCY" NUMBER DEFAULT 1,
      "PET_FOOD_QUANTITY"  VARCHAR2(50 BYTE),
      "PR_PET_RES_NUMBER"  NUMBER(7,0),
      "FOOD_FOOD_NUMBER"   NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_PET_RESERVATION
  --------------------------------------------------------
  CREATE TABLE "HVK_PET_RESERVATION"
    (
      "PET_RES_NUMBER"         NUMBER(7,0),
      "PET_PET_NUMBER"         NUMBER(7,0),
      "RES_RESERVATION_NUMBER" NUMBER(7,0),
      "RUN_RUN_NUMBER"         NUMBER(7,0),
      "PR_SHARING_WITH"        NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_PET_RESERVATION_DISCOUNT
  --------------------------------------------------------
  CREATE TABLE "HVK_PET_RESERVATION_DISCOUNT"
    (
      "DISC_DISCOUNT_NUMBER" NUMBER(7,0),
      "PR_PET_RES_NUMBER"    NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_PET_RESERVATION_SERVICE
  --------------------------------------------------------
  CREATE TABLE "HVK_PET_RESERVATION_SERVICE"
    (
      "SERVICE_FREQUENCY"   NUMBER(2,0),
      "PR_PET_RES_NUMBER"   NUMBER(7,0),
      "SERV_SERVICE_NUMBER" NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_PET_VACCINATION
  --------------------------------------------------------
  CREATE TABLE "HVK_PET_VACCINATION"
    (
      "VACCINATION_EXPIRY_DATE" DATE,
      "VACC_VACCINATION_NUMBER" NUMBER(7,0),
      "PET_PET_NUMBER"          NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_RESERVATION
  --------------------------------------------------------
  CREATE TABLE "HVK_RESERVATION"
    (
      "RESERVATION_NUMBER"     NUMBER(7,0),
      "RESERVATION_START_DATE" DATE,
      "RESERVATION_END_DATE"   DATE
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_RESERVATION_DISCOUNT
  --------------------------------------------------------
  CREATE TABLE "HVK_RESERVATION_DISCOUNT"
    (
      "DISC_DISCOUNT_NUMBER"   NUMBER(7,0),
      "RES_RESERVATION_NUMBER" NUMBER(7,0)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_RUN
  --------------------------------------------------------
  CREATE TABLE "HVK_RUN"
    (
      "RUN_NUMBER"   NUMBER(7,0),
      "RUN_SIZE"     CHAR(1 BYTE) DEFAULT 'R',
      "RUN_COVERED"  CHAR(1 BYTE),
      "RUN_LOCATION" CHAR(1 BYTE),
      "RUN_STATUS"   NUMBER(1,0) DEFAULT 1
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_SERVICE
  --------------------------------------------------------
  CREATE TABLE "HVK_SERVICE"
    (
      "SERVICE_NUMBER"      NUMBER(7,0),
      "SERVICE_DESCRIPTION" VARCHAR2(50 BYTE)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_VACCINATION
  --------------------------------------------------------
  CREATE TABLE "HVK_VACCINATION"
    (
      "VACCINATION_NUMBER" NUMBER(7,0),
      "VACCINATION_NAME"   VARCHAR2(50 BYTE)
    ) ;
  --------------------------------------------------------
  --  DDL for Table HVK_VETERINARIAN
  --------------------------------------------------------
  CREATE TABLE "HVK_VETERINARIAN"
    (
      "VET_NUMBER"      NUMBER(7,0),
      "VET_NAME"        VARCHAR2(50 BYTE),
      "VET_PHONE"       CHAR(10 BYTE),
      "VET_STREET"      VARCHAR2(40 BYTE),
      "VET_CITY"        VARCHAR2(25 BYTE),
      "VET_PROVINCE"    CHAR(2 BYTE) DEFAULT 'QC',
      "VET_POSTAL_CODE" CHAR(6 BYTE)
    ) ;
  COMMENT ON COLUMN "HVK_VETERINARIAN"."VET_NAME"
IS
  'Name of pet''s veterinarian or the veterinarian clinic name';
  REM INSERTING into HVK_DAILY_RATE
  SET DEFINE OFF;
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,10,
      'S',
      1
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      2,11,
      'M',
      1
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      3,12,
      'L',
      1
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      4,2,
      'S',
      2
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      5,3,
      'M',
      2
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      6,4,
      'L',
      2
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      7,2,
      'S',
      3
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      8,3,
      'M',
      3
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      9,4,
      'L',
      3
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      10,2,
      NULL,
      5
    );
  INSERT
  INTO HVK_DAILY_RATE
    (
      DAILY_RATE_NUMBER,
      DAILY_RATE,
      DAILY_RATE_DOG_SIZE,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      11,1,
      NULL,
      4
    );
  REM INSERTING into HVK_DISCOUNT
  SET DEFINE OFF;
  INSERT
  INTO HVK_DISCOUNT
    (
      DISCOUNT_NUMBER,
      DISCOUNT_DESCRIPTION,
      DISCOUNT_PERCENTAGE,
      DISCOUNT_TYPE
    )
    VALUES
    (
      1,
      'Shared Run',
      0.1,
      'D'
    );
  INSERT
  INTO HVK_DISCOUNT
    (
      DISCOUNT_NUMBER,
      DISCOUNT_DESCRIPTION,
      DISCOUNT_PERCENTAGE,
      DISCOUNT_TYPE
    )
    VALUES
    (
      2,
      'Multiple Pets',
      0.07,
      'T'
    );
  INSERT
  INTO HVK_DISCOUNT
    (
      DISCOUNT_NUMBER,
      DISCOUNT_DESCRIPTION,
      DISCOUNT_PERCENTAGE,
      DISCOUNT_TYPE
    )
    VALUES
    (
      3,
      'Own Food',
      0.1,
      'D'
    );
  REM INSERTING into HVK_FOOD
  SET DEFINE OFF;
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      1,
      'Iams',
      'Mini Chunks'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      2,
      'Iams',
      'Large Dog'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      3,
      'Iams',
      'Weight Control'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      4,
      'Iams',
      'Beef and Rice Formula'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      5,
      'President''s Choice',
      'Xtra Meaty Chicken and Rice'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      6,
      'President''s Choice',
      'Xtra Meaty Lamb and Rice'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      7,
      'Purina',
      'Dog Chow'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      11,
      'Science Diet',
      'Allergy Formula'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      13,
      'Own Food',
      NULL
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      14,
      'Pedigree',
      'Choice Cuts in Sauce Country Stew'
    );
  INSERT
  INTO HVK_FOOD
    (
      FOOD_NUMBER,
      FOOD_BRAND,
      FOOD_VARIETY
    )
    VALUES
    (
      15,
      'Purina',
      'Moist Meaty Burger with Cheddar Cheese Burger with Cheddar Cheese'
    );
  REM INSERTING into HVK_KENNEL_LOG
  SET DEFINE OFF;
  REM INSERTING into HVK_MEDICATION
  SET DEFINE OFF;
  INSERT
  INTO HVK_MEDICATION
    (
      MEDICATION_NUMBER,
      MEDICATION_NAME,
      MEDICATION_DOSAGE,
      MEDICATION_SPECIAL_INSTRUCT,
      MEDICATION_END_DATE,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      2,
      'Tapzole',
      '1/2 tablet once daily',
      NULL,
      NULL,
      264
    );
  INSERT
  INTO HVK_MEDICATION
    (
      MEDICATION_NUMBER,
      MEDICATION_NAME,
      MEDICATION_DOSAGE,
      MEDICATION_SPECIAL_INSTRUCT,
      MEDICATION_END_DATE,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      4,
      'Medicam',
      '36 kg',
      NULL,
      NULL,
      240
    );
  INSERT
  INTO HVK_MEDICATION
    (
      MEDICATION_NUMBER,
      MEDICATION_NAME,
      MEDICATION_DOSAGE,
      MEDICATION_SPECIAL_INSTRUCT,
      MEDICATION_END_DATE,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      3,
      'Prednisone',
      '1 tablet twice daily',
      NULL,
      NULL,
      287
    );
  INSERT
  INTO HVK_MEDICATION
    (
      MEDICATION_NUMBER,
      MEDICATION_NAME,
      MEDICATION_DOSAGE,
      MEDICATION_SPECIAL_INSTRUCT,
      MEDICATION_END_DATE,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,
      'Prednisone',
      '1 tablet twice daily',
      NULL,
      NULL,
      300
    );
  REM INSERTING into HVK_OWNER
  SET DEFINE OFF;
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      18,
      'Barb B.',
      'Que',
      '18 Sequel Row',
      'Gatineau',
      'QC',
      'J8A1V3',
      '8195554215',
      'bque@gmail.com',
      NULL,
      NULL,
      NULL,
      2
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      19,
      'Chester',
      'Drawers',
      NULL,
      NULL,
      NULL,
      NULL,
      '8191234876',
      'cdrawers@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      20,
      'Anita',
      'Alibi',
      NULL,
      NULL,
      NULL,
      NULL,
      '8191224876',
      'aalibi@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      8,
      'Amanda',
      'Linn',
      '23 Java Road',
      'Gatineau',
      'QC',
      'J8Y6T5',
      '8195552233',
      'alinn@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      6,
      'Jeff',
      'Summers',
      '62 Adams',
      'Maniwaki',
      'QC',
      'J8Y8T3',
      '8195551843',
      'jsummers@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      7,
      'Peter',
      'Piper',
      '107 Main',
      'Gatineau',
      'QC',
      'J8Y6T3',
      '8195554543',
      'ppiper@gmail.com',
      NULL,
      NULL,
      NULL,
      2
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      1,
      'Jane',
      'Smith',
      '202 Poodle Path',
      'Gatineau',
      'QC',
      'J8A1R2',
      '8195551111',
      'jsmith@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      2,
      'Mike',
      'O''Phone',
      '74 Benton',
      'Gatineau',
      'QC',
      'J8Y6T3',
      '8195552222',
      'mophone@gmail.com',
      NULL,
      NULL,
      NULL,
      2
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      3,
      'Dwight',
      'Wong',
      '384 Garten',
      'Ottawa',
      'ON',
      'K8Y6T3',
      '8195555222',
      'dwong@gmail.com',
      NULL,
      NULL,
      NULL,
      2
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      4,
      'Mahatma',
      'Coate',
      '1 Golfview',
      'Ottawa',
      'ON',
      'K8Y6T3',
      '8195559843',
      'mcoate@gmail.com',
      NULL,
      NULL,
      NULL,
      2
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      5,
      'Sue',
      'Metu',
      '3 Riverview',
      'Ottawa',
      'ON',
      'K8Y6T3',
      '8195556699',
      'smetu@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      10,
      'April',
      'Showers',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195558765',
      'ashowers@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      11,
      'Salton',
      'Pepper',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195555571',
      'spepper@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      12,
      'Ella',
      'Mentary',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195551839',
      'ementary@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      13,
      'Sam',
      'Ovar',
      NULL,
      NULL,
      NULL,
      'W2W2W2',
      '8195551652',
      'sovar@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      14,
      'Carrie',
      'Mehome',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195551232',
      'cmehome@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      15,
      'Bayo',
      'Wolfe',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195565832',
      'bwolfe@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      16,
      'Moe',
      'Bilhome',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195575332',
      'mbilhome@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  INSERT
  INTO HVK_OWNER
    (
      OWNER_NUMBER,
      OWNER_FIRST_NAME,
      OWNER_LAST_NAME,
      OWNER_STREET,
      OWNER_CITY,
      OWNER_PROVINCE,
      OWNER_POSTAL_CODE,
      OWNER_PHONE,
      OWNER_EMAIL,
      EMERGENCY_CONTACT_FIRST_NAME,
      EMERGENCY_CONTACT_LAST_NAME,
      EMERGENCY_CONTACT_PHONE,
      VET_VET_NUMBER
    )
    VALUES
    (
      17,
      'Polly',
      'Morfek',
      NULL,
      NULL,
      NULL,
      NULL,
      '8195575332',
      'pmorfek@gmail.com',
      NULL,
      NULL,
      NULL,
      1
    );
  REM INSERTING into HVK_PET
  SET DEFINE OFF;
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      33,
      'Willie',
      'M',
      'T',
      'Great Pyrenees',
      to_date('15-APR-08','DD-MON-RR'),
      18,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      34,
      'Aurora',
      'F',
      'T',
      'Beagle',
      to_date('20-AUG-08','DD-MON-RR'),
      19,
      'M',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      35,
      'Bella',
      'F',
      'T',
      'Chihuahua',
      to_date('21-MAY-07','DD-MON-RR'),
      20,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      14,
      'Grizzlie',
      'F',
      'T',
      'Shi Tzu',
      to_date('04-MAY-06','DD-MON-RR'),
      8,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      9,
      'Parker',
      'M',
      'T',
      'Shepherd Mix',
      NULL,
      6,
      'M',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      10,
      'Pete',
      'M',
      'T',
      'Tibetan Spanial - Sheltie',
      NULL,
      7,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      11,
      'Max',
      'M',
      'T',
      'Samoyed',
      NULL,
      7,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      12,
      'Kitoo',
      'F',
      'T',
      'Samoyed',
      NULL,
      7,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      1,
      'Scrabble',
      'F',
      'T',
      'Llassapoo',
      NULL,
      1,
      'S',
      'Scrabble is terrified of hot air balloons'
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      2,
      'Archie',
      'F',
      'T',
      'Standard Poodle',
      NULL,
      1,
      'M',
      'Archie is extremely shy and very timid around other dogs - she does not do well in an open playtime.'
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      3,
      'Jasper',
      'M',
      'T',
      'Black Lab',
      to_date('04-APR-05','DD-MON-RR'),
      2,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      6,
      'Huxley',
      'M',
      'T',
      'Standard Poodle',
      to_date('20-SEP-06','DD-MON-RR'),
      2,
      'M',
      'Huxley has an uncontrollable tendency to quote Shakespeare'
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      7,
      'Charlie',
      'M',
      'T',
      'Jack Russell Terrier',
      NULL,
      4,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      16,
      'Maggie',
      'F',
      'F',
      'Golden Retriever',
      to_date('02-MAR-05','DD-MON-RR'),
      10,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      26,
      'Skarpa',
      'F',
      'F',
      NULL,
      NULL,
      15,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      27,
      'Bothvar',
      'M',
      'F',
      NULL,
      NULL,
      15,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      28,
      'Foxfire',
      'F',
      'F',
      NULL,
      NULL,
      15,
      'S',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      29,
      'Shaboo',
      'F',
      'F',
      NULL,
      NULL,
      16,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      30,
      'Suki',
      'F',
      'F',
      NULL,
      NULL,
      17,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      31,
      'Sam',
      'M',
      'F',
      NULL,
      NULL,
      17,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      32,
      'Snoop Dogg',
      'M',
      'F',
      NULL,
      NULL,
      17,
      'M',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      13,
      'Logan',
      'M',
      'T',
      'Bernese Mountain Dog',
      to_date('20-OCT-01','DD-MON-RR'),
      3,
      'L',
      NULL
    );
  INSERT
  INTO HVK_PET
    (
      PET_NUMBER,
      PET_NAME,
      PET_GENDER,
      PET_FIXED,
      PET_BREED,
      PET_BIRTHDATE,
      OWN_OWNER_NUMBER,
      DOG_SIZE,
      SPECIAL_NOTES
    )
    VALUES
    (
      20,
      'Poppy',
      'F',
      'F',
      'Jack Russell Terrier',
      to_date('21-MAY-02','DD-MON-RR'),
      12,
      'S',
      NULL
    );
  REM INSERTING into HVK_PET_FOOD
  SET DEFINE OFF;
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      204,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      205,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      206,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.25',
      287,11
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      286,11
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      219,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      288,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      289,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      292,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.5 cup',
      293,15
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      294,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      295,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1,5',
      223,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      224,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1',
      225,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1',
      226,15
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25',
      227,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25',
      228,14
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25',
      228,3
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25',
      229,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1',
      229,15
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      230,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      264,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1',
      231,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1',
      232,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cups',
      233,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      234,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      235,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      236,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      237,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      296,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      239,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      240,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      241,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      242,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      243,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      272,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '1 cup',
      298,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.25',
      300,11
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      301,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.25',
      302,11
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      223,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      304,5
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      305,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.5',
      306,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.5',
      307,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      2,
      '.5',
      249,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      252,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      '.25 cup',
      297,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      215,4
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      274,4
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      273,4
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      400,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      401,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      402,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      403,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      404,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      405,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      410,2
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      411,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      412,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      424,13
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      425,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      426,1
    );
  INSERT
  INTO HVK_PET_FOOD
    (
      PET_FOOD_FREQUENCY,
      PET_FOOD_QUANTITY,
      PR_PET_RES_NUMBER,
      FOOD_FOOD_NUMBER
    )
    VALUES
    (
      1,
      NULL,
      427,1
    );
  REM INSERTING into HVK_PET_RESERVATION
  SET DEFINE OFF;
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      200,7,631,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      201,20,632,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      202,32,633,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      204,20,625,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      205,33,630,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      206,10,635,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      207,9,696,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      208,26,707,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      209,9,708,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      210,11,709,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      211,13,711,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      212,14,712,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      213,26,713,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      214,29,716,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      215,30,717,27,273
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      216,3,720,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      217,3,721,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      219,3,595,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      223,13,102,28,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      224,6,103,36,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      225,9,104,29,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      226,6,105,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      227,3,108,36,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      228,10,109,35,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      229,14,114,1,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      230,3,115,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      231,9,120,30,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      232,9,123,35,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      233,20,131,29,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      234,10,136,28,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      235,12,137,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      236,13,138,21,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      237,14,139,30,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      239,27,140,1,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      240,29,143,28,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      241,29,144,14,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      242,30,145,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      243,31,146,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      249,6,122,36,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      250,6,615,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      251,16,700,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      252,7,620,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      253,30,701,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      254,33,702,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      255,2,703,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      256,32,704,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      257,34,705,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      261,1,703,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      264,6,115,27,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      268,12,709,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      270,27,713,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      271,28,713,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      272,31,145,13,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      273,31,717,
      NULL,
      215
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      274,32,717,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      298,11,148,27,299
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      299,10,148,27,298
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      404,10,802,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      405,11,802,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      410,10,804,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      411,11,804,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      412,12,804,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      284,6,636,
      NULL,
      285
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      285,3,636,
      NULL,
      284
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      286,1,594,36,287
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      287,2,594,36,286
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      288,26,601,
      NULL,
      289
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      289,27,601,
      NULL,
      288
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      292,31,603,
      NULL,
      293
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      293,32,603,
      NULL,
      292
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      294,11,605,
      NULL,
      295
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      295,12,605,
      NULL,
      294
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      296,26,140,2,297
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      297,28,140,2,296
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      300,1,112,29,301
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      301,2,112,29,300
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      302,1,100,29,303
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      303,2,100,29,302
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      304,3,106,27,305
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      305,6,106,27,304
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      306,11,110,36,307
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      307,12,110,36,306
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      400,31,800,
      NULL,
      401
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      401,32,800,
      NULL,
      400
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      402,26,801,
      NULL,
      403
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      403,27,801,
      NULL,
      402
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      424,11,809,
      NULL,
      425
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      425,12,809,
      NULL,
      424
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      426,33,810,
      NULL,
      NULL
    );
  INSERT
  INTO HVK_PET_RESERVATION
    (
      PET_RES_NUMBER,
      PET_PET_NUMBER,
      RES_RESERVATION_NUMBER,
      RUN_RUN_NUMBER,
      PR_SHARING_WITH
    )
    VALUES
    (
      427,13,811,
      NULL,
      NULL
    );
  REM INSERTING into HVK_PET_RESERVATION_DISCOUNT
  SET DEFINE OFF;
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,284
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,285
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,286
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,287
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,288
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,289
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,292
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,293
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,294
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,295
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,296
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,297
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,300
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,301
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,302
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,303
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,304
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,305
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,306
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      1,307
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      3,306
    );
  INSERT
  INTO HVK_PET_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      PR_PET_RES_NUMBER
    )
    VALUES
    (
      3,307
    );
  REM INSERTING into HVK_PET_RESERVATION_SERVICE
  SET DEFINE OFF;
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      264,4
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      200,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      201,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      202,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      204,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      205,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      206,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      219,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      225,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      225,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      231,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      231,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      223,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      223,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      224,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      224,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      2,224,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      229,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      229,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,229,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      230,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      230,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      264,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      264,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,264,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      232,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      232,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      228,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      228,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      226,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      227,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      233,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      233,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      234,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      235,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      236,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      237,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      239,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      240,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      241,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      242,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      243,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      272,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      298,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      249,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      249,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,249,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,237,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      240,4
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      2,233,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      3,234,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      234,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      234,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      250,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      252,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      251,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      253,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      254,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      255,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      256,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      257,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      261,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      299,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      207,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      208,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      209,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      210,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      211,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      212,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      213,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      214,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      215,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      216,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      217,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      268,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      270,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      271,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      273,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      274,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      404,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      405,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      410,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      411,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      412,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      405,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      285,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      284,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      287,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      287,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      2,287,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      286,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      288,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      289,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      292,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      293,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      294,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      295,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      296,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      302,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      302,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      302,4
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      303,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      303,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      300,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      300,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      300,4
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      301,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      301,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      304,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      304,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      305,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      305,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,305,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      306,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      306,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,306,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      307,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      307,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      1,307,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      287,4
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      2,296,3
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      296,2
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      296,5
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      297,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      400,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      401,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      402,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      403,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      424,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      425,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      426,1
    );
  INSERT
  INTO HVK_PET_RESERVATION_SERVICE
    (
      SERVICE_FREQUENCY,
      PR_PET_RES_NUMBER,
      SERV_SERVICE_NUMBER
    )
    VALUES
    (
      NULL,
      427,1
    );
  REM INSERTING into HVK_PET_VACCINATION
  SET DEFINE OFF;
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('12-MAY-17','DD-MON-RR'),
      1,33
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('12-MAY-17','DD-MON-RR'),
      2,33
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('12-MAY-17','DD-MON-RR'),
      3,33
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('12-MAY-17','DD-MON-RR'),
      4,33
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('12-MAY-18','DD-MON-RR'),
      5,33
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('12-MAY-18','DD-MON-RR'),
      6,33
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('10-JAN-17','DD-MON-RR'),
      1,35
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('10-JAN-17','DD-MON-RR'),
      2,35
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('10-JAN-17','DD-MON-RR'),
      3,35
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('10-JAN-17','DD-MON-RR'),
      4,35
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('10-JAN-17','DD-MON-RR'),
      5,35
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('10-JAN-17','DD-MON-RR'),
      6,35
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      1,13
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      2,13
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      3,13
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      4,13
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      5,13
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      1,9
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      2,9
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      1,1
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      2,1
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      3,1
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      4,1
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      5,1
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-18','DD-MON-RR'),
      6,1
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      1,2
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      2,2
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      3,2
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      4,2
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-17','DD-MON-RR'),
      5,2
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-MAR-18','DD-MON-RR'),
      6,2
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      1,3
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      2,3
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      3,3
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      4,3
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      5,3
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-MAR-16','DD-MON-RR'),
      1,6
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('03-OCT-16','DD-MON-RR'),
      2,6
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-MAR-16','DD-MON-RR'),
      3,6
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-MAR-16','DD-MON-RR'),
      4,6
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-MAR-16','DD-MON-RR'),
      5,6
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-AUG-17','DD-MON-RR'),
      6,6
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-MAR-17','DD-MON-RR'),
      1,7
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-MAR-17','DD-MON-RR'),
      2,7
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('07-JUL-16','DD-MON-RR'),
      4,7
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('17-NOV-17','DD-MON-RR'),
      6,7
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      3,9
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      4,9
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      5,9
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      1,12
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      2,12
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      3,12
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      4,12
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      5,12
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      1,11
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      2,11
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      3,11
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      4,11
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      5,11
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      1,14
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      2,14
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      3,14
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      4,14
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-17','DD-MON-RR'),
      5,14
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('21-MAR-17','DD-MON-RR'),
      1,16
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('02-MAR-17','DD-MON-RR'),
      3,16
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('21-MAR-16','DD-MON-RR'),
      4,16
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('02-APR-18','DD-MON-RR'),
      1,20
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('02-APR-18','DD-MON-RR'),
      2,20
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('21-MAR-18','DD-MON-RR'),
      5,20
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,26
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,26
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,26
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,26
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,26
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,26
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,27
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,27
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,27
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,27
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,27
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,27
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,28
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,28
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,28
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,28
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,28
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,28
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,29
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,29
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,29
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,29
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,29
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,29
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,30
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,30
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,30
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,30
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,30
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,30
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,31
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,31
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,31
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,31
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,31
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,31
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      1,32
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      2,32
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      3,32
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      4,32
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      5,32
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('08-DEC-17','DD-MON-RR'),
      6,32
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-18','DD-MON-RR'),
      6,13
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-18','DD-MON-RR'),
      6,3
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-18','DD-MON-RR'),
      6,9
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-18','DD-MON-RR'),
      6,12
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('05-SEP-18','DD-MON-RR'),
      6,11
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('02-JUN-18','DD-MON-RR'),
      6,20
    );
  INSERT
  INTO HVK_PET_VACCINATION
    (
      VACCINATION_EXPIRY_DATE,
      VACC_VACCINATION_NUMBER,
      PET_PET_NUMBER
    )
    VALUES
    (
      to_date('02-JUN-18','DD-MON-RR'),
      6,16
    );
  REM INSERTING into HVK_RESERVATION
  SET DEFINE OFF;
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      800,
      to_date('20-JUN-17','DD-MON-RR'),
      to_date('26-JUN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      801,
      to_date('20-JUN-17','DD-MON-RR'),
      to_date('26-JUN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      802,
      to_date('20-JUN-17','DD-MON-RR'),
      to_date('26-JUN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      804,
      to_date('20-AUG-17','DD-MON-RR'),
      to_date('26-AUG-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      100,
      to_date('12-SEP-15','DD-MON-RR'),
      to_date('19-SEP-15','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      102,
      to_date('16-SEP-15','DD-MON-RR'),
      to_date('18-SEP-15','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      103,
      to_date('01-OCT-15','DD-MON-RR'),
      to_date('05-NOV-15','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      104,
      to_date('15-OCT-15','DD-MON-RR'),
      to_date('22-OCT-15','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      105,
      to_date('01-JAN-16','DD-MON-RR'),
      to_date('20-JAN-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      106,
      to_date('10-APR-16','DD-MON-RR'),
      to_date('17-APR-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      108,
      to_date('30-APR-16','DD-MON-RR'),
      to_date('04-MAY-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      109,
      to_date('01-JUL-16','DD-MON-RR'),
      to_date('18-JUL-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      110,
      to_date('01-JUL-16','DD-MON-RR'),
      to_date('18-JUL-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      112,
      to_date('12-JUL-16','DD-MON-RR'),
      to_date('19-JUL-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      114,
      to_date('15-JUL-16','DD-MON-RR'),
      to_date('18-JUL-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      115,
      to_date('15-JUL-16','DD-MON-RR'),
      to_date('17-JUL-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      120,
      to_date('16-JUL-16','DD-MON-RR'),
      to_date('18-JUL-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      122,
      to_date('01-JAN-17','DD-MON-RR'),
      to_date('05-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      123,
      to_date('01-JAN-17','DD-MON-RR'),
      to_date('31-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      131,
      to_date('01-DEC-16','DD-MON-RR'),
      to_date('07-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      136,
      to_date('31-DEC-16','DD-MON-RR'),
      to_date('09-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      137,
      to_date('31-DEC-16','DD-MON-RR'),
      to_date('10-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      138,
      to_date('31-DEC-16','DD-MON-RR'),
      to_date('10-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      139,
      to_date('01-JAN-17','DD-MON-RR'),
      to_date('10-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      140,
      to_date('25-DEC-16','DD-MON-RR'),
      to_date('10-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      141,
      to_date('25-DEC-16','DD-MON-RR'),
      to_date('10-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      143,
      to_date('03-DEC-16','DD-MON-RR'),
      to_date('05-DEC-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      144,
      to_date('25-DEC-16','DD-MON-RR'),
      to_date('10-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      145,
      to_date('06-JAN-17','DD-MON-RR'),
      to_date('08-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      146,
      to_date('28-DEC-16','DD-MON-RR'),
      to_date('01-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      148,
      to_date('09-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      594,
      to_date('01-DEC-16','DD-MON-RR'),
      to_date('05-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      595,
      to_date('28-FEB-17','DD-MON-RR'),
      to_date('01-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      601,
      to_date('01-MAR-17','DD-MON-RR'),
      to_date('07-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      603,
      to_date('01-MAR-17','DD-MON-RR'),
      to_date('07-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      605,
      to_date('01-MAR-17','DD-MON-RR'),
      to_date('07-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      615,
      to_date('07-FEB-17','DD-MON-RR'),
      to_date('14-FEB-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      620,
      to_date('08-APR-16','DD-MON-RR'),
      to_date('09-MAY-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      625,
      to_date('15-MAR-17','DD-MON-RR'),
      to_date('20-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      630,
      to_date('05-MAR-17','DD-MON-RR'),
      to_date('13-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      631,
      to_date('01-JAN-16','DD-MON-RR'),
      to_date('04-JAN-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      632,
      to_date('07-JAN-17','DD-MON-RR'),
      to_date('09-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      633,
      to_date('07-JAN-17','DD-MON-RR'),
      to_date('09-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      635,
      to_date('20-MAR-17','DD-MON-RR'),
      to_date('25-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      636,
      to_date('09-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      696,
      to_date('07-NOV-16','DD-MON-RR'),
      to_date('16-NOV-16','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      700,
      to_date('10-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      701,
      to_date('10-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      702,
      to_date('10-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      703,
      to_date('10-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      704,
      to_date('10-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      705,
      to_date('10-JAN-17','DD-MON-RR'),
      to_date('12-JAN-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      707,
      to_date('15-MAR-17','DD-MON-RR'),
      to_date('20-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      708,
      to_date('15-APR-17','DD-MON-RR'),
      to_date('20-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      709,
      to_date('15-APR-17','DD-MON-RR'),
      to_date('20-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      711,
      to_date('15-APR-17','DD-MON-RR'),
      to_date('20-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      712,
      to_date('15-APR-17','DD-MON-RR'),
      to_date('20-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      713,
      to_date('10-APR-17','DD-MON-RR'),
      to_date('25-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      716,
      to_date('10-APR-17','DD-MON-RR'),
      to_date('25-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      717,
      to_date('10-APR-17','DD-MON-RR'),
      to_date('25-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      720,
      to_date('25-APR-17','DD-MON-RR'),
      to_date('30-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      721,
      to_date('05-APR-17','DD-MON-RR'),
      to_date('09-APR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      809,
      to_date('02-JUL-17','DD-MON-RR'),
      to_date('09-JUL-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      810,
      to_date('12-MAR-17','DD-MON-RR'),
      to_date('17-MAR-17','DD-MON-RR')
    );
  INSERT
  INTO HVK_RESERVATION
    (
      RESERVATION_NUMBER,
      RESERVATION_START_DATE,
      RESERVATION_END_DATE
    )
    VALUES
    (
      811,
      to_date('26-JUN-17','DD-MON-RR'),
      to_date('05-JUL-17','DD-MON-RR')
    );
  REM INSERTING into HVK_RESERVATION_DISCOUNT
  SET DEFINE OFF;
  INSERT
  INTO HVK_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      RES_RESERVATION_NUMBER
    )
    VALUES
    (
      2,713
    );
  INSERT
  INTO HVK_RESERVATION_DISCOUNT
    (
      DISC_DISCOUNT_NUMBER,
      RES_RESERVATION_NUMBER
    )
    VALUES
    (
      2,717
    );
  REM INSERTING into HVK_RUN
  SET DEFINE OFF;
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      1,
      'R',
      'F',
      'F',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      2,
      'R',
      'F',
      'F',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      13,
      'L',
      'F',
      'F',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      14,
      'L',
      'F',
      'F',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      21,
      'L',
      'F',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      22,
      'L',
      'F',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      27,
      'L',
      'T',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      28,
      'L',
      'T',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      29,
      'R',
      'T',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      30,
      'R',
      'T',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      35,
      'R',
      'F',
      'B',
      1
    );
  INSERT
  INTO HVK_RUN
    (
      RUN_NUMBER,
      RUN_SIZE,
      RUN_COVERED,
      RUN_LOCATION,
      RUN_STATUS
    )
    VALUES
    (
      36,
      'R',
      'F',
      'B',
      1
    );
  REM INSERTING into HVK_SERVICE
  SET DEFINE OFF;
  INSERT
  INTO HVK_SERVICE
    (
      SERVICE_NUMBER,
      SERVICE_DESCRIPTION
    )
    VALUES
    (
      1,
      'Boarding'
    );
  INSERT
  INTO HVK_SERVICE
    (
      SERVICE_NUMBER,
      SERVICE_DESCRIPTION
    )
    VALUES
    (
      2,
      'Walk'
    );
  INSERT
  INTO HVK_SERVICE
    (
      SERVICE_NUMBER,
      SERVICE_DESCRIPTION
    )
    VALUES
    (
      3,
      'Grooming'
    );
  INSERT
  INTO HVK_SERVICE
    (
      SERVICE_NUMBER,
      SERVICE_DESCRIPTION
    )
    VALUES
    (
      4,
      'Medication'
    );
  INSERT
  INTO HVK_SERVICE
    (
      SERVICE_NUMBER,
      SERVICE_DESCRIPTION
    )
    VALUES
    (
      5,
      'Playtime'
    );
  REM INSERTING into HVK_VACCINATION
  SET DEFINE OFF;
  INSERT
  INTO HVK_VACCINATION
    (
      VACCINATION_NUMBER,
      VACCINATION_NAME
    )
    VALUES
    (
      1,
      'Bordetella'
    );
  INSERT
  INTO HVK_VACCINATION
    (
      VACCINATION_NUMBER,
      VACCINATION_NAME
    )
    VALUES
    (
      2,
      'Distemper'
    );
  INSERT
  INTO HVK_VACCINATION
    (
      VACCINATION_NUMBER,
      VACCINATION_NAME
    )
    VALUES
    (
      3,
      'Hepatitis'
    );
  INSERT
  INTO HVK_VACCINATION
    (
      VACCINATION_NUMBER,
      VACCINATION_NAME
    )
    VALUES
    (
      4,
      'Parainfluenza'
    );
  INSERT
  INTO HVK_VACCINATION
    (
      VACCINATION_NUMBER,
      VACCINATION_NAME
    )
    VALUES
    (
      5,
      'Parovirus'
    );
  INSERT
  INTO HVK_VACCINATION
    (
      VACCINATION_NUMBER,
      VACCINATION_NAME
    )
    VALUES
    (
      6,
      'Rabies'
    );
  REM INSERTING into HVK_VETERINARIAN
  SET DEFINE OFF;
  INSERT
  INTO HVK_VETERINARIAN
    (
      VET_NUMBER,
      VET_NAME,
      VET_PHONE,
      VET_STREET,
      VET_CITY,
      VET_PROVINCE,
      VET_POSTAL_CODE
    )
    VALUES
    (
      5,
      'Dr. Frankenstein',
      '8888888888',
      NULL,
      NULL,
      'QC',
      NULL
    );
  INSERT
  INTO HVK_VETERINARIAN
    (
      VET_NUMBER,
      VET_NAME,
      VET_PHONE,
      VET_STREET,
      VET_CITY,
      VET_PROVINCE,
      VET_POSTAL_CODE
    )
    VALUES
    (
      6,
      'Dr. Jorge Potter',
      '1234567890',
      NULL,
      NULL,
      'QC',
      NULL
    );
  INSERT
  INTO HVK_VETERINARIAN
    (
      VET_NUMBER,
      VET_NAME,
      VET_PHONE,
      VET_STREET,
      VET_CITY,
      VET_PROVINCE,
      VET_POSTAL_CODE
    )
    VALUES
    (
      7,
      'Dr. Akura Petforu',
      '1234567890',
      NULL,
      NULL,
      'QC',
      NULL
    );
  INSERT
  INTO HVK_VETERINARIAN
    (
      VET_NUMBER,
      VET_NAME,
      VET_PHONE,
      VET_STREET,
      VET_CITY,
      VET_PROVINCE,
      VET_POSTAL_CODE
    )
    VALUES
    (
      1,
      'Dr. I. Care',
      '8195552122',
      NULL,
      NULL,
      'QC',
      NULL
    );
  INSERT
  INTO HVK_VETERINARIAN
    (
      VET_NUMBER,
      VET_NAME,
      VET_PHONE,
      VET_STREET,
      VET_CITY,
      VET_PROVINCE,
      VET_POSTAL_CODE
    )
    VALUES
    (
      2,
      'Dr. Sandy Beech',
      '8195559238',
      NULL,
      NULL,
      'QC',
      NULL
    );
  --------------------------------------------------------
  --  DDL for Index DAILY_RATE_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "DAILY_RATE_PK" ON "HVK_DAILY_RATE"
  (
    "DAILY_RATE_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index DISCOUNT_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "DISCOUNT_PK" ON "HVK_DISCOUNT"
  (
    "DISCOUNT_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PET_RES_DISC_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "PET_RES_DISC_PK" ON "HVK_PET_RESERVATION_DISCOUNT"
  (
    "DISC_DISCOUNT_NUMBER", "PR_PET_RES_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PR__IDX
  --------------------------------------------------------
CREATE UNIQUE INDEX "PR__IDX" ON "HVK_PET_RESERVATION"
  (
    "PR_SHARING_WITH"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index KENNEL_LOG_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "KENNEL_LOG_PK" ON "HVK_KENNEL_LOG"
  (
    "KENNEL_LOG_DATE", "KENNEL_LOG_SEQUENCE_NUMBER", "PR_PET_RES_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index RUN_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "RUN_PK" ON "HVK_RUN"
  (
    "RUN_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index VACCINATION_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "VACCINATION_PK" ON "HVK_VACCINATION"
  (
    "VACCINATION_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PET_VACCINATION_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "PET_VACCINATION_PK" ON "HVK_PET_VACCINATION"
  (
    "VACC_VACCINATION_NUMBER", "PET_PET_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PET_RESERVATION_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "PET_RESERVATION_PK" ON "HVK_PET_RESERVATION"
  (
    "PET_RES_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PET_FOOD_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "PET_FOOD_PK" ON "HVK_PET_FOOD"
  (
    "PR_PET_RES_NUMBER", "FOOD_FOOD_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index OWNER_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "OWNER_PK" ON "HVK_OWNER"
  (
    "OWNER_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index SERVICE_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "SERVICE_PK" ON "HVK_SERVICE"
  (
    "SERVICE_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PET_RESERVATION_SERVICE_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "PET_RESERVATION_SERVICE_PK" ON "HVK_PET_RESERVATION_SERVICE"
  (
    "PR_PET_RES_NUMBER", "SERV_SERVICE_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index RES_DISC_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "RES_DISC_PK" ON "HVK_RESERVATION_DISCOUNT"
  (
    "DISC_DISCOUNT_NUMBER", "RES_RESERVATION_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index VETERINARIAN_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "VETERINARIAN_PK" ON "HVK_VETERINARIAN"
  (
    "VET_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index FOOD_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "FOOD_PK" ON "HVK_FOOD"
  (
    "FOOD_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index MEDICATION_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "MEDICATION_PK" ON "HVK_MEDICATION"
  (
    "MEDICATION_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index RESERVATION_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "RESERVATION_PK" ON "HVK_RESERVATION"
  (
    "RESERVATION_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  DDL for Index PET_PK
  --------------------------------------------------------
CREATE UNIQUE INDEX "PET_PK" ON "HVK_PET"
  (
    "PET_NUMBER"
  )
  ;
  --------------------------------------------------------
  --  Constraints for Table HVK_RUN
  --------------------------------------------------------
  ALTER TABLE "HVK_RUN" ADD CONSTRAINT "RUN_LOCATION_CHK" CHECK ( RUN_LOCATION IN ('B', 'F')) ENABLE;
  ALTER TABLE "HVK_RUN" ADD CONSTRAINT "RUN_PK" PRIMARY KEY ("RUN_NUMBER") ENABLE;
  ALTER TABLE "HVK_RUN" ADD CONSTRAINT "RUN_SIZE_CHK" CHECK ( RUN_SIZE     IN ('L', 'R')) ENABLE;
  ALTER TABLE "HVK_RUN" ADD CONSTRAINT "RUN_STATUS_CHK" CHECK ( RUN_STATUS IN (1, 2, 3, 4)) ENABLE;
  ALTER TABLE "HVK_RUN" MODIFY ("RUN_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_RUN" MODIFY ("RUN_SIZE" NOT NULL ENABLE);
  ALTER TABLE "HVK_RUN" ADD CHECK ( RUN_COVERED IN ('F', 'T')) ENABLE;
  --------------------------------------------------------
  --  Constraints for Table HVK_PET_RESERVATION_DISCOUNT
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_RESERVATION_DISCOUNT" ADD CONSTRAINT "PET_RES_DISC_PK" PRIMARY KEY ("DISC_DISCOUNT_NUMBER", "PR_PET_RES_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION_DISCOUNT" MODIFY ("DISC_DISCOUNT_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_RESERVATION_DISCOUNT" MODIFY ("PR_PET_RES_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_DAILY_RATE
  --------------------------------------------------------
  ALTER TABLE "HVK_DAILY_RATE" ADD CONSTRAINT "DAILY_RATE_PK" PRIMARY KEY ("DAILY_RATE_NUMBER") ENABLE;
  ALTER TABLE "HVK_DAILY_RATE" MODIFY ("DAILY_RATE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_DAILY_RATE" MODIFY ("DAILY_RATE" NOT NULL ENABLE);
  ALTER TABLE "HVK_DAILY_RATE" ADD CHECK ( DAILY_RATE_DOG_SIZE IN ('L', 'M', 'S')) ENABLE;
  --------------------------------------------------------
  --  Constraints for Table HVK_RESERVATION
  --------------------------------------------------------
  ALTER TABLE "HVK_RESERVATION" ADD CONSTRAINT "RESERVATION_PK" PRIMARY KEY ("RESERVATION_NUMBER") ENABLE;
  ALTER TABLE "HVK_RESERVATION" MODIFY ("RESERVATION_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_RESERVATION" MODIFY ("RESERVATION_START_DATE" NOT NULL ENABLE);
  ALTER TABLE "HVK_RESERVATION" MODIFY ("RESERVATION_END_DATE" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_PET_VACCINATION
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_VACCINATION" ADD CONSTRAINT "PET_VACCINATION_PK" PRIMARY KEY ("VACC_VACCINATION_NUMBER", "PET_PET_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_VACCINATION" MODIFY ("VACCINATION_EXPIRY_DATE" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_VACCINATION" MODIFY ("VACC_VACCINATION_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_VACCINATION" MODIFY ("PET_PET_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_KENNEL_LOG
  --------------------------------------------------------
  ALTER TABLE "HVK_KENNEL_LOG" ADD CONSTRAINT "KENNEL_LOG_PK" PRIMARY KEY ("KENNEL_LOG_DATE", "KENNEL_LOG_SEQUENCE_NUMBER", "PR_PET_RES_NUMBER") ENABLE;
  ALTER TABLE "HVK_KENNEL_LOG" MODIFY ("KENNEL_LOG_DATE" NOT NULL ENABLE);
  ALTER TABLE "HVK_KENNEL_LOG" MODIFY ("KENNEL_LOG_SEQUENCE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_KENNEL_LOG" MODIFY ("KENNEL_LOG_NOTES" NOT NULL ENABLE);
  ALTER TABLE "HVK_KENNEL_LOG" MODIFY ("PR_PET_RES_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_PET_RESERVATION
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_RESERVATION" ADD CONSTRAINT "PET_RESERVATION_PK" PRIMARY KEY ("PET_RES_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION" MODIFY ("PET_RES_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_RESERVATION" MODIFY ("PET_PET_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_RESERVATION" MODIFY ("RES_RESERVATION_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_VETERINARIAN
  --------------------------------------------------------
  ALTER TABLE "HVK_VETERINARIAN" MODIFY ("VET_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_VETERINARIAN" MODIFY ("VET_NAME" NOT NULL ENABLE);
  ALTER TABLE "HVK_VETERINARIAN" MODIFY ("VET_PHONE" NOT NULL ENABLE);
  ALTER TABLE "HVK_VETERINARIAN" ADD CHECK ( VET_PROVINCE IN ('ON', 'QC')) ENABLE;
  ALTER TABLE "HVK_VETERINARIAN" ADD CONSTRAINT "VETERINARIAN_PK" PRIMARY KEY ("VET_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Constraints for Table HVK_OWNER
  --------------------------------------------------------
  ALTER TABLE "HVK_OWNER" ADD CONSTRAINT "OWNER_PK" PRIMARY KEY ("OWNER_NUMBER") ENABLE;
  ALTER TABLE "HVK_OWNER" MODIFY ("OWNER_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_OWNER" MODIFY ("OWNER_FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "HVK_OWNER" MODIFY ("OWNER_LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "HVK_OWNER" ADD CHECK ( OWNER_PROVINCE IN ('ON', 'QC')) ENABLE;
  --------------------------------------------------------
  --  Constraints for Table HVK_FOOD
  --------------------------------------------------------
  ALTER TABLE "HVK_FOOD" ADD CONSTRAINT "FOOD_PK" PRIMARY KEY ("FOOD_NUMBER") ENABLE;
  ALTER TABLE "HVK_FOOD" MODIFY ("FOOD_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_FOOD" MODIFY ("FOOD_BRAND" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_MEDICATION
  --------------------------------------------------------
  ALTER TABLE "HVK_MEDICATION" ADD CONSTRAINT "MEDICATION_PK" PRIMARY KEY ("MEDICATION_NUMBER") ENABLE;
  ALTER TABLE "HVK_MEDICATION" MODIFY ("MEDICATION_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_MEDICATION" MODIFY ("MEDICATION_NAME" NOT NULL ENABLE);
  ALTER TABLE "HVK_MEDICATION" MODIFY ("PR_PET_RES_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_RESERVATION_DISCOUNT
  --------------------------------------------------------
  ALTER TABLE "HVK_RESERVATION_DISCOUNT" ADD CONSTRAINT "RES_DISC_PK" PRIMARY KEY ("DISC_DISCOUNT_NUMBER", "RES_RESERVATION_NUMBER") ENABLE;
  ALTER TABLE "HVK_RESERVATION_DISCOUNT" MODIFY ("DISC_DISCOUNT_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_RESERVATION_DISCOUNT" MODIFY ("RES_RESERVATION_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_DISCOUNT
  --------------------------------------------------------
  ALTER TABLE "HVK_DISCOUNT" ADD CONSTRAINT "DISCOUNT_PK" PRIMARY KEY ("DISCOUNT_NUMBER") ENABLE;
  ALTER TABLE "HVK_DISCOUNT" ADD CONSTRAINT "DISCOUNT_TYPE_CHK" CHECK ( DISCOUNT_TYPE IN ('D', 'T')) ENABLE;
  ALTER TABLE "HVK_DISCOUNT" MODIFY ("DISCOUNT_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_DISCOUNT" MODIFY ("DISCOUNT_DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "HVK_DISCOUNT" MODIFY ("DISCOUNT_PERCENTAGE" NOT NULL ENABLE);
  ALTER TABLE "HVK_DISCOUNT" MODIFY ("DISCOUNT_TYPE" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_PET_RESERVATION_SERVICE
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_RESERVATION_SERVICE" ADD CONSTRAINT "PET_RESERVATION_SERVICE_PK" PRIMARY KEY ("PR_PET_RES_NUMBER", "SERV_SERVICE_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION_SERVICE" MODIFY ("PR_PET_RES_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_RESERVATION_SERVICE" MODIFY ("SERV_SERVICE_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_PET
  --------------------------------------------------------
  ALTER TABLE "HVK_PET" ADD CONSTRAINT "PET_PK" PRIMARY KEY ("PET_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET" ADD CONSTRAINT "SYS_C00262057" CHECK (PET_GENDER IN ('F', 'M')) ENABLE;
  ALTER TABLE "HVK_PET" ADD CONSTRAINT "SYS_C00262058" CHECK (PET_FIXED  IN ('F', 'T')) ENABLE;
  ALTER TABLE "HVK_PET" ADD CHECK (DOG_SIZE='L' OR DOG_SIZE='M' OR DOG_SIZE='S') ENABLE;
  ALTER TABLE "HVK_PET" MODIFY ("PET_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET" MODIFY ("PET_NAME" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET" MODIFY ("PET_GENDER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET" MODIFY ("PET_FIXED" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET" MODIFY ("OWN_OWNER_NUMBER" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_SERVICE
  --------------------------------------------------------
  ALTER TABLE "HVK_SERVICE" ADD CONSTRAINT "SERVICE_PK" PRIMARY KEY ("SERVICE_NUMBER") ENABLE;
  ALTER TABLE "HVK_SERVICE" MODIFY ("SERVICE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_SERVICE" MODIFY ("SERVICE_DESCRIPTION" NOT NULL ENABLE);
  --------------------------------------------------------
  --  Constraints for Table HVK_VACCINATION
  --------------------------------------------------------
  ALTER TABLE "HVK_VACCINATION" MODIFY ("VACCINATION_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_VACCINATION" MODIFY ("VACCINATION_NAME" NOT NULL ENABLE);
  ALTER TABLE "HVK_VACCINATION" ADD CONSTRAINT "VACCINATION_PK" PRIMARY KEY ("VACCINATION_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Constraints for Table HVK_PET_FOOD
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_FOOD" ADD CONSTRAINT "PET_FOOD_PK" PRIMARY KEY ("PR_PET_RES_NUMBER", "FOOD_FOOD_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_FOOD" MODIFY ("PET_FOOD_FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_FOOD" MODIFY ("PR_PET_RES_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_FOOD" MODIFY ("FOOD_FOOD_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HVK_PET_FOOD" ADD CHECK ( PET_FOOD_FREQUENCY IN (1, 2)) ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_DAILY_RATE
  --------------------------------------------------------
  ALTER TABLE "HVK_DAILY_RATE" ADD CONSTRAINT "DR_SERV_FK" FOREIGN KEY ("SERV_SERVICE_NUMBER") REFERENCES "HVK_SERVICE" ("SERVICE_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_KENNEL_LOG
  --------------------------------------------------------
  ALTER TABLE "HVK_KENNEL_LOG" ADD CONSTRAINT "KL_PR_FK" FOREIGN KEY ("PR_PET_RES_NUMBER") REFERENCES "HVK_PET_RESERVATION" ("PET_RES_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_MEDICATION
  --------------------------------------------------------
  ALTER TABLE "HVK_MEDICATION" ADD CONSTRAINT "MED_PR_FK" FOREIGN KEY ("PR_PET_RES_NUMBER") REFERENCES "HVK_PET_RESERVATION" ("PET_RES_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_PET
  --------------------------------------------------------
  ALTER TABLE "HVK_PET" ADD CONSTRAINT "PET_OWN_FK" FOREIGN KEY ("OWN_OWNER_NUMBER") REFERENCES "HVK_OWNER" ("OWNER_NUMBER") ON
  DELETE CASCADE ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_PET_FOOD
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_FOOD" ADD CONSTRAINT "PF_FOOD_FK" FOREIGN KEY ("FOOD_FOOD_NUMBER") REFERENCES "HVK_FOOD" ("FOOD_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_FOOD" ADD CONSTRAINT "PF_PR_FK" FOREIGN KEY ("PR_PET_RES_NUMBER") REFERENCES "HVK_PET_RESERVATION" ("PET_RES_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_PET_RESERVATION
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_RESERVATION" ADD CONSTRAINT "PR_PET_FK" FOREIGN KEY ("PET_PET_NUMBER") REFERENCES "HVK_PET" ("PET_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION" ADD CONSTRAINT "PR_PR_FK" FOREIGN KEY ("PR_SHARING_WITH") REFERENCES "HVK_PET_RESERVATION" ("PET_RES_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION" ADD CONSTRAINT "PR_RES_FK" FOREIGN KEY ("RES_RESERVATION_NUMBER") REFERENCES "HVK_RESERVATION" ("RESERVATION_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION" ADD CONSTRAINT "PR_RUN_FK" FOREIGN KEY ("RUN_RUN_NUMBER") REFERENCES "HVK_RUN" ("RUN_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_PET_RESERVATION_DISCOUNT
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_RESERVATION_DISCOUNT" ADD CONSTRAINT "PRD_DISC_FK" FOREIGN KEY ("DISC_DISCOUNT_NUMBER") REFERENCES "HVK_DISCOUNT" ("DISCOUNT_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION_DISCOUNT" ADD CONSTRAINT "PRD_PR_FK" FOREIGN KEY ("PR_PET_RES_NUMBER") REFERENCES "HVK_PET_RESERVATION" ("PET_RES_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_PET_RESERVATION_SERVICE
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_RESERVATION_SERVICE" ADD CONSTRAINT "PRS_PR_FK" FOREIGN KEY ("PR_PET_RES_NUMBER") REFERENCES "HVK_PET_RESERVATION" ("PET_RES_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_RESERVATION_SERVICE" ADD CONSTRAINT "PRS_SERV_FK" FOREIGN KEY ("SERV_SERVICE_NUMBER") REFERENCES "HVK_SERVICE" ("SERVICE_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_PET_VACCINATION
  --------------------------------------------------------
  ALTER TABLE "HVK_PET_VACCINATION" ADD CONSTRAINT "PV_PET_FK" FOREIGN KEY ("PET_PET_NUMBER") REFERENCES "HVK_PET" ("PET_NUMBER") ENABLE;
  ALTER TABLE "HVK_PET_VACCINATION" ADD CONSTRAINT "PV_VACC_FK" FOREIGN KEY ("VACC_VACCINATION_NUMBER") REFERENCES "HVK_VACCINATION" ("VACCINATION_NUMBER") ENABLE;
  --------------------------------------------------------
  --  Ref Constraints for Table HVK_RESERVATION_DISCOUNT
  --------------------------------------------------------
  ALTER TABLE "HVK_RESERVATION_DISCOUNT" ADD CONSTRAINT "RD_DISC_FK" FOREIGN KEY ("DISC_DISCOUNT_NUMBER") REFERENCES "HVK_DISCOUNT" ("DISCOUNT_NUMBER") ENABLE;
  ALTER TABLE "HVK_RESERVATION_DISCOUNT" ADD CONSTRAINT "RD_RES_FK" FOREIGN KEY ("RES_RESERVATION_NUMBER") REFERENCES "HVK_RESERVATION" ("RESERVATION_NUMBER") ENABLE;
  ALTER TABLE HVK_PET_VACCINATION
  --- Set to 'Y' if checked, 'N' otherwise
  ADD VACCINATION_CHECKED_STATUS CHAR(1) DEFAULT 'N' NOT NULL;
  -- mark vaccination as checked if the pet has been in in the last 1 month based on a fixed date
  UPDATE HVK_PET_VACCINATION v
  SET v.VACCINATION_CHECKED_STATUS = 'Y'
  WHERE v.PET_PET_NUMBER          IN
    ( SELECT DISTINCT(pr.pet_pet_number)
    FROM hvk_pet_reservation pr,
      HVK_RESERVATION r
    WHERE r.RESERVATION_NUMBER = pr.RES_RESERVATION_NUMBER
    AND r.RESERVATION_END_DATE BETWEEN ADD_MONTHS(to_date('14-MAR-17','dd-mon-yy'), -1) AND to_date('14-MAR-17','dd-mon-yy')
    );
  DROP SEQUENCE HVK_OWNER_SEQ;
  DROP SEQUENCE HVK_DAILY_RATE_SEQ;
  DROP SEQUENCE hvk_discount_seq;
  DROP SEQUENCE hvk_food_seq;
  DROP SEQUENCE hvk_medication_seq;
  DROP SEQUENCE hvk_pet_res_seq;
  DROP SEQUENCE hvk_pet_seq;
  DROP SEQUENCE hvk_reservation_seq;
  DROP SEQUENCE hvk_run_seq;
  DROP SEQUENCE hvk_service_seq;
  DROP SEQUENCE hvk_vaccination_seq;
  DROP SEQUENCE hvk_vet_seq;
  --- add sequence numbers
CREATE SEQUENCE HVK_OWNER_SEQ INCREMENT BY 1 START WITH 250;
CREATE SEQUENCE HVK_DAILY_RATE_SEQ INCREMENT BY 1 START WITH 12;
CREATE SEQUENCE hvk_discount_seq INCREMENT BY 1 START WITH 4;
CREATE SEQUENCE hvk_food_seq INCREMENT BY 1 START WITH 16;
CREATE SEQUENCE hvk_medication_seq INCREMENT BY 1 START WITH 15;
CREATE SEQUENCE hvk_pet_res_seq INCREMENT BY 1 START WITH 2500;
CREATE SEQUENCE hvk_pet_seq INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE hvk_reservation_seq INCREMENT BY 1 START WITH 2000;
CREATE SEQUENCE hvk_run_seq INCREMENT BY 1 START WITH 40;
CREATE SEQUENCE hvk_service_seq INCREMENT BY 1 START WITH 7;
CREATE SEQUENCE hvk_vaccination_seq INCREMENT BY 1 START WITH 7;
CREATE SEQUENCE hvk_vet_seq INCREMENT BY 1 START WITH 10;
