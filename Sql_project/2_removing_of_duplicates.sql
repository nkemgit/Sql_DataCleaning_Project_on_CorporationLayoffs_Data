# STEP TWO #
-- REMOVE DUPLICATE --
# due do there is no uniqu identifier we will asign row number, any row number greater than one is a duplicated value 

SELECT *, 
ROW_NUMBER() OVER(
    PARTITION BY 
        company, 
        location, 
        industry, 
        total_laid_off, 
        percentage_laid_off, 
        `date`, 
        stage, 
        country, 
        funds_raised_millions ) AS row_num
    FROM layoffs_stagging
ORDER BY company
;

-- Querying the row number as unique identifier for duplicate we need CTE

WITH duplicate_cte AS 
(
SELECT *, 
ROW_NUMBER() OVER(
    PARTITION BY 
        company, 
        location, 
        industry, 
        total_laid_off, 
        percentage_laid_off, 
        `date`, 
        stage, 
        country, 
        funds_raised_millions ) AS row_num
    FROM layoffs_stagging
ORDER BY company
) 
SELECT * 
FROM duplicate_cte
WHERE row_num > 1
;

-- CTE does not allow update in MYSQL database, then I crated a new stagging table to allow an update 
DROP TABLE IF EXISTS layoffs_stagging2;
CREATE TABLE `layoffs_stagging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_stagging2
SELECT *, 
ROW_NUMBER() OVER(
    PARTITION BY 
        company, 
        location, 
        industry, 
        total_laid_off, 
        percentage_laid_off, 
        `date`, 
        stage, 
        country, 
        funds_raised_millions ) AS row_num
    FROM layoffs_stagging
ORDER BY company
;

SELECT *
FROM layoffs_stagging2
WHERE row_num > 1        -- return all duplicate records
;

DELETE
FROM layoffs_stagging2
WHERE row_num > 1        -- delete all duplicate records
;