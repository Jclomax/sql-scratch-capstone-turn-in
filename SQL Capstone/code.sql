SELECT *
FROM survey
LIMIT 10;

SELECT question,
   COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5; 

SELECT DISTINCT q.user_id,
    CASE
      WHEN h.user_id IS NOT NULL THEN 'True' 
      ELSE 'False'
    END AS 'is_home_try_on',
    h.number_of_pairs,
    CASE
      WHEN p.user_id IS NOT NULL THEN 'True' 
      ELSE 'False'
    END AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id;
 
SELECT DISTINCT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id)

With funnels AS(
  SELECT DISTINCT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id)
SELECT Count (*) AS num_quiz,
  SUM(is_home_try_on) AS num_Try,
  SUM(is_purchase) AS num_purchase,
  number_of_pairs,
  1.0 * SUM(is_home_try_on) / COUNT(user_id),
1.0 * SUM(is_purchase) / SUM(is_home_try_on)
FROM funnels;

With funnels AS(
  SELECT DISTINCT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id)
SELECT Count (*) AS num_quiz,
  SUM(is_home_try_on) AS num_Try,
  SUM(is_purchase) AS num_purchase,
  number_of_pairs,
  1.0 * SUM(is_home_try_on) / COUNT(user_id),
1.0 * SUM(is_purchase) / SUM(is_home_try_on)
FROM funnels
WHERE number_of_pairs = '3 pairs';

With funnels AS(
  SELECT DISTINCT q.user_id,
    h.user_id IS NOT NULL AS 'is_home_try_on',
    h.number_of_pairs,
    p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz AS 'q'
 LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
 LEFT JOIN purchase AS 'p'
   ON q.user_id = p.user_id)
SELECT Count (*) AS num_quiz,
  SUM(is_home_try_on) AS num_Try,
  SUM(is_purchase) AS num_purchase,
  number_of_pairs,
  1.0 * SUM(is_home_try_on) / COUNT(user_id),
1.0 * SUM(is_purchase) / SUM(is_home_try_on)
FROM funnels
WHERE number_of_pairs = '5 pairs';