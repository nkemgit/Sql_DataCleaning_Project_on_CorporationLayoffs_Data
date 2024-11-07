# we delet irrevant blanks for instance where the percentage_laid_off is blank and tota_laid_off is blank
SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

DELETE
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL   -- confirm the update
;

-- STEP FIVE--
#REMOVE UNSEFUL COLUMNS
# we need to get rid of the row_num because us not valuable to us anymore 
ALTER TABLE layoffs_stagging2
DROP COLUMN row_num
;

SELECT *
FROM layoffs_stagging2
;
-- we can go futher to replace the NULL Values with values of our choice depends on individuals
-- Now we have complete clean data ready for analytics and visualisation 