USE pe09;

-- 1. Query of all the records of the STRONG entity 
 SELECT * FROM tweet;

-- 2. Query of all the records of the WEAK entity
SELECT * FROM MENTION;

-- 3. Query of selective data from BOTH the STRONG entity & WEAK entity 
-- all mentions of all tweets that have the word "Ali" or "Sara" in them

SELECT tweet.TWEET_ID, mention.MENTION_ID, tweet.TWEET_TEXT, tweet.TWEET_DATE, mention.MENTION_TEXT FROM mention
    join tweet USING(TWEET_ID)
    WHERE tweet.TWEET_TEXT LIKE '%Ali%' OR tweet.TWEET_TEXT LIKE '%Sara%';