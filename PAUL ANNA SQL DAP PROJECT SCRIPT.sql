-- 1. Total profit in Anglophone and Francophone countries over 3 years
SELECT 
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
WHERE 
    COUNTRIES IN ('Nigeria', 'Ghana', 'Sierra Leone', 'Liberia', 'Gambia',  
                  'Benin', 'Togo', 'Senegal', 'Ivory Coast', 'Burkina Faso'); 

-- 2. Compare total profit between Anglophone and Francophone territories
SELECT 
    CASE 
        WHEN COUNTRIES IN ('Nigeria', 'Ghana', 'Sierra Leone', 'Liberia', 'Gambia') THEN 'Anglophone'
        ELSE 'Francophone'
    END AS Territory,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
GROUP BY 
    Territory;
    
-- 3. Country that generated the highest profit in 2019
SELECT 
    COUNTRIES,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
WHERE 
    YEARS = 2019
GROUP BY 
    COUNTRIES
ORDER BY 
    total_profit DESC
LIMIT 1;

-- 4. Year with the highest profit
SELECT 
    YEARS,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
GROUP BY 
    YEARS
ORDER BY 
    total_profit DESC
LIMIT 1;

-- 5. Month with the least profit in the last 3 years
SELECT 
    MONTHS,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
GROUP BY 
    MONTHS
ORDER BY 
    total_profit ASC
LIMIT 1;

-- 6. What was the minimum profit in December 2018?
SELECT 
    MIN(PROFIT) AS min_profit
FROM 
    international_fmcg
WHERE 
    MONTHS = 'December' AND YEARS = 2018;
    
-- 7. Compare the profit percentage for each month in 2019
SELECT 
    MONTHS,
    SUM(PROFIT) AS monthly_profit,
    ROUND(SUM(PROFIT) * 100.0 / (SELECT SUM(PROFIT) FROM international_fmcg WHERE YEARS = 2019), 2) AS profit_percentage
FROM 
    international_fmcg
WHERE 
    YEARS = 2019
GROUP BY 
    MONTHS
ORDER BY 
    FIELD(MONTHS, 'January','February','March','April','May','June','July','August','September','October','November','December');

-- 8. Which brand generated the highest profit in Senegal?
SELECT 
    BRANDS,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Senegal'
GROUP BY 
    BRANDS
ORDER BY 
    total_profit DESC
LIMIT 1;

-- 9. Calculate profit over the months (all years combined)
SELECT 
    MONTHS,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
GROUP BY 
    MONTHS
ORDER BY 
    FIELD(MONTHS, 'January','February','March','April','May','June','July','August','September','October','November','December');

-- 10. Top 3 brands consumed in Francophone countries in the last two years
SELECT 
    BRANDS,
    COUNT(*) AS times_consumed
FROM 
    international_fmcg
WHERE 
    YEARS IN (2018, 2019)
    AND COUNTRIES IN ('Benin', 'Togo', 'Senegal', 'Ivory Coast', 'Burkina Faso')
GROUP BY 
    BRANDS
ORDER BY 
    times_consumed DESC
LIMIT 3;

-- 11. Top 2 consumer brand choices in Ghana
SELECT 
    BRANDS,
    COUNT(*) AS purchase_count
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Ghana'
GROUP BY 
    BRANDS
ORDER BY 
    purchase_count DESC
LIMIT 2;

--  12. Details of beers consumed in the most oil-rich country in West Africa (Nigeria)
SELECT *
FROM international_fmcg
WHERE COUNTRIES = 'Nigeria'
  AND BRANDS NOT LIKE '%malt%';
  
-- 13. Favorite malt brand in Anglophone region (2018–2019)
SELECT 
    BRANDS,
    COUNT(*) AS consumption_count
FROM 
    international_fmcg
WHERE 
    YEARS IN (2018, 2019)
    AND COUNTRIES IN ('Nigeria', 'Ghana', 'Sierra Leone', 'Liberia', 'Gambia')
    AND BRANDS LIKE '%malt%'
GROUP BY 
    BRANDS
ORDER BY 
    consumption_count DESC
LIMIT 1;

-- 14. Top-selling brand in Nigeria in 2019
SELECT 
    BRANDS,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Nigeria' AND YEARS = 2019
GROUP BY 
    BRANDS
ORDER BY 
    total_profit DESC
LIMIT 1;

-- 15. Favorite brand in Nigeria’s South-South region
SELECT 
    BRANDS,
    COUNT(*) AS consumption_count
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Nigeria'
    AND REGION = 'southsouth'
GROUP BY 
    BRANDS
ORDER BY 
    consumption_count DESC
LIMIT 1;

-- 16. Beer consumption in Nigeria
SELECT 
    BRANDS,
    COUNT(*) AS consumption_count
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Nigeria'
    AND BRANDS NOT LIKE '%malt%'
GROUP BY 
    BRANDS
ORDER BY 
    consumption_count DESC;
    
-- 17. Level of consumption of Budweiser in Nigerian regions
SELECT 
    REGION,
    COUNT(*) AS budweiser_count
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Nigeria'
    AND BRANDS = 'budweiser'
GROUP BY 
    REGION
ORDER BY 
    budweiser_count DESC;
    
-- 18. Level of Budweiser consumption by region in Nigeria in 2019 (for Promo decisions)
SELECT 
    REGION,
    COUNT(*) AS budweiser_2019_count
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Nigeria'
    AND BRANDS = 'budweiser'
    AND YEARS = 2019
GROUP BY 
    REGION
ORDER BY 
    budweiser_2019_count DESC;
    
-- 19. Country with the highest beer consumption
SELECT 
    COUNTRIES,
    COUNT(*) AS beer_count
FROM 
    international_fmcg
WHERE 
    BRANDS NOT LIKE '%malt%'
GROUP BY 
    COUNTRIES
ORDER BY 
    beer_count DESC
LIMIT 1;

-- 20. Highest selling Budweiser sales rep in Senegal
SELECT 
    SALES_REP,
    SUM(PROFIT) AS total_profit
FROM 
    international_fmcg
WHERE 
    COUNTRIES = 'Senegal'
    AND BRANDS = 'budweiser'
GROUP BY 
    SALES_REP
ORDER BY 
    total_profit DESC
LIMIT 1;

-- 21. Country with the highest profit in Q4 (Oct–Dec) of 2019
SELECT 
    COUNTRIES,
    SUM(PROFIT) AS q4_profit
FROM 
    international_fmcg
WHERE 
    YEARS = 2019
    AND MONTHS IN ('October', 'November', 'December')
GROUP BY 
    COUNTRIES
ORDER BY 
    q4_profit DESC
LIMIT 1;










