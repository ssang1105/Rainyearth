# create table UserConnection (
#    userId varchar(255) not null,
#  	providerId varchar(255) not null,
#  	providerUserId varchar(255),
#  	rank int not null,
#  	displayName varchar(255),
#  	profileUrl varchar(512),
#  	imageUrl varchar(512),
#  	accessToken varchar(512) not null,
#  	secret varchar(512),
#  	refreshToken varchar(512),
#  	expireTime bigint,
#  	primary key (userId, providerId, providerUserId));
# create unique index UserConnectionRank on UserConnection(userId, providerId, rank);


-- create table user (
--     userid varchar(100),
--     password varchar(100),
--     username varchar(100),
--     email varchar(100),
--
--     profileUrl varchar(512),
-- 		imageUrl varchar(512),
-- -- 		accessToken varchar(512) not null,
-- 		secret varchar(512),
-- 		refreshToken varchar(512),
-- 		expireTime bigint
-- );
-- insert into user values ('test','1234','테스트','test@test.com');
-- insert into user(name, age) values ('woniper1', 26);
-- insert into user(name, age) values ('woniper2', 27);

