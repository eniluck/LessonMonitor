IF DB_ID('HomeworkSQL4') IS NULL  
	CREATE DATABASE HomeworkSQL4;

USE HomeworkSQL4;

-- удаление таблиц
IF OBJECT_ID ('dbo.Questions', 'U') IS NOT NULL  
   DROP TABLE dbo.Questions;

IF OBJECT_ID ('dbo.TimeCodes', 'U') IS NOT NULL  
   DROP TABLE dbo.TimeCodes;

IF OBJECT_ID ('dbo.Lessons', 'U') IS NOT NULL  
   DROP TABLE dbo.Lessons; 

IF OBJECT_ID ('dbo.Members', 'U') IS NOT NULL  
   DROP TABLE dbo.Members;

-- Создание таблиц
CREATE TABLE dbo.Lessons (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Theme NVARCHAR(200) NULL,
	Title NVARCHAR(500) NULL,
	Description NVARCHAR(MAX) NULL
);

CREATE TABLE dbo.Members (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(500) NULL,
	GithubAccount NVARCHAR(500) NULL
);

CREATE TABLE dbo.TimeCodes (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	LessonID INT NOT NULL,
	MemberID INT NOT NULL,
	Title NVARCHAR(500) NULL,
	TIMESTAMP TIME NULL,
	CONSTRAINT [FK_TimeCode_Lessons] FOREIGN KEY (LessonID) REFERENCES Lessons(Id),
	CONSTRAINT [FK_TimeCode_Members] FOREIGN KEY (MemberID) REFERENCES Members(Id)
);

CREATE TABLE dbo.Questions (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	LessonID INT NOT NULL,
	MemberID INT NOT NULL,
	Title NVARCHAR(500) NULL,
	TIMESTAMP TIME NULL,
	CONSTRAINT [FK_Questions_Lessons] FOREIGN KEY (LessonID) REFERENCES Lessons(Id),
	CONSTRAINT [FK_Questions_Members] FOREIGN KEY (MemberID) REFERENCES Members(Id)
);

-- Вставка данных

insert into dbo.Lessons(Title,Theme,Description)
select N'T-SQL и DML, управляем данными','Sql',N'Всем привет, на этом занятии мы начнем рассматривать язык DML: SELECT, CREATE, UPDATE, DELETE. Если точнее научимся сохранять, изменять, удалять и читать данные :)

Домашка: https://github.com/cleannetcode/Lesso...

Таймкоды:
00:00:00 - Компилируем занятие
8:14 - проверка дз
58:07 -  разбираем команды dml
1:02:30 -  SELECT
1:14:30 - INSERT
1:32:45 - перерыв
1:36:47 - продолжение
1:38:00 - UPDATE
1:42:55 - еще про SELECT и %LIKE%
1:52:00 - BETWEEN
1:56:26 -  ORDER BY
1:59:15 - COUNT, TOP (SUM, AVG)
2:02:20 - GROUP BY (DISTINCT)
2:11:45 - IN
2:18:00 - JOIN
2:22:06 - реализуем INNER JOIN
2:36:30 - LEFT JOIN
2:38:30 - реализуем LEFT JOIN
2:50:25 - CROSS JOIN
2:57:20 - домашка

Это третье занятие курса в котором мы разбираемся с работой в базами данных. Занятия подойдут для тех, кто уже знаком с основами C# и хочет улучшить свои навыки разработки программ. После занятия как обычно обсудим вопросы :)

Ссылки:
https://www.donationalerts.com/r/roma... - на случай если вы вдруг захотите поддержать меня ;)
https://t.me/joinchat/ETnMMXnhJng4YmJi - наш чат в телеге :)
https://s.itbeard.com/discord - дискорд сервер, где мы существуем. Если хочется пообщаться, выбирай роль "Адепт C#" и у тебя появится наш чат c-sharp
https://www.figma.com/file/U7B9VO8IRr... - тут диаграммы и краткое описание всех прошедших лекций.
https://youtu.be/xC866Xnx6pM - обсуждение

Всем спасибо и давайте вместе учиться писать код на C# :)

#csharp #ityoutubersru'
union all
select N'Что такое middleware и как с ним работать?','C#',N'Всем привет, на этом занятии мы немного повторим все что изучили на данный момент про asp.net core. Начнем разбирать устройство middleware. Расмотрим как реализовать свой компонент middleware. Также рассмотрим выполненые домашние работы. После занятия как обычно обсудим вопросы :)

