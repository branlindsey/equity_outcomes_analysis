﻿--What is the race/native language of students who received CM services? 

SELECT program, 
	race_ethnicity, 
	native_language, 
	COUNT (es_services) as Got_ES,
	COUNT (studid) as Student_Count,
	ROUND (CAST (COUNT (es_services)as decimal)/ CAST (COUNT (studid) as decimal),2) as Percent_Served
FROM gwpd.py1718
--WHERE program = 'ABE Bellingham'
GROUP BY program, race_ethnicity, native_language
HAVING COUNT (studid) >= 5
ORDER BY Percent_Served DESC
