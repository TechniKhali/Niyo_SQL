---Overview of no. of rows in year range---
SELECT COUNT (ID)
FROM Sales
WHERE Year_of_Release <2006
AND Year_of_Release >=1998;
---4,854 rows

---Consoles released in target range---
SELECT * FROM Platforms
WHERE ReleaseDate <'11/01/2005'
AND ReleaseDate >='11/01/1998'
AND Category = 'Consoles'
ORDER BY ReleaseDate ASC;
---9 consoles---

---Games from top 50 games of all time in target range---
SELECT * FROM best_selling
WHERE Release_date <'11/01/2005'
AND Release_date >='11/01/1998'
ORDER BY Sales DESC;
---4 games---

---Where do consoles from Platform fit into console sales?---
SELECT * FROM console
WHERE console LIKE '%Dreamcast%' OR
console LIKE '%64DD%' OR
console LIKE '%PlayStation 2%' OR
console LIKE '%PS One%' OR
console LIKE '%Nuon%' OR
console LIKE '%(Xb)' OR
console LIKE '%GameCube%' OR
console LIKE '%XaviXPORT%' OR
console LIKE '%Game Wave%'
ORDER BY Global DESC;
---no.1-PlayStation 2 (PS2), no.20-Xbox (XB), no.21-GameCube (GC), no.29-Dreamcast (DC)---

---Platform's Total Video Game Revenue---
SELECT Platform, SUM(Global_Sales) as Total_Global_Sales
FROM Sales
GROUP BY Platform
ORDER BY Total_Global_Sales DESC;

---Who is beating Gen 6, older or newer games?---
SELECT Name, Platform, Year_of_Release, Global_Sales,
CASE
	WHEN Year_of_Release BETWEEN 1998 AND 2005 THEN 'GEN 6'
	WHEN Year_of_Release < 1998 THEN 'OLDER'
	ELSE 'NEWER'
	END AS Period
	FROM Sales
ORDER BY Global_Sales DESC;

---Descending order by region---
SELECT console, North_America
FROM console
ORDER BY North_America DESC;

SELECT console, Europe
FROM console
ORDER BY Europe DESC;

SELECT console, Japan
FROM console
ORDER BY Japan DESC;

SELECT console, Rest_of_World
FROM console
ORDER BY Rest_of_World DESC;

---Average console sales---
SELECT console, (North_America + Europe + Japan + Rest_of_World)/4 AS Sales_AVG
FROM console
ORDER BY Sales_AVG DESC;