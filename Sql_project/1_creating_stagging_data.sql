-- STEP ONE --
#CREAT STAGGING TABLE#
# The best way to carry out cleaning is to create a stagging table rather than using raw tables
SELECT *
FROM layoffs_data
;

DROP table IF EXISTS layoffs_stagging;
CREATE TABLE layoffs_stagging
LIKE layoffs_data
;

INSERT INTO layoffs_stagging
SELECT *
FROM layoffs_data
;

SELECT *
FROM layoffs_stagging