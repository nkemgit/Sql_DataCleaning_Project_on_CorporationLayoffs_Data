-- use self join to pouplate the missing data
SELECT *
FROM layoffs_stagging2 t1
INNER JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
;

SELECT 
	t1.industry, 
    t2.industry   -- focused on industry col of interest 
FROM layoffs_stagging2 t1
INNER JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
WHERE t1.industry is NULL 
AND t2.industry IS NOT NULL 
;

# to populate table one 't1' we need to update t1 with t2
UPDATE layoffs_stagging2 t1
INNER JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry is NULL 
AND t2.industry IS NOT NULL 
;

SELECT *
FROM layoffs_stagging2  -- confirm update
WHERE industry IS NULL
;
