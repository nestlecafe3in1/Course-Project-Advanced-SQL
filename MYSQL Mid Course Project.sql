/*Gsearch seems to be the biggest driver of our business. Could you pull Monthly Trends for gsearch sessions and orders
so that we can showcase the growth there? */
USE mavenfuzzyfactory;

WITH cte_monthly_trend_analysis AS
	(
	SELECT
		MONTHNAME(ws.created_at) as month,
		COUNT(DISTINCT ws.website_session_id) as sessions,
		COUNT(DISTINCT o.order_id ) as orders
	FROM	
		website_sessions ws
		
			LEFT JOIN
			
		orders o ON o.website_session_id = ws.website_session_id
	WHERE
		ws.created_at <= '2012-11-27'
		AND ws.utm_source = 'gsearch'
	GROUP BY MONTH(ws.created_at) 
    #GROUPBY CLAUSE used to seperate months into sections for monthly analysis
    )
SELECT 
	month,
    sessions,
    orders,
    orders/sessions*100 as conversion_rate
FROM cte_monthly_trend_analysis; 


/* Next, it would be great to see a similar monthly trend for Gsearch, but this time splitting nonbrand and brand campaigns
separately. I am wondering if brand is picking up at all. If so, this is a good story to tell */
WITH cte_monthly_trend AS
	(
	SELECT
		MONTHNAME(ws.created_at) as month,
		COUNT(DISTINCT CASE 
			WHEN ws.utm_campaign = 'nonbrand' THEN ws.website_session_id 
			ELSE NULL 
			END) as nonbrand_sessions,
		COUNT(DISTINCT CASE 
			WHEN ws.utm_campaign = 'nonbrand' THEN o.order_id 
			ELSE NULL 
			END) as nonbrand_orders,
		COUNT(DISTINCT CASE 
			WHEN ws.utm_campaign = 'brand' THEN ws.website_session_id 
			ELSE NULL 
			END) as brand_sessions,
		COUNT(DISTINCT CASE 
			WHEN ws.utm_campaign = 'brand' THEN o.order_id 
			ELSE NULL 
			END) as brand_orders 
		#CASE CLAUSE used to seperate brand and nonbrand campaigns to analyse monthly trends individually
	FROM	
		website_sessions ws
		
			LEFT JOIN
			
		orders o ON o.website_session_id = ws.website_session_id
	WHERE
		ws.created_at <= '2012-11-27'# as specified in question
		AND ws.utm_source = 'gsearch' # as specified in question
	GROUP BY MONTH(ws.created_at)
	)
SELECT
	month,
    nonbrand_sessions,
    nonbrand_orders,
    nonbrand_orders/nonbrand_sessions*100 AS nonbrand_conversion_rt,
    brand_sessions,
    brand_orders,
    brand_orders/brand_sessions*100 AS brand_conversion_rt #CTE used to calculate conversion rate w/o being messy
FROM cte_monthly_trend;



/* While we're on Gsearch, could you dive into nonbrand and pull monthly sessions and orders split by device type?
I want to flex our analytical skills and show the board we really know our traffic sources. */
WITH cte_monthly_trend AS
	(
	SELECT
		MONTHNAME(ws.created_at) as month,
		COUNT(DISTINCT CASE 
			WHEN ws.device_type = 'desktop' THEN ws.website_session_id 
			ELSE NULL 
			END) as desktop_sessions,
		COUNT(DISTINCT CASE 
			WHEN ws.device_type = 'desktop' THEN o.order_id 
			ELSE NULL 
			END) as desktop_orders,
		COUNT(DISTINCT CASE 
			WHEN ws.device_type = 'mobile' THEN ws.website_session_id 
			ELSE NULL 
			END) as mobile_sessions,
		COUNT(DISTINCT CASE 
			WHEN ws.device_type = 'mobile' THEN o.order_id 
			ELSE NULL 
			END) as mobile_orders 
		#CASE CLAUSE used to seperate device used to analyse monthly trends individually
	FROM	
		website_sessions ws
		
			LEFT JOIN
			
		orders o ON o.website_session_id = ws.website_session_id
	WHERE
		ws.created_at <= '2012-11-27'
		AND ws.utm_source = 'gsearch'
        AND ws.utm_campaign = 'nonbrand'
	GROUP BY MONTH(ws.created_at)
	)
SELECT
	month,
    desktop_sessions,
    desktop_orders,
    desktop_orders/desktop_sessions*100 AS desktop_conversion_rt,
    mobile_sessions,
    mobile_orders,
    mobile_orders/mobile_sessions*100 AS mobile_conversion_rt 
    #CTE used to calculate conversion rates w/o being messy
FROM cte_monthly_trend;


