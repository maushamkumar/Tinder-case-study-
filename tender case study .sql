use tinder;

create table users(
user_id int, 
name varchar(50), 
email varchar(100), 
password varchar(50));

insert into users values (1, 'Virat', 'virat@gmail.com', 'aigh32'), 
						(2, 'Anushka', 'anushka@gmail.com', 'anushka123'), 
                        (3, 'Modiji', 'modiji@gmail.com', 'modiji1234'), 
                        (4, 'pappu', 'pappu@gmail.com', 'pagitu94'), 
                        (5, 'Putin', 'putin@gmail.com', 'attack'), 
                        (6, 'Zelensky', 'Zelensky@gmail.com', 'defend'), 
                        (7, 'Hitman', 'rohit@gmail.com', 'vadapav'), 
                        (8, 'Dhinchack Pooja', 'pooja@gmail.com', 'itifghut'), 
                        (9, 'Mika', 'mika@gmail.com', 'coolpaji');
                        
select * from users;

create table right_swipe(
aashiqui_id int, 
romeo_id int, 
juliet_id int);

insert into right_swipe values(1, 1, 8), 
							(2, 3, 8), 
                            (3, 4, 8), 
                            (4, 9, 4), 
                            (5, 9, 1), 
                            (6, 9, 2), 
                            (7, 9, 3), 
                            (8, 9, 4), 
                            (9, 9, 5), 
                            (10, 9, 6), 
                            (11, 9, 7), 
                            (12, 1, 2), 
                            (13, 1, 2);
                            
insert into right_swipe values(14, 1, 7),
							(15, 7, 1), 
                            (16, 3, 4), 
                            (17, 4, 3);
                            
-- write a query to print the name and details of all the users to whom a particular user has sent request.
select name, email from right_swipe r join users u on r.juliet_id = u.user_id where r.romeo_id = 1;

select * from right_swipe r join users u on r.juliet_id = u.user_id where u.name = 'Virat';

select * from right_swipe r join users u on r.aashiqui_id = u.user_id where u.name = 'Virat';

-- write a query to find the name of the user who has sent 2nd most number of requests also print the count. 
select romeo_id, count(romeo_id) from right_swipe group by romeo_id;

select romeo_id, count(romeo_id) from right_swipe group by romeo_id order by count(romeo_id) desc limit 1,1;

SELECT romeo_id, name, total_swipes
FROM (
    SELECT romeo_id, u.name AS name, COUNT(romeo_id) AS total_swipes
    FROM right_swipe r
    JOIN users u ON r.romeo_id = u.user_id
    GROUP BY romeo_id, u.name
    ORDER BY COUNT(romeo_id) DESC
    LIMIT 1 OFFSET 1
) AS subquery;

-- find the name of the user who has received min number of request
SELECT romeo_id, name, total_swipes
FROM (
    SELECT romeo_id, u.name AS name, COUNT(romeo_id) AS total_swipes
    FROM right_swipe r
    JOIN users u ON r.romeo_id = u.user_id
    GROUP BY romeo_id, u.name
    ORDER BY COUNT(romeo_id) DESC
    LIMIT 1 OFFSET 3
) AS subquery;

-- find all the matches for a particular user 
select * from right_swipe r1 join right_swipe r2 on r1.romeo_id = r2.juliet_id
where r1.juliet_id = r2.romeo_id;


select r1.romeo_id, r1.juliet_id from right_swipe r1 join right_swipe r2 on r1.romeo_id = r2.juliet_id
where r1.juliet_id = r2.romeo_id;

select r1.romeo_id, r1.juliet_id from right_swipe r1 join right_swipe r2 on r1.romeo_id = r2.juliet_id
where r1.juliet_id = r2.romeo_id and (r1.romeo_id = 1 or r1.juliet_id=1);

select u1.name, u2.name from right_swipe r1 
join right_swipe r2 on r1.romeo_id = r2.juliet_id
join users u1 on r1.romeo_id = u1.user_id
join users u2 on r1.juliet_id = u2.user_id
where
r1.juliet_id = r2.romeo_id and (r1.romeo_id or r1.juliet_id =1);