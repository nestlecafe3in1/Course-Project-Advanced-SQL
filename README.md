# Mid-Course-Project-Advanced-SQL
Advanced SQL: MySQL Data Analysis & Business Intelligence is a project-based course where I play the role of an analyst for an e-commerce business where I help different executives understanding the performance of the company to solve some of the problems presented in the same. 

For this mid course project, my objective is to tell the story of my company's growth using trended performance data, explain some of the details around your growth story and quantify the revenue impact of some of my big wins.

## Database, Database Tool and Visualization Tool
- MySQL
- MySQL Workbench
- Tableau Public

## Questions Asked
### Gsearch seems to be the biggest driver of our business. Could you pull Monthly Trends for gsearch sessions and orders so that we can showcase the growth there?
![image](https://user-images.githubusercontent.com/113234853/194018302-e8151306-5311-48f3-ae12-809df7bdbd55.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn1/Chart1)

### Next, it would be great to see a similar monthly trend for Gsearch, but this time splitting nonbrand and brand campaigns separately. I am wondering if brand is picking up at all. If so, this is a good story to tell
![image](https://user-images.githubusercontent.com/113234853/194021082-5c8e0af5-43c5-4f16-8e98-0ee3432c6028.png)
View Tableau Public Details for [first](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn2/Chart2_1) and [second](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn2_2/Chart2_2) graph

### While we're on Gsearch, could you dive into nonbrand and pull monthly sessions and orders split by device type? I want to flex our analytical skills and show the board we really know our traffic sources
![image](https://user-images.githubusercontent.com/113234853/194022929-57b3ba21-96af-4788-98e0-2f3062da9863.png)
View Tableau Public Details for [first](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn3_1/Chart3_1) and [second](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn3_2/Chart3_2) graph

### I'm worried that one of our more pessimistic board members may be concerned about the large % of traffic from Gsearch, Can you pull monthly trends for Gsearch, along side monthly trends for each of our other channels?
![image](https://user-images.githubusercontent.com/113234853/194024012-08b2a1be-5c1f-423c-a94f-cd2578f7687c.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn4/Chart4)

### I'd like to tell the story of our website performance improvements over the course of the first 8 months. Could you pull session to order conversion rates, by month
![image](https://user-images.githubusercontent.com/113234853/194024991-6ff300cb-6bf2-47a1-8770-d5024973a6a7.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn5/Chart5)

### From the Gsearch lander test, please estimate the revenue that test (Jun19 - Jul 28) earned us
In order to find the estimated revenue from the test, I first calculated the increase in session-to-order conversion rate from the old landing page to the new landing page during the test itself (Jun19 - Jul 28). Here are the results:

![image](https://user-images.githubusercontent.com/113234853/194029079-0fa119d7-8e4c-42f0-b2fc-f979f6a6d95f.png)

As you can see, there is a 0.87% increase in conversion rate when switching from the old lander page to the new lander page. I then multiplied this value to the total number of sessions created since the end of the test to find the difference in order count:

![image](https://user-images.githubusercontent.com/113234853/194029901-1048a634-787a-442b-b45f-e80597158b3e.png)

As you can see, it was calculated that there were 200 additional orders since the end date of test (7/29) due to the new landing page. Since 4 Months have passed, roughly 50 extra orders per month due to new landing page.

*I am operating on the assumption that the session-to-order conversion rate for the new landing page remains unchanged since the test* 
