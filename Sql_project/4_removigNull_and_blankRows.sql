
-- STEP FOUR --
# REMOVE NULL and Blank Rows
SELECT  *
FROM layoffs_stagging2
WHERE industry IS NULL
OR industry = ''
;

# convert the blacks to NULL VALUES
UPDATE layoffs_stagging2
SET industry = NULL 
WHERE industry = ''
;

-- confirm update
SELECT *
FROM layoffs_stagging2
WHERE industry IS NULL