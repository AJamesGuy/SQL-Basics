-- 1. How many users have 'travel' in their bio?
-- Type: Counting, filtering by string pattern
SELECT u.username, u.bio
FROM users u
WHERE u.bio LIKE '%travel%';

-- selects username and bio from users table where 'travel' appears in bio with anything before or after.
-- This returns two users (emma_brown and adam_johnson) with 'travel' in their bio

--2. How many posts were created between May 1st and May 10th, 2023?
-- Type: Counting, filtering by date range.
SELECT  *, COUNT(*) as total_count
FROM posts p
WHERE p.created_at BETWEEN '2023-05-01'
AND '2023-05-10'
GROUP BY p.id;

-- selects all data from posts table where the created_at date is between May 1st, 2023 and May 10th 2023.
-- This is grouped by posts id and returns 5 posts with 'posts' id from 54-58 inclusively

-- 3. What user has the most comments? (return the user_id)
-- Type: Aggregation, grouping, ordering, limiting
SELECT c.user_id, c.comment, COUNT(*) AS comment_count
FROM comments c
ORDER BY comment_count DESC
LIMIT 1;

-- This query selects the user_id and comment from the comments table and counts the rows. Alias comment_count is used.
-- The query returns the user_id of 2 with a total of 513 comments

--4. How many users have usernames that end with 'er'?
-- Type: Counting, filtering by string pattern.

SELECT u.username, COUNT(*)
FROM users u
WHERE u.username LIKE '%er'
GROUP BY u.username;

-- This query selects the username  from the users table and counts the rows.
-- The query then only returns usernames where they have 'er' with nothing after but anything before in the username
-- Four usernames are returned (edward_foster, frank_miller, june_spencer, and ulrich_weber)

-- 5. What post has the most comments? (return the post_id)
--Type: Aggregation, grouping, ordering, limiting.

SELECT c.post_id, c.comment, COUNT(*) as comment_count
FROM comments c 
ORDER BY comment_count DESC
LIMIT 1;

-- This query selects the post_id and comment columns from the comments table and counts the rows.
-- The query then orders the data by descending order (greatest on top, lowest on bottom) and limits the results to only the first post_id.
-- The query returns the post_id of 1 with a total of 513 comments


-- 6. How many different user IDs have posted content?
-- Type: Counting distinct values

SELECT COUNT(DISTINCT p.user_id)
FROM posts p;

-- This queries the distinct amount of user_id's that have posted content
-- The query returns a count of 42 users counted by id



-- 7. What user has the most people following them? (return the user_id)
-- Type: Aggregation, grouping, ordering, limiting.
SELECT f.followed_id as user_id
FROM following f
GROUP BY followed_id
ORDER BY COUNT(*) DESC
LIMIT 1; 

-- This queries the followers table and selects the followed_id with an alias of user_id
-- The query returns the user_id of 6

-- 8. From users who joined in February 2023, how many have usernames containing 'john'?
-- Type: Counting, filtering by date and string pattern
SELECT u.username, COUNT(*) as contains_john
FROM users u
WHERE u.created_at >= '2023-02-01'
AND u.created_at <= '2023-02-28' 
AND LOWER(u.username) LIKE '%john%';
-- This code queries all the usernames that contain 'john' and were created in february of 2023.
-- There were 5 users created in february and none of them contain 'john'. Therefore this query returns null.



-- 9. From users who joined in March 2023, how many have usernames containing 'mar'?
-- Type: Counting, filtering by date and string pattern.
SELECT COUNT(*) AS users_containing_mar
FROM users
WHERE created_at >= '2023-03-01'
AND created_at < '2023-04-01'
AND LOWER(username) LIKE '%mar%';

-- This query counts all the users containing 'mar' created in March 2023.
-- There were 4 users created in March but none of them contain 'mar'
-- This query returns 0 as the users_containing_mar

-- 10. What post has the most reactions? (return the post_id)
-- Type: Aggregation, grouping, ordering, limiting.
SELECT COUNT(post_id) as reaction_count
FROM reactions
GROUP BY post_id
ORDER BY reaction_count DESC
LIMIT 1;

-- This query counts the post_id in the reactions table with the most reactions
-- This query is not returning any rows from social_media.db