Домашка: https://github.com/cleannetcode/Lesso...

Таймкоды:
00:00:00 - Всем привет
1:10 Команды чата и правила занятий.
5:20 Тема занятия.
6:43 Рассматриваем домашку.
40:36 Разбираемся с middleware.
1:36:18 Потоки.
2:00:42 Пример кода работы с потоками.
2:21:18 Какой то закон по работе с потоками.
2:29:57 Домашка

Это третье занятие курса в котором я помогаю вам освоить разработку ASP.NET Core API приложений. Занятия подойдут для тех, кто уже знаком с основами C#. 

Ссылки:
https://www.donationalerts.com/r/roma... - на случай если вы вдруг захотите поддержать меня ;)
https://t.me/joinchat/ETnMMXnhJng4YmJi - наш чат в телеге :)
https://s.itbeard.com/discord - дискорд сервер, где мы существуем. Если хочется пообщаться, выбирай роль "Адепт C#" и у тебя появится наш чат c-sharp
https://www.figma.com/file/U7B9VO8IRr... - тут диаграммы и краткое описание всех прошедших лекций.
Запись обсуждений: https://youtu.be/3jLX4pCfoIU

Всем спасибо и давайте вместе учиться писать код на C# :)

Music by Chillhop Music: https://chillhop.ffm.to/creatorcred

#csharp #ityoutubersru'
union all
select N'Знакомимся с t-sql и создаем схему БД','Sql',N'Всем привет, на этом занятии мы начнем изучать язык t-sql. Посмотрим что такое DDL, как строится схема базы данных.
увидим что такое: CREATE, ALTER, DROP для таблиц и колонок

Домашка: 
https://github.com/cleannetcode/Lesso...

Таймкоды:
00:00:00 - Компилируем занятие
00:03:00 - Начинаем занятие, немного о планах
00:05:08 - Правила занятия
00:09:50 - Проверяю несколько случайных ДЗ 
00:38:37 - Начинаем рассматривать T-SQL (DDL)
01:02:20 - Создаем таблицы в БД
01:28:16 - Уникальные ключи в таблицах
01:39:15 - Какие виды связей бывают
01:55:10 - Настраиваем виды связей
02:31:10 - Домашка

Это второе занятие курса в котором мы разбираемся с работой в базами данных. Занятия подойдут для тех, кто уже знаком с основами C# и хочет улучшить свои навыки разработки программ. 

Ссылки:
https://www.donationalerts.com/r/roma... - на случай если вы вдруг захотите поддержать меня ;)
https://t.me/joinchat/ETnMMXnhJng4YmJi - наш чат в телеге :)
https://s.itbeard.com/discord - дискорд сервер, где мы существуем. Если хочется пообщаться, выбирай роль "Адепт C#" и у тебя появится наш чат c-sharp
https://www.figma.com/file/U7B9VO8IRr... - тут диаграммы и краткое описание всех прошедших лекций.
https://youtu.be/f3RbASZPBEE - запись обсуждений

Всем спасибо и давайте вместе учиться писать код на C# :)

#csharp #ityoutubersru'
union all
select N'Для чего нужна нормализация базы данных','Sql',N'Всем привет, на этом занятии мы разберем что такое нормализация базы данных. Попробуем привести схему БД к нормальной форме. Начнем рассматривать язык DML: SELECT, CREATE, UPDATE, DELETE

Домашка: 

Таймкоды:
00:00:00 - Компилируем занятие

Это третье занятие курса в котором мы разбираемся с работой в базами данных. Занятия подойдут для тех, кто уже знаком с основами C# и хочет улучшить свои навыки разработки программ. После занятия как обычно обсудим вопросы :)

Ссылки:
https://www.donationalerts.com/r/roma... - на случай если вы вдруг захотите поддержать меня ;)
https://t.me/joinchat/ETnMMXnhJng4YmJi - наш чат в телеге :)
https://s.itbeard.com/discord - дискорд сервер, где мы существуем. Если хочется пообщаться, выбирай роль "Адепт C#" и у тебя появится наш чат c-sharp
https://www.figma.com/file/U7B9VO8IRr... - тут диаграммы и краткое описание всех прошедших лекций.
https://youtu.be/xuIiPcMzILg - запись обсуждения

Всем спасибо и давайте вместе учиться писать код на C# :)

#csharp #ityoutubersru'
