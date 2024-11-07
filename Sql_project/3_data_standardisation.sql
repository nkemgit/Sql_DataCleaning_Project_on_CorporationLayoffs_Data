-- STEP THREE --
# STANDARDISATION/STANDARDISING DATA #
# find issue or irregularities in data and fix it

SELECT *
FROM layoffs_stagging2
;
-- use Trim function to allign the values in sandard format
SELECT DISTINCT company, TRIM(company)
FROM layoffs_stagging2
;

UPDATE layoffs_stagging2
SET company = TRIM(company)
;

-- find and replace some incorrectly spelled word in company column
SELECT industry
FROM layoffs_stagging2
WHERE industry LIKE 'Crypto%'
;

UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;

SELECT country
FROM layoffs_stagging2
ORDER BY 1
;

SELECT country, TRIM(TRAILING '.' FROM country) AS label
FROM layoffs_stagging2
ORDER BY 1
;

UPDATE  layoffs_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'
;

SELECT DISTINCT country
FROM layoffs_stagging2
ORDER BY 1
;

UPDATE  layoffs_stagging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y') 
;

ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE
;

SELECT  *
FROM layoffs_stagging2 -- return the formatted outcome