/* I'm worried that one of our more pessimistic board members may be concerned about the large % of traffic from
Gsearch, Can you pull monthly trends for Gsearch, along side monthly trends for each of our other channels?*/
SELECT
	MONTHNAME(ws.created_at) as month,
	COUNT(DISTINCT CASE 
		WHEN ws.utm_source = 'gsearch' THEN ws.website_session_id 
		ELSE NULL 
		END) as gsearch_paid_sessions,
	COUNT(DISTINCT CASE 
		WHEN ws.utm_source = 'bsearch' THEN ws.website_session_id 
		ELSE NULL 
		END) as bsearch_paid_sessions,
	COUNT(DISTINCT CASE 
		WHEN ws.utm_source IS NULL AND ws.http_referer IS NOT NULL THEN ws.website_session_id 
		ELSE NULL 
		END) as organic_search_sessions,
	COUNT(DISTINCT CASE 
		WHEN ws.utm_source IS NULL AND ws.http_referer IS NULL THEN ws.website_session_id 
		ELSE NULL 
		END) as direct_search_sessions
	#If utm_source is null, these sessions are not created through paid channels, instead the website
    #is either organically searched or directly searched by the user
FROM 
	website_sessions ws
WHERE ws.created_at <= '2012-11-27'
GROUP BY MONTH(ws.created_at);


/* I'd like to tell the story of our website performance improvements over the course of the first 8 months.
Could you pull session to order conversion rates, by month*/
WITH cte_monthly_trend AS
	(
	SELECT
		MONTHNAME(ws.created_at) as month,
		COUNT(DISTINCT ws.website_session_id) as sessions,
		COUNT(DISTINCT o.order_id) as orders
	FROM	
		website_sessions ws
		
			LEFT JOIN
			
		orders o ON o.website_session_id = ws.website_session_id
	WHERE
		ws.created_at <= '2012-11-27'
	GROUP BY MONTH(ws.created_at)
	)
SELECT
	month,
    sessions,
    orders,
    orders/sessions AS conversion_rate
FROM cte_monthly_trend;


/* From the Gsearch lander test, please estimate the revenue that test (Jun19 - Jul 28) earned us */
SET @incrementalcvr = 0;

SET @incrementalcvr = 
	(
	WITH cte_incremental_cvr AS
		(
		SELECT
			COUNT(DISTINCT CASE 
				WHEN wp.pageview_url = '/home' THEN wp.website_session_id 
				ELSE NULL END) as home_sessions,
			COUNT(DISTINCT CASE 
				WHEN wp.pageview_url = '/home' THEN o.order_id 
				ELSE NULL END) as home_orders,
			COUNT(DISTINCT CASE 
				WHEN wp.pageview_url = '/lander-1' THEN wp.website_session_id 
				ELSE NULL END) as lander_sessions,
			COUNT(DISTINCT CASE 
				WHEN wp.pageview_url = '/lander-1' THEN o.order_id 
				ELSE NULL END) as lander_orders
		FROM
			website_pageviews wp
			
				INNER JOIN
			
			website_sessions ws ON ws.website_session_id = wp.website_session_id
				
				LEFT JOIN
			
			orders o ON o.website_session_id = ws.website_session_id
		WHERE 
			wp.website_pageview_id >= 
				(
				SELECT MIN(website_pageview_id)
				FROM website_pageviews
				WHERE pageview_url = '/lander-1'
				) #First instance of test lander page
			AND DATE(wp.created_at) < '2012-07-28' #Date specified as the end of the test
			AND ws.utm_source = 'gsearch'
			AND ws.utm_campaign = 'nonbrand'
		)
	SELECT (lander_orders/lander_sessions) - (home_orders/home_sessions)
    #Calculation to determine the increase in session-to-order conversion rate from home page to new lander page
	FROM cte_incremental_cvr
    );
    
SELECT @incrementalcvr; # 0.87% increase in conversion rate between old lander page and new lander page

SELECT
	COUNT(DISTINCT website_session_id) * @incrementalcvr
    # Total sessions since end of test * Conversion rate difference = Increment in order count due to the new lander page
FROM website_sessions
WHERE 
	website_session_id >
	(
    SELECT MAX(ws.website_session_id)
	FROM 
		website_pageviews wp
			INNER JOIN
		website_sessions ws ON ws.website_session_id = wp.website_session_id
    WHERE 
		wp.pageview_url = '/home'
		AND ws.utm_source = 'gsearch'
		AND ws.utm_campaign = 'nonbrand'
		AND ws.created_at < '2012-11-27'
    #Last website session of home page being used in the test
    ) 
	AND created_at < '2012-11-27'
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'; # gsearch channel and nonbrand campaign specified in previous question

# There were 200 incremental orders since the end date of test (7/29) due to the new landing page
# 4 Months have passed, so roughly 50 extra orders per month due to new landing page.


