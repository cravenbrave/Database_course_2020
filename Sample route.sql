show variables like '%log_bin%';
show variables like 'secure%';

select user, host into outfile '/Users/liuwenyi/CSE3241Repo/user1.txt' from mysql.user;
select user, host into outfile '/Users/liuwenyi/CSE3241Repo/user2.txt' from mysql.user;

