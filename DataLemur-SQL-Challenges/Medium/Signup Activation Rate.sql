WITH rate AS (
SELECT
  user_id,
  CASE WHEN texts.email_id IS NOT NULL THEN 1
    ELSE 0
  END AS activation_count
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND signup_action = 'Confirmed'
)
  
SELECT 
  ROUND(
    SUM(activation_count)::DECIMAL 
      / COUNT(user_id), 2) AS activation_rate
FROM rate;