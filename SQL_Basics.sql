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