/* For the landing page test you analyzed previously, it would be great to show a full conversion funnel from each of the
two pages to orders. You can use the same time period you analyzed last time (Jun19 - Jul28)*/
SELECT
	wp1.lander_page,
	COUNT(CASE 
		WHEN wp.pageview_url = wp1.lander_page 
        THEN wp.pageview_url ELSE NULL END) as landing_pg_count,
	COUNT(CASE 
		WHEN wp.pageview_url = '/products'
        THEN wp.pageview_url ELSE NULL END) product_pg_count,
	COUNT(CASE 
		WHEN wp.pageview_url = '/the-original-mr-fuzzy'
        THEN wp.pageview_url ELSE NULL END) mrfuzzy_pg_count,
	COUNT(CASE 
		WHEN wp.pageview_url = '/cart'
        THEN wp.pageview_url ELSE NULL END) cart_pg_count,
	COUNT(CASE 
		WHEN wp.pageview_url = '/shipping'
        THEN wp.pageview_url ELSE NULL END) shipping_pg_count,
	COUNT(CASE 
		WHEN wp.pageview_url = '/billing'
        THEN wp.pageview_url ELSE NULL END) billing_pg_count,
	COUNT(CASE 
		WHEN wp.pageview_url = '/thank-you-for-your-order'
        THEN wp.pageview_url ELSE NULL END) thankyou_pg_count
	#Above query is to count the number of page views each page has received 
    #starting from landing page to the last thank you page
    
FROM
	(
	SELECT
		a.website_session_id,
		a.pageview_url as lander_page
	FROM
		(
		SELECT
			website_session_id,
			pageview_url,
			RANK() over w1 as pageview_order
		FROM website_pageviews
		WINDOW w1 AS (PARTITION BY website_session_id ORDER BY website_pageview_id)
        #Query to rank order of pageview per wesbite_session
		) a
	WHERE a.pageview_order = 1
    #Rank function used to link website_session_id and lander page used
	) wp1
    
		JOIN
	
    website_pageviews wp ON wp1.website_session_id = wp.website_session_id
		
        JOIN
	
    website_sessions ws ON ws.website_session_id = wp.website_session_id
WHERE
	wp.website_pageview_id >= 
				(
				SELECT MIN(website_pageview_id)
				FROM website_pageviews
				WHERE pageview_url = '/lander-1'
				) #First instance of test lander page
	AND DATE(wp.created_at) < '2012-07-28' 
    #Date specified as the end of the test
    AND ws.utm_source = 'gsearch'
	AND ws.utm_campaign = 'nonbrand'
    # gsearch channel and nonbrand campaign specified in previous question
GROUP BY lander_page;
#Final result displays a conversion funnel (of pageviews) for each landing page


/* I'd love for you to quantify the impact of our billing test, as well. Please analyze the lift generated from the test (Sep10 - Nov10),
in terms of revenue per billing page session, and then pull the number of billing page sessions for the past month to understand
monthly impact. */
SET @revenue_per_pg_incre = 0;

SET @revenue_per_pg_incre =
	(
	WITH cte_revenue_per_billingpg AS
		(
		SELECT
			COUNT(DISTINCT CASE WHEN  pageview_url = '/billing'
			THEN wp.website_session_id ELSE NULL END) AS billing_pg_sessions, 
            # Number of billing page 1 sesions
			
            SUM(CASE WHEN pageview_url = '/billing'
			THEN o.price_usd * o.items_purchased END) AS billing_pg_revenue,
            # revenue generated by billing page 1
            
			COUNT(DISTINCT CASE WHEN  pageview_url = '/billing-2'
			THEN wp.website_session_id ELSE NULL END) AS billing2_pg_sessions,
            # Number of billing page 2 (test billing page) sessions
            
			SUM(CASE WHEN pageview_url = '/billing-2'
			THEN o.price_usd * o.items_purchased END) AS billing2_pg_revenue
            # revenue generated by billing page 2 (test billing page)
		FROM
			website_pageviews wp
				
				LEFT JOIN
			
			orders o ON o.website_session_id = wp.website_session_id
		WHERE
			wp.created_at BETWEEN '2012-09-10' AND '2012-11-10' # Specified date of the billing test
			AND wp.pageview_url IN ('/billing', '/billing-2')
		)
	SELECT 
		ROUND((billing2_pg_revenue/billing2_pg_sessions) - (billing_pg_revenue/billing_pg_sessions),2)
        #Difference In Revenue per billing page session between billing page 1 and billing page 2

	FROM cte_revenue_per_billingpg
    );

SELECT @revenue_per_pg_incre; 
# $8.51 is the Difference in revenue per billing page session between the two billing pages.

SELECT
	ROUND(COUNT(DISTINCT website_session_id)*@revenue_per_pg_incre,2)
    # Total website sessions over the last month * lift in revenue per billing page 
FROM website_pageviews
WHERE
	created_at BETWEEN '2012-10-27' AND '2012-11-27' #Specified in Question (past month)
    AND pageview_url IN ('/billing', '/billing-2');
    
# Due to our billing test, we have experienced an increase in revenue by $10152.43 over the last month after the billing test.