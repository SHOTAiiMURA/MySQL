-- safemode, 
-- show databases;
-- use Tododb;
select * from Task;
-- insert into User values('afds76','');
-- UPDATE Task SET extended_time = extended_time + INTERVAL 40 MINUTE WHERE task_id = 2;
-- update Task set extended_time = IFNULL(extended_time, 0) + 40,end_time = DATE_ADD(end_time, INTERVAL 40 MINUTE) where task_id = 2;
-- UPDATE Task SET due_date = DATE_ADD(due_date, INTERVAL 5 MONTH),start_time = DATE_ADD(start_time, INTERVAL 5 MONTH),end_time = DATE_ADD(end_time, INTERVAL 6 MONTH) WHERE task_id = 2;
-- UPDATE Task SET due_date = DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT('2024-04-26','%Y-%m-%d'), ' ', due_date), '%Y-%m-%d %H:%i:%s'), INTERVAL 5 MONTH)WHERE task_id = 2;
-- UPDATE Task SET start_time = DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT(NOW(),'%Y-%m-%d'), ' ', start_time), '%Y-%m-%d %H:%i:%s'), INTERVAL 5 MONTH) WHERE task_id = 2;
-- UPDATE Task SET end_time = DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT(NOW(),'%Y-%m-%d'), ' ', end_time), '%Y-%m-%d %H:%i:%s'), INTERVAL 6 MONTH) WHERE task_id = 2;
UPDATE Task
SET due_date = IF(due_date IS NULL, STR_TO_DATE(CONCAT(DATE_FORMAT('2024-05-26','%Y-%m-%d'), ' 00:00:00'), '%Y-%m-%d %H:%i:%s'),
                   DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT(due_date,'%Y-%m-%d'), ' ', due_date), '%Y-%m-%d %H:%i:%s'), INTERVAL 5 MONTH)) WHERE task_id = 2;
UPDATE Task SET end_time = IF(end_time IS NULL, STR_TO_DATE(CONCAT(DATE_FORMAT('2024-04-27','%Y-%m-%d'), ' 00:00:00'), '%Y-%m-%d %H:%i:%s'),
DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT(end_time,'%Y-%m-%d'), ' ', end_time), '%Y-%m-%d %H:%i:%s'), INTERVAL 5 MONTH))
where task_id = 2;

-- UPDATE Task SET start_time = IF(start_time IS NULL, STR_TO_DATE(CONCAT(DATE_FORMAT('2024-04-26','%Y-%m-%d'), ' 00:00:00'), '%Y-%m-%d %H:%i:%s'), DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT(start_time,'%Y-%m-%d'), ' ', start_time), '%Y-%m-%d %H:%i:%s'), INTERVAL 5 MONTH)) WHERE task_id = 2;
UPDATE Task
SET start_time = IF(start_time IS NULL, STR_TO_DATE(CONCAT(DATE_FORMAT('2024-06-26','%Y-%m-%d'), ' 00:00:00'), '%Y-%m-%d %H:%i:%s'),
                  IF(start_time IS NOT NULL, DATE_ADD(STR_TO_DATE(CONCAT(DATE_FORMAT(start_time,'%Y-%m-%d'), ' ', start_time), '%Y-%m-%d %H:%i:%s'), INTERVAL 5 MONTH), start_time))
WHERE task_id = 2;