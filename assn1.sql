

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

-- 5.  What is the total number of people in First and Second class ?

-- 6.  What are the survival percentages of the different classes? (3).




-- 7.  Can you think of other interesting questions about this dataset?
--      I.e., is there anything interesting we can learn from it?  
--      Try to come up with at least two new questions we could ask.

--      Example:
--      Can we calcualte the odds of survival if you are a female in Second Class?
--      Could we compare this to the odds of survival if you are a Female in First Class?
--      If we can answer this question, is it meaningful?  Or just a coincidence ... ?



-- 8.  How would we answer those questions if we did think of some?
--      Are you able to write the query to find the answer now?  
--      Or - do we need more data to find out - is this data set sufficient?

--      Do you posess the SQL knowledge now to answer these questions using the dataset?
--          If not, what else might we need to learn in order to do it?


--      If you did answer some questions about the data, 
--          how would you justify or defend your results if someone challenged them?
--          -- Did the query make sense?  Are your methods good ?
