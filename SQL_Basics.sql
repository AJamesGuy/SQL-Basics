-- 1. How many users have 'travel' in their bio?
-- Type: Counting, filtering by string pattern
SELECT u.bio
FROM users u
WHERE u.bio LIKE '%travel%';

--2. How many posts were created between May 1st and May 10th, 2023?
-- Type: Counting, filtering by date range.
SELECT  u.username, u.created_at, COUNT(*) as total_count
FROM users u
WHERE u.created_at BETWEEN '2023-05-01'
AND '2023-05-10'
GROUP BY u.username;

-- 3. What user has the most comments? (return the user_id)
-- Type: Aggregation, grouping, ordering, limiting
SELECT users.id, COUNT(*) AS comment_count
FROM comments
JOIN users ON comments.user_id = users.id
GROUP BY  users.id, users.username
ORDER BY comment_count DESC
LIMIT 1;

--4. How many users have usernames that end with 'er'?
-- Type: Counting, filtering by string pattern.

SELECT u.username, COUNT(*)
FROM users u
WHERE u.username LIKE '%er'
GROUP BY u.username;


-- 5. What post has the most comments? (return the post_id)
--Type: Aggregation, grouping, ordering, limiting.

SELECT p.id, p.caption, COUNT(*) as comment_count
FROM posts p 
JOIN comments ON comments.post_id = p.id
GROUP BY p.id, p.caption
ORDER BY comment_count DESC
LIMIT 1;


-- 6. How many different user IDs have posted content?
-- Type: Counting distinct values

SELECT COUNT(DISTINCT user_id) as posting_users
FROM posts;

-- 7. What user has the most people following them? (return the user_id)
-- Type: Aggregation, grouping, ordering, limiting.
SELECT u.id as user_id, u.username, COUNT(*) as follower_count
FROM following f
JOIN users u ON f.followed_id = u.id
GROUP BY f.followed_id, u.id, u.username
ORDER BY follower_count DESC
LIMIT 1;

-- 8. From users who joined in February 2023, how many have usernames containing 'john'?
-- Type: Counting, filtering by date and string pattern
SELECT u.username, u.created_at, COUNT(*) as contains_john
FROM users u
WHERE u.created_at BETWEEN '2023-02-01' AND '2023-02-28' AND u.username LIKE '%john%'
GROUP BY u.username;

-- 9. From users who joined in March 2023, how many have usernames containing 'mar'?
-- Type: Counting, filtering by date and string pattern.
SELECT u.username, u.created_at, COUNT(*) as users_containing_mar
FROM users u
WHERE u.created_at 
BETWEEN '2023-03-01' AND '2023-03-31' 
AND u.username LIKE '%mar%';

-- 10. What post has the most reactions? (return the post_id)
-- Type: Aggregation, grouping, ordering, limiting.
SELECT post_id, COUNT(*) as reaction_count
FROM reactions
GROUP BY post_id
ORDER BY reaction_count DESC
LIMIT 1;