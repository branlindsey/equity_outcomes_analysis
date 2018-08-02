﻿--What is the average total hours by race and native language? 

WITH avg_hours_race_lang AS (
	SELECT race_ethnicity, native_language, COUNT (studid), AVG(total_hours) 
	FROM gwpd.py1718
	GROUP BY race_ethnicity, native_language
	HAVING COUNT (studid) > 5
		)		

--How do students compare to the average of students of their race/language? 
SELECT studid, gwpd.py1718.race_ethnicity, gwpd.py1718.native_language, total_hours, avg_hours_race_lang.avg
FROM gwpd.py1718
LEFT JOIN avg_hours_race_lang ON gwpd.py1718.race_ethnicity=avg_hours_race_lang.race_ethnicity AND gwpd.py1718.native_language=avg_hours_race_lang.native_language