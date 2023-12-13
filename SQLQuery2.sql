drop database Assesment05Db
create database Assessment05

use Assessment05

create schema bank

create table bank.Customer
(CId int primary key identity(1000,1),
CName nvarchar(50) not null,
CEmail nvarchar(50) unique,
Contact nvarchar(10) unique,
Cpwd as substring(CName,Len(CName)-1,2)+cast(CId as nvarchar(max))+substring(contact,1,2) persisted
)

create table bank.MailInfo
(
CEmail nvarchar(50),
MailDate datetime default GetDate(),
MailMessage nvarchar(100),
)

--drop table bank.Customer
--drop table bank.MailInfo

select * from bank.Customer
select * from bank.MailInfo

create trigger bank.trgMailToCust
on bank.Customer
after insert
as
declare @name nvarchar(50)
declare @email nvarchar(50)
declare @contact nvarchar(50)
select @name=CName from inserted 
select @email=CEmail from inserted 
select @contact=Contact from inserted 
insert into bank.MailInfo(CEmail,MailDate,MailMessage)
values(@email,getdate(),'Your NetBanking Password is CPWD It is valid upto 2 days only.Update it')
print 'Record Inserted & Action captured in MailInfo Table'


alter trigger bank.trgMailToCust
on bank.Customer
after insert
as
declare @name nvarchar(50)
declare @email nvarchar(50)
declare @contact nvarchar(50)
select @name=CName from inserted 
select @email=CEmail from inserted 
select @contact=Contact from inserted 
insert into bank.MailInfo(CEmail,MailDate,MailMessage)
values(@email,getdate(),'Your NetBanking Password is CPWD It is valid upto 2 days only.Update it')
print 'Record Inserted & Action captured in MailInfo Table'


select * from bank.Customer
select * from bank.MailInfo

insert into bank.Customer(CName,CEmail,Contact) values ('Deep','Deep@gmail.com',1234567890)
insert into bank.Customer(CName,CEmail,Contact) values ('Zoro','Zoro@gmail.com',9988776656)
insert into bank.Customer(CName,CEmail,Contact) values ('Luffy','Luffy@gmail.com',9988776655)



--delete from bank.Customer
--delete from bank.MailInfo