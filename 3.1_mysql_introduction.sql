-- show all data from user database
select * from mysql.user;

-- show user and host columns from user database
select user, host from mysql.user;

-- show all data from help topics database
select * from mysql.help_topic;

-- show help topic/category IDs and URLs for help topics from help topics database
select help_topic_id, help_category_id, url from mysql.help_topic;