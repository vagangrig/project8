

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%% Finish the rest by answering these questions  %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%% Most are SQL - some are conceptual            %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%   short answers are fine for conceptual.      %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-- CSc 33600 Summer 2018
-- Vagan Grigoryan
-- Homework 1 Submission

-- 1.  What percent survived? (total)
    SELECT 
      (SUM(CASE WHEN survived=1 THEN 1.0 ELSE 0.0 END)
      /
      CAST(COUNT(*) AS FLOAT))*100 
      AS percentage_total_survived
    FROM passengers
    ;
    -- 34.27265...%
    
-- 2.  Percentage of females that survived?
    SELECT 
      (SUM(CASE WHEN survived=1 AND sex='female' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN sex='female' THEN 1.0 ELSE 0.0 END))*100 
      AS percentage_females_survived
    FROM passengers
    ; 
    -- 66.66666...%
    
-- 3.  Percentage of males that survived?
    SELECT 
      (SUM(CASE WHEN survived=1 AND sex='male' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN sex='male' THEN 1.0 ELSE 0.0 END))*100 
      AS percentage_males_survived
    FROM passengers
    ; 
    -- 16.68625...%
    
-- 4.  How many people total were in First class, Second class, Third, or unknown ?
    SELECT
    COUNT(*) AS first_class
    FROM passengers
    WHERE class = '1st'
    ;
    -- 322
    SELECT
    COUNT(*) AS second_class
    FROM passengers
    WHERE class = '2nd'
    ;
    -- 279
    SELECT
    COUNT(*) AS third_class
    FROM passengers
    WHERE class = '3rd'
    ;
    -- 710
    SELECT
    COUNT(*) AS unknown_class
    FROM passengers
    WHERE class IS NULL
    ;
    -- 2
    
-- 5.  What is the total number of people in First and Second class ?
    SELECT
    COUNT(*) AS first_or_second_class
    FROM passengers
    WHERE class = '1st' OR class = '2nd'
    ;
    -- 601
    
-- 6.  What are the survival percentages of the different classes? (3).
    SELECT 
      (SUM(CASE WHEN survived=1 AND class='1st' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN class='1st' THEN 1.0 ELSE 0.0 END))*100 
    AS first_class_percentage_survived
    FROM passengers
    ;
    -- 59.93788...%
    SELECT 
      (SUM(CASE WHEN survived=1 AND class='2nd' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN class='2nd' THEN 1.0 ELSE 0.0 END))*100 
    AS second_class_percentage_survived
    FROM passengers
    ;
    -- 42.65232...%
    SELECT 
      (SUM(CASE WHEN survived=1 AND class='3rd' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN class='3rd' THEN 1.0 ELSE 0.0 END))*100 
    AS third_class_percentage_survived
    FROM passengers
    ;
    -- 19.43661...%
    
-- 7.  Can you think of other interesting questions about this dataset?
--      I.e., is there anything interesting we can learn from it?  
--      Try to come up with at least two new questions we could ask.

--      Example:
--      Can we calcualte the odds of survival if you are a female in Second Class?
--      Could we compare this to the odds of survival if you are a Female in First Class?
--      If we can answer this question, is it meaningful?  Or just a coincidence ... ?
    --  A. What about the survival rate of young females verses young males?
        SELECT 
          (SUM(CASE WHEN age <= 18 AND sex = 'female' AND survived = 1 THEN 1.0 ELSE 0.0 END)
          /
          SUM(CASE WHEN age <= 18 AND sex = 'female' THEN 1.0 ELSE 0.0 END))*100 
          AS girls_survival_rate
        FROM passengers
        ;
        -- 67.16417...%
        SELECT 
          (SUM(CASE WHEN age <= 18 AND sex = 'male' AND survived = 1 THEN 1.0 ELSE 0.0 END)
          /
          SUM(CASE WHEN age <= 18 AND sex = 'male' THEN 1.0 ELSE 0.0 END))*100 
          AS boys_survival_rate
        FROM passengers
        ;
        -- 40.67796...%
    -- B. What about the survival rate of females that were mothers vs. females that weren't?
    -- C. What about the survival rate of males that were fathers vs. males that weren't?



-- 8.  How would we answer those questions if we did think of some?
--      Are you able to write the query to find the answer now?  
--      Or - do we need more data to find out - is this data set sufficient?

--      Do you posess the SQL knowledge now to answer these questions using the dataset?
--          If not, what else might we need to learn in order to do it?


--      If you did answer some questions about the data, 
--          how would you justify or defend your results if someone challenged them?
--          -- Did the query make sense?  Are your methods good ?
    -- For A, yes. The query is written below the question.
    -- For B and C, no. A data set that includes a column "has children" (0 or 1) would be sufficient.
