

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%% Finish the rest by answering these questions  %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%% Most are SQL - some are conceptual            %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%   short answers are fine for conceptual.      %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-- 1.  What percent survived? (total)

    SQL:
    SELECT 
      (SUM(CASE WHEN survived=1 THEN 1.0 ELSE 0.0 END)
      /
      CAST(COUNT(*) AS FLOAT))*100 AS percentage_survived
    FROM passengers;
    
    RESULT:
    34.2726580...%

-- 2.  Percentage of females that survived?

    SQL:
    SELECT 
      (SUM(CASE WHEN survived=1 AND sex='female' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN sex='female' THEN 1.0 ELSE 0.0 END))*100 
    AS females_percentage_survived
    FROM passengers;  
    
    RESULT:
    66.66666...%
-- 3.  Percentage of males that survived?

    SQL:
    SELECT 
      (SUM(CASE WHEN survived=1 AND sex='male' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN sex='male' THEN 1.0 ELSE 0.0 END))*100 
    AS males_percentage_survived
    FROM passengers;
    
    RESULT:
    16.68625146...%
-- 4.  How many people total were in First class, Second class, Third, or unknown ?

    SQL:
    SELECT
    COUNT(*) AS first_class
    FROM passengers
    WHERE class='1st' -- '2nd', '3rd', or class IS NULL (Unknown class)
    ;
    
    RESULTS:
        1st class: 322
        2nd class: 279
        3rd class: 710
        Unknown: 2
-- 5.  What is the total number of people in First and Second class ?

    SQL:
    SELECT
    COUNT(*) AS first_and_second_class
    FROM passengers
    WHERE class = '1st' OR class = '2nd'
    ;
    
    RESULT:
    601
-- 6.  What are the survival percentages of the different classes? (3).
    
    SQL:
    SELECT 
      (SUM(CASE WHEN survived=1 AND class='1st' THEN 1.0 ELSE 0.0 END)
      /
      SUM(CASE WHEN class='1st' THEN 1.0 ELSE 0.0 END))*100 
    AS first_class_percentage_survived
    FROM passengers; -- for others, change class to 2nd or 3rd
    
    RESULTS:
        1st class: 59.9378881...%
        2nd class: 42.6523297...%
        3rd class: 19.4366197...%
        Unknown class: 0%


-- 7.  Can you think of other interesting questions about this dataset?
--      I.e., is there anything interesting we can learn from it?  
--      Try to come up with at least two new questions we could ask.

--      Example:
--      Can we calcualte the odds of survival if you are a female in Second Class?
--      Could we compare this to the odds of survival if you are a Female in First Class?
--      If we can answer this question, is it meaningful?  Or just a coincidence ... ?
    
        -- What about the survival rates of the youth (18 or under) in different classes?
        SQL:
        SELECT 
            (SUM(CASE WHEN age <= 18 AND class = '1st' AND survived = 1 THEN 1.0 ELSE 0.0 END)
            /
            SUM(CASE WHEN age <= 18 AND class = '1st' THEN 1.0 ELSE 0.0 END))*100 
        AS first_class_youth_survival_rate
        FROM passengers;
        
        RESULTS:
            1st class: 88.23529...% of all youth survived
            2nd class: 77.777...% of all youth survived
            3rd class: 35.6164...% of all youth survived
            
        -- What about the overall survival rate of young women verses young men?
        SQL:
        SELECT 
            (SUM(CASE WHEN age <= 18 AND sex = 'female' AND survived = 1 THEN 1.0 ELSE 0.0 END)
            /
            SUM(CASE WHEN age <= 18 AND sex = 'female' THEN 1.0 ELSE 0.0 END))*100 
        AS girls_survival_rate
        FROM passengers;
        
        SELECT 
            (SUM(CASE WHEN age <= 18 AND sex = 'male' AND survived = 1 THEN 1.0 ELSE 0.0 END)
            /
            SUM(CASE WHEN age <= 18 AND sex = 'male' THEN 1.0 ELSE 0.0 END))*100 
        AS boys_survival_rate
        FROM passengers;
        
        RESULTS:
            Girls: 67.1641...%
            Boys: 40.67796...%

-- 8.  How would we answer those questions if we did think of some?
--      Are you able to write the query to find the answer now?  
--      Or - do we need more data to find out - is this data set sufficient?

--      Do you posess the SQL knowledge now to answer these questions using the dataset?
--          If not, what else might we need to learn in order to do it?


--      If you did answer some questions about the data, 
--          how would you justify or defend your results if someone challenged them?
--          -- Did the query make sense?  Are your methods good ?
