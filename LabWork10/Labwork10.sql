--1/1
CREATE LOGIN [ispp3511] WITH PASSWORD='3511', 
DEFAULT_DATABASE=[ispp3511], --бд по умолчанию
DEFAULT_LANGUAGE=[русский], --язык
CHECK_EXPIRATION=OFF, --применение политики истечения срока действия 
CHECK_POLICY=OFF --требование к паролю 

--1/2
CREATE LOGIN ispp3511 WITH PASSWORD = 'Passw0rd!' ;
ALTER LOGIN ispp3511 WITH CHECK_EXPIRATION = OFF;
ALTER LOGIN ispp3511 WITH CHECK_POLICY=OFF;
EXEC sp_addlogin 'isppLogin3511', 'Password!';

EXEC sp_addsrvrolemember 'ispp3511', 'securityadmin';

-- sp_adduser
EXEC sp_adduser 'login1', 'user1';
EXEC sp_adduser 'login2', 'user2';

-- CREATE USER
CREATE USER user3
FOR LOGIN login3

CREATE USER user4
FOR LOGIN login4


-- Task 3

EXEC sp_addrolemember 'db_owner', 'user1';

EXEC sp_addrolemember 'db_datareader ', 'user2';
EXEC sp_addrolemember 'db_denydatareader ', 'user2';

GRANT DELETE, INSERT
ON Ticket
TO user3;

GRANT READTEXT [Name, Email]
ON Visitor
TO user4;

