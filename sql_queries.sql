use heart_disease;


CREATE TABLE patients (
    Age INT,
    Sex VARCHAR(1),
    ChestPainType VARCHAR(10),
    RestingBP INT,
    Cholesterol INT,
    FastingBS INT,
    RestingECG VARCHAR(10),
    MaxHR INT,
    ExerciseAngina VARCHAR(1),
    Oldpeak FLOAT,
    ST_Slope VARCHAR(10),
    HeartDisease INT
);


SELECT 
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_Age,
  SUM(CASE WHEN RestingBP IS NULL THEN 1 ELSE 0 END) AS missing_RestingBP,
  SUM(CASE WHEN Cholesterol IS NULL THEN 1 ELSE 0 END) AS missing_Cholesterol,
  SUM(CASE WHEN MaxHR IS NULL THEN 1 ELSE 0 END) AS missing_MaxHR
FROM patients;

SELECT Age,
  CASE 
    WHEN Age < 40 THEN 'Young'
    WHEN Age BETWEEN 40 AND 60 THEN 'Middle-aged'
    ELSE 'Senior'
  END AS AgeGroup
FROM patients;


CREATE VIEW patients_binned AS
SELECT *,
  CASE 
    WHEN Age < 40 THEN 'Young'
    WHEN Age BETWEEN 40 AND 60 THEN 'Middle-aged'
    ELSE 'Senior'
  END AS AgeGroup
FROM patients;

SELECT *,
  CASE WHEN Sex = 'M' THEN 1 ELSE 0 END AS SexEncoded,
  CASE 
    WHEN ChestPainType = 'TA' THEN 1
    WHEN ChestPainType = 'ATA' THEN 2
    WHEN ChestPainType = 'NAP' THEN 3
    WHEN ChestPainType = 'ASY' THEN 4
    ELSE 0
  END AS ChestPainEncoded,
  CASE WHEN ExerciseAngina = 'Y' THEN 1 ELSE 0 END AS ExerciseAnginaEncoded
FROM patients;

CREATE VIEW patients_encoded AS
SELECT *,
  CASE WHEN Sex = 'M' THEN 1 ELSE 0 END AS SexEncoded,
  CASE 
    WHEN ChestPainType = 'TA' THEN 1
    WHEN ChestPainType = 'ATA' THEN 2
    WHEN ChestPainType = 'NAP' THEN 3
    WHEN ChestPainType = 'ASY' THEN 4
    ELSE 0
  END AS ChestPainEncoded,
  CASE WHEN ExerciseAngina = 'Y' THEN 1 ELSE 0 END AS ExerciseAnginaEncoded
FROM patients;


CREATE TABLE final_preprocessed AS
SELECT
  Age,
  CASE 
    WHEN Age < 40 THEN 'Young'
    WHEN Age BETWEEN 40 AND 60 THEN 'Middle-aged'
    ELSE 'Senior'
  END AS AgeGroup,
  RestingBP,
  Cholesterol,
  FastingBS,
  MaxHR,
  Oldpeak,
  CASE WHEN Sex = 'M' THEN 1 ELSE 0 END AS SexEncoded,
  CASE 
    WHEN ChestPainType = 'TA' THEN 1
    WHEN ChestPainType = 'ATA' THEN 2
    WHEN ChestPainType = 'NAP' THEN 3
    WHEN ChestPainType = 'ASY' THEN 4
    ELSE 0
  END AS ChestPainEncoded,
  CASE WHEN ExerciseAngina = 'Y' THEN 1 ELSE 0 END AS ExerciseAnginaEncoded,
  HeartDisease
FROM patients;

ALTER TABLE final_preprocessed
CHANGE HeartDisease Heart_Disease INT;


