# A_Funny_Pl_Name
# A_Funny_Pl_Name

**Database Development with PL/SQL (INSY 8311) – Assignment II**  

*Created by*: Ibambasi Ganza Pierre Davy 26427

*Created by*: Rusibana Jean Paul 26473

*concentration*: software engineering 
1. Creating table and inserting data
   ![Alt text](create.jpg)

   here we created and inserted data into a table using normal sql queries

2.Compare Values with Previous or Next Records
![Alt text](comparevalues.jpg)

We used LAG() and LEAD() to access the previous and next scores for each student based on the test date.

This helps track score trends over time — useful in real-life for progress reports or identifying performance drops.

The CASE expression converts the comparison into words like HIGHER, LOWER, or EQUAL.

3. RANK() vs DENSE_RANK()
   ![Alt text](rankvdrank.jpg)

    We used RANK() and DENSE_RANK() to rank students by their score within each class.

The difference is:

RANK() skips numbers if there's a tie (e.g., 1, 1, 3)

DENSE_RANK() does not skip (e.g., 1, 1, 2)

🔍 Real-life application: Useful in sports ranking, academic results, leaderboards — anywhere categories and ties matter.
   

4. Fetch the Top 3 Records from Each Category

![Alt text](fetchtop.jpg)

In this query, we retrieved the top 3 students from each class based on their scores.

We used RANK() to assign ranks based on scores in descending order.

Only the top 3 ranked students were selected.

Real-life application: This is useful for leaderboards, where we want to highlight top performers.

5.Retrieve the First 2 Records from Each Category Based on Date

![Alt text](retreive.jpg)

In this query, we retrieved the first 2 records from each class based on the test_date.

We used the ROW_NUMBER() window function to assign a unique row number to each student within each class, ordered by the test_date.

The first 2 records per class are selected by filtering for ROW_NUMBER() <= 2.

Real-life application: This is useful for finding the earliest entries, such as the first students to register for a class or the first sales made in a store.

6.Aggregation with Window Functions
![Alt text](aggregation.jpg)

In this query, we calculated the maximum score in each class as well as the overall maximum score:

We used MAX() with PARTITION BY to get the maximum score within each class.

We also computed the overall maximum score by using MAX() without partitioning.

Real-life application: This type of analysis helps in understanding how well each category is performing compared to the overall performance. For instance, it could be used to see the best scores in a class or compare them to the highest score across all classes.
