SET SQL_SAFE_UPDATES = 0;
UPDATE machine
SET `installation date` =
REPLACE(`installation date`, '-', '/');
UPDATE machine
SET `installation date` =
CASE
    WHEN CAST(SUBSTRING_INDEX(`installation date`, '/', 1) AS UNSIGNED) > 12
    THEN STR_TO_DATE(`installation date`, '%d/%m/%Y')
    ELSE STR_TO_DATE(`installation date`, '%m/%d/%Y')
END;
ALTER TABLE machine
MODIFY `installation date` DATE;
SELECT `installation date`
FROM machine
LIMIT 5;
ALTER TABLE downtime
MODIFY `date` VARCHAR(20);
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 0;

UPDATE Downtime
SET `date` = REPLACE(`date`, '-', '/');
UPDATE downtime
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
ALTER TABLE downtime
MODIFY `date` DATE;
ALTER TABLE machine
MODIFY `installation date` DATE;
SELECT `installation date`
FROM machine
LIMIT 5;
ALTER TABLE operators
MODIFY `joining_date` VARCHAR(20);
SET SQL_SAFE_UPDATES = 0;

UPDATE Operators
SET joining_date = REPLACE(joining_date, '-', '/');
UPDATE Operators
SET joining_date =
CASE
    WHEN CAST(SUBSTRING_INDEX(joining_date, '/', 1) AS UNSIGNED) > 12
    THEN STR_TO_DATE(joining_date, '%d/%m/%Y')
    ELSE STR_TO_DATE(joining_date, '%m/%d/%Y')
END;
ALTER TABLE operators
MODIFY joining_date DATE;
SELECT joining_date FROM operators LIMIT 5;
-- Operator mismatch
SELECT *
FROM Production p
LEFT JOIN operators o ON p.operator_id = o.operator_id
WHERE o.operator_id IS NULL;
SET SQL_SAFE_UPDATES = 0;

UPDATE Maintenance
SET maintenance_date = REPLACE(maintenance_date, '-', '/');
UPDATE Maintenance
SET maintenance_date =
CASE
    WHEN CAST(SUBSTRING_INDEX(maintenance_date, '/', 1) AS UNSIGNED) > 12
    THEN STR_TO_DATE(maintenance_date, '%d/%m/%Y')
    ELSE STR_TO_DATE(maintenance_date, '%m/%d/%Y')
END;ALTER TABLE Maintenance
MODIFY maintenance_date DATE;SELECT maintenance_date FROM Maintenance LIMIT 5;
-- Machine mismatch
SELECT *
FROM Production p
LEFT JOIN machine m ON p.machine_id = m.machine_id
WHERE m.machine_id IS NULL;
ALTER TABLE operators
CHANGE `ï»¿operator_id` operator_id INT;
