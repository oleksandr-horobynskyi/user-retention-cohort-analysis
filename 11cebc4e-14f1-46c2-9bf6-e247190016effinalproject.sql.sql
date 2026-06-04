-- Підготовка користувачів useres
WITH users_parsed AS (
    SELECT
        u.user_id,
        u.promo_signup_flag,
        u.signup_datetime,
       
        CASE 
            WHEN regexp_replace(split_part(TRIM(u.signup_datetime), ' ', 1), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{4}$' 
                THEN TO_DATE(regexp_replace(split_part(TRIM(u.signup_datetime), ' ', 1), '[./]', '-', 'g'), 'DD-MM-YYYY')
            WHEN regexp_replace(split_part(TRIM(u.signup_datetime), ' ', 1), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{2}$' 
                THEN TO_DATE(regexp_replace(split_part(TRIM(u.signup_datetime), ' ', 1), '[./]', '-', 'g'), 'DD-MM-YY')
            ELSE NULL 
        END AS signup_ts
    FROM cohort_users_raw u
),

-- Підготовка подій events
events_parsed AS (
    SELECT
        e.user_id,
        e.event_type,
        e.event_datetime,
        
        CASE 
            WHEN regexp_replace(split_part(TRIM(e.event_datetime), ' ', 1), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{4}$' 
                THEN TO_DATE(regexp_replace(split_part(TRIM(e.event_datetime), ' ', 1), '[./]', '-', 'g'), 'DD-MM-YYYY')
            WHEN regexp_replace(split_part(TRIM(e.event_datetime), ' ', 1), '[./]', '-', 'g') ~ '^\d{1,2}-\d{1,2}-\d{2}$' 
                THEN TO_DATE(regexp_replace(split_part(TRIM(e.event_datetime), ' ', 1), '[./]', '-', 'g'), 'DD-MM-YY')
            ELSE NULL 
        END AS event_ts
    FROM cohort_events_raw e
),

-- Об'єднання та фільтрація
user_activity AS (
    SELECT
        u.user_id,
        u.promo_signup_flag,
    -- Місяць залучення (когорта)
        DATE_TRUNC('month', u.signup_ts)::date AS cohort_month,
    -- Місяць активності
        DATE_TRUNC('month', e.event_ts)::date AS activity_month,
    -- Розрахунок month_offset (різниця місяців)
        (EXTRACT(YEAR FROM e.event_ts) - EXTRACT(YEAR FROM u.signup_ts)) * 12 +
        (EXTRACT(MONTH FROM e.event_ts) - EXTRACT(MONTH FROM u.signup_ts)) AS month_offset
    FROM users_parsed u
    JOIN events_parsed e ON u.user_id = e.user_id
    
    WHERE u.signup_ts IS NOT NULL            
      AND e.event_ts IS NOT NULL             
      AND e.event_type IS NOT NULL           
      AND e.event_type <> 'test_event'       
)

SELECT 
        promo_signup_flag,
        cohort_month,
        month_offset,
        COUNT(DISTINCT user_id) AS users_total -- Рахуємо унікальних користувачів
    FROM user_activity
    
    WHERE activity_month BETWEEN '2025-01-01' AND '2025-06-01'
    GROUP BY 1, 2, 3
    ORDER BY 1, 2, 3;
