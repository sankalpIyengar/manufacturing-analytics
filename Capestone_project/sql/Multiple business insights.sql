USE manufacturing_capstone;
#Plant Production Efficiency#
SELECT 
    pl.plant_name,
    SUM(pr.actual_units) AS total_actual,
    SUM(pr.target_units) AS total_target,
    ROUND(SUM(pr.actual_units) * 100.0 / SUM(pr.target_units), 2) AS efficiency_percent
FROM production pr
JOIN plants pl 
    ON pr.plant_id = pl.plant_id
GROUP BY pl.plant_name
ORDER BY efficiency_percent DESC;

#Top Machines by Production#
SELECT 
    m.machine_name,
    SUM(pr.actual_units) AS total_output
FROM production pr
JOIN machine m 
    ON pr.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY total_output DESC
LIMIT 10;

#Monthly Production Trend#
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    SUM(actual_units) AS total_units
FROM production
GROUP BY month
ORDER BY month;
# machines causing most downtime
SELECT 
    machine_id,
    SUM(downtime_minutes) AS total_downtime
FROM downtime
GROUP BY machine_id
ORDER BY total_downtime DESC
LIMIT 5;
#Operator Performance Ranking
SELECT 
    operator_id,
    SUM(actual_units) AS total_output,
    RANK() OVER (ORDER BY SUM(actual_units) DESC) AS performance_rank
FROM production
GROUP BY operator_id;
#Maintenance Cost vs Downtime
SELECT 
    m.machine_id,
    SUM(m.maintenance_cost) AS total_cost,
    SUM(d.downtime_minutes) AS total_downtime
FROM maintenance m
LEFT JOIN downtime d 
    ON m.machine_id = d.machine_id
GROUP BY m.machine_id
ORDER BY total_cost DESC;