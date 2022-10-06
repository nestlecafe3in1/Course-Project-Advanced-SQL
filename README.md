# Mid-Course-Project-Advanced-SQL
Advanced SQL: MySQL Data Analysis & Business Intelligence is a project-based course on Udemy where I play the role of an analyst for an e-commerce business where I help different executives understanding the performance of the company to solve some of the problems presented.

For this mid course project, my objective is to tell the story of my company's growth using trended performance data, explain some of the details around our growth story and quantify the revenue impact of some of our big wins.

## Database, Database Tool and Visualization Tool
- MySQL
- MySQL Workbench
- Tableau Public

## Questions Asked
#### Gsearch seems to be the biggest driver of our business. Could you pull Monthly Trends for gsearch sessions and orders so that we can showcase the growth there?
##### Query Results
![MYSQL Question 1 Result](https://user-images.githubusercontent.com/113234853/194038583-92a16765-be53-4006-8516-65c8d3166332.png)

##### Visualisation of Monthly Session-to-Orders Conversion Rate on Gsearch
![MYSQL question 1 tableau](https://user-images.githubusercontent.com/113234853/194038887-3d16ad91-e949-4e15-8d4e-b847e3acd4ae.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn1/Chart1)

#### Next, it would be great to see a similar monthly trend for Gsearch, but this time splitting nonbrand and brand campaigns separately. I am wondering if brand is picking up at all. If so, this is a good story to tell
#### Query Results
![MYSQL Question 2 result](https://user-images.githubusercontent.com/113234853/194039068-a01a8b6b-d56f-4ea6-99f4-6d254a349ef0.png)

##### Visualisation of Session Count Between Campaigns
![Mysql question 2 1 chart](https://user-images.githubusercontent.com/113234853/194039686-998a8112-d339-4608-a8d2-c7cb59ec1805.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn2_2/Chart2_2)

##### Visualisation of Conversion Rate Between Campaigns
![Mysql question 2 2 chart](https://user-images.githubusercontent.com/113234853/194039958-7accd90c-c009-4544-8dbb-e8918af48e72.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn2/Chart2_1)

#### While we're on Gsearch, could you dive into nonbrand and pull monthly sessions and orders split by device type? I want to flex our analytical skills and show the board we really know our traffic sources
##### Query Results
![mysql question 3 result](https://user-images.githubusercontent.com/113234853/194040675-a4649243-4880-4fb1-8a03-89b84d38a69f.png)

##### Visualisation of Session Count Between Devices
![MYSQL question 3 1 graph](https://user-images.githubusercontent.com/113234853/194040946-1cdfc1b9-c298-4009-a208-d235b3854f00.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn3_1/Chart3_1)

##### Visualisation of Conversion Rates between Mobile and Desktop
![mysql question 3 2 chart](https://user-images.githubusercontent.com/113234853/194210673-24fdb108-020c-4889-8d7c-cc50292f065b.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn3_2/Chart3_2)

#### I'm worried that one of our more pessimistic board members may be concerned about the large % of traffic from Gsearch, Can you pull monthly trends for Gsearch, along side monthly trends for each of our other channels?
##### Query Results
![mysql question 4 result](https://user-images.githubusercontent.com/113234853/194041378-40740cc1-f52f-4733-b5ce-d1488a35eed9.png)

##### Visualisation of Monthly Trends for all Channels
![image](https://user-images.githubusercontent.com/113234853/194041768-290a09a7-bf81-4d14-8b58-0c8dab32659f.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn4/Chart4)

#### I'd like to tell the story of our website performance improvements over the course of the first 8 months. Could you pull session to order conversion rates, by month
##### Query Results
![mysql q5 result](https://user-images.githubusercontent.com/113234853/194041918-1efc5275-f653-468a-b150-04cac8d63361.png)

##### Visualisation of Monthly Session-to-order Conversion Rate
![MYSQL q5](https://user-images.githubusercontent.com/113234853/194042263-a6ead9c2-c844-494f-83ec-42edc1e93cb8.jpg)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn5/Chart5)

#### From the Gsearch lander test, please estimate the revenue that test (Jun19 - Jul 28) earned us
In order to find the estimated revenue from the test, I first calculated the increase in session-to-order conversion rate from the old landing page to the new landing page during the test itself (Jun19 - Jul 28). Here are the results:

![image](https://user-images.githubusercontent.com/113234853/194035650-042d3221-b0bb-4644-818e-787813e21d17.png)

As you can see, there is a 0.87% increase in conversion rate when switching from the old lander page to the new lander page. I then multiplied this value to the total number of sessions created since the end of the test to find the difference in order count:

![image](https://user-images.githubusercontent.com/113234853/194029901-1048a634-787a-442b-b45f-e80597158b3e.png)

As you can see, it was calculated that there were 200 additional orders since the end date of test (7/29) due to the new landing page. Since 4 Months have passed, roughly 50 extra orders per month due to new landing page.

*I am operating on the assumption that the session-to-order conversion rate for the new landing page remains unchanged since the test* 

#### For the landing page test you analyzed previously, it would be great to show a full conversion funnel from each of the two pages to orders. You can use the same time period you analyzed last time (Jun19 - Jul28)
##### Query Results
![image](https://user-images.githubusercontent.com/113234853/194036423-803a31ac-f233-4818-95f9-55a69d4daba4.png)

##### Visualization of conversion funnel (Original lander page)
![MYSQL q7 chart home](https://user-images.githubusercontent.com/113234853/194037805-dd621f0f-828e-40a5-ae6f-4f2df5a3ef2f.png)

##### Visualization of conversion funnel (New lander page)
![MYSQL qn 7 chart lander](https://user-images.githubusercontent.com/113234853/194037879-b5383c9c-8f19-41f7-ae70-fb31e017a566.png)
[View Tableau Public Details](https://public.tableau.com/app/profile/jun.keat/viz/AdvancedSQLProjectQn6/Chart6)

#### I'd love for you to quantify the impact of our billing test, as well. Please analyze the lift generated from the test (Sep10 - Nov10), in terms of revenue per billing page session, and then pull the number of billing page sessions for the past month to understand monthly impact.
The test administered was the implementation of a new billing page alongside the old billing page. Similarly to one of the previous questions, I first calculated the increase in revenue per billing page session during the test itself (Sep10 - Nov10). Here are the results:


![image](https://user-images.githubusercontent.com/113234853/194043795-80ebe812-0385-4d00-a894-b572dc9c1fb3.png)

It can be seen that the new billing page generated $8.51/billing page session more when compared to the old billing page. I then multiplied this value to the total number of sessions created since the last month to calculate the increase in revenue due to the new billing page:

![image](https://user-images.githubusercontent.com/113234853/194044050-f72c7844-7cc0-4630-b952-e746fadc792b.png)

As you can see, we have experienced an increase in revenue by $10152.43 over the last month due to the new billing page.
*I am operating under the assumption that revenue per billing page session remains constant after the test*

## Reflection and Challenges
This mid course project provided a variety of complex SQL query questions required many nestled queries for me to solve with the combined usage of the COUNT and CASE clauses. It proved slightly challenging to me but it was an interesting challenge for me to overcome in SQL. Additionally, the use of Tableau for visualisation is not required for the course but I wanted to apply what I have learnt from a previous course (which only covered the basics). Tableau proved to be the most challenging and time-consuming portion of the project and it is clear I need to brush up on my visualisation skill. Nonetheless, this project was an enlightening and fun experience for me to discover what I am lacking in data analytics.
