USE manufacturing_capstone;
CREATE TABLE Plants (
    plant_id INT PRIMARY KEY,
    plant_name VARCHAR(100),
    city VARCHAR(100),
    plant_capacity_units INT,
    plant_manager VARCHAR(100)
);
CREATE TABLE Machines (
    machine_id INT PRIMARY KEY,
    machine_name VARCHAR(100),
    machine_type VARCHAR(50),
    plant_id INT,
    manufacturer VARCHAR(100),
    installation_date DATE,
    capacity_per_hour INT,
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id)
);CREATE TABLE Operators (
    operator_id INT PRIMARY KEY,
    operator_name VARCHAR(100),
    plant_id INT,
    experience_years INT,
    shift_preference VARCHAR(20),
    certification_level VARCHAR(50),
    joining_date DATE,
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    unit_price DECIMAL(10,2),
    standard_production_time_minutes INT,
    defect_tolerance_percentage DECIMAL(5,2)
);
select * from machine;

