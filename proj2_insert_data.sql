INSERT INTO account VALUES (1, 'nam.hoang@columbia.edu', 'Nam', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (3, 'abhijit@columbia.edu', 'Abhijit', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (4, 'ayush@columbia.edu', 'Ayush', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (5, 'jincheng@columbia.edu', 'Jincheng', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (6, 'mengquing@columbia.edu', 'Mengquing', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (7, 'sania@columbia.edu', 'Sania', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (8, 'eugene@columbia.edu', 'Eugene', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (9, 'namhoang1909@gmail.com', 'Nam', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (10, 'abc@gmail.com', 'Abc', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (2, 'tz2278@columbia.edu', 'Tianci', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (11, 'abc@edf.com', 'Nam', 'pbkdf2:sha1:1000$dEx9YNH0$04d58d58e97adf1b0cf1de08643105523090d7ff');

INSERT INTO list VALUES (1, 1, 'Work');
INSERT INTO list VALUES (3, 3, 'DB proj1part2');
INSERT INTO list VALUES (4, 4, 'DB hw0');
INSERT INTO list VALUES (6, 6, 'Things to do before you die');
INSERT INTO list VALUES (7, 7, 'Personal');
INSERT INTO list VALUES (8, 8, 'abc def');
INSERT INTO list VALUES (10, 1, 'oaskfd pj ijfei');
INSERT INTO list VALUES (11, 9, 'Study');
INSERT INTO list VALUES (12, 9, 'test1');
INSERT INTO list VALUES (13, 1, 'hehe');
INSERT INTO list VALUES (14, 1, 'test2');
INSERT INTO list VALUES (15, 1, 'test3');
INSERT INTO list VALUES (16, 1, 'another test');
INSERT INTO list VALUES (17, 1, 'another test');
INSERT INTO list VALUES (18, 1, 'realtest');
INSERT INTO list VALUES (20, 11, 'Project 1');
INSERT INTO list VALUES (21, 11, 'Project 2');
INSERT INTO list VALUES (22, 2, 'Project1Part2');

INSERT INTO accessible_user VALUES (1, 6, false);
INSERT INTO accessible_user VALUES (3, 4, false);
INSERT INTO accessible_user VALUES (4, 4, false);
INSERT INTO accessible_user VALUES (5, 4, false);
INSERT INTO accessible_user VALUES (1, 4, false);
INSERT INTO accessible_user VALUES (2, 6, false);
INSERT INTO accessible_user VALUES (4, 10, false);
INSERT INTO accessible_user VALUES (9, 1, false);
INSERT INTO accessible_user VALUES (10, 6, false);
INSERT INTO accessible_user VALUES (8, 6, true);
INSERT INTO accessible_user VALUES (10, 1, false);
INSERT INTO accessible_user VALUES (2, 3, false);
INSERT INTO accessible_user VALUES (1, 10, true);
INSERT INTO accessible_user VALUES (3, 8, true);
INSERT INTO accessible_user VALUES (4, 8, true);
INSERT INTO accessible_user VALUES (5, 7, true);
INSERT INTO accessible_user VALUES (6, 6, true);
INSERT INTO accessible_user VALUES (2, 4, true);
INSERT INTO accessible_user VALUES (6, 3, true);
INSERT INTO accessible_user VALUES (8, 1, true);
INSERT INTO accessible_user VALUES (1, 18, true);
INSERT INTO accessible_user VALUES (2, 10, false);
INSERT INTO accessible_user VALUES (11, 20, true);
INSERT INTO accessible_user VALUES (2, 20, false);
INSERT INTO accessible_user VALUES (11, 21, true);
INSERT INTO accessible_user VALUES (2, 22, true);
INSERT INTO accessible_user VALUES (11, 22, true);

INSERT INTO task VALUES (1, '{"due": "2016-01-01 12:00:00"}', 'new start of the year',NULL, 1, 10, false, NULL);
INSERT INTO task VALUES (3, '{"due": "2015-12-01 22:00:00"}', 'task for list 8',NULL, 3, 8, false, NULL);
INSERT INTO task VALUES (5, '{"due": "2017-12-01 22:00:00"}', 'task for list 7',NULL, 5, 7, false, NULL);
INSERT INTO task VALUES (6, '{"due": "2016-12-08 12:00:00"}', 'task for list 6',8, 6, 6, false, NULL);
INSERT INTO task VALUES (9, '{"due": "2016-12-08 12:00:00", "description": "blah blah blah"}', 'task for list 3', 2, 6, 3, false, NULL);
INSERT INTO task VALUES (8, '{"due": "2015-01-01 12:00:00", "description": "just trying to generate random data"}', 'complete task for 4', 3, 2, 4, true, '2014-10-30 11:30:00');
INSERT INTO task VALUES (19, NULL, 'meeting with Mengquing!!!', NULL, 1, 18, false, NULL);
INSERT INTO task VALUES (21, NULL, 'new task', NULL, 11, 20, false, NULL);

INSERT INTO checklist VALUES (1, true, 'under task 1', 1);
INSERT INTO checklist VALUES (3, false, 'under task 3', 3);
INSERT INTO checklist VALUES (5, false, 'under task 5', 5);
INSERT INTO checklist VALUES (6, true, 'under task 6', 6);
INSERT INTO checklist VALUES (8, true, 'under task 8', 8);
INSERT INTO checklist VALUES (9, true, 'under task 9', 9);

INSERT INTO comment VALUES (3, '2014-01-02 12:05:02', 'ijhi', 4, 2);
INSERT INTO comment VALUES (4, '2014-05-02 02:02:32', 'hello?', 1, 9);
INSERT INTO comment VALUES (5, '2014-11-02 08:08:28', 'test', 4, 3);
INSERT INTO comment VALUES (6, '2014-01-02 03:02:32', 'pig', 6, 8);
INSERT INTO comment VALUES (7, '2014-11-02 05:01:07', 'dog', 6, 8);
INSERT INTO comment VALUES (8, '2014-02-02 02:09:46', 'cat', 6, 6);
INSERT INTO comment VALUES (9, '2014-04-02 03:03:09', 'tiger', 6, 10);
INSERT INTO comment VALUES (10, '2015-01-02 02:05:02', 'fish', 6, 10);
INSERT INTO comment VALUES (15, '2015-11-17 23:47:41', 'testttt', 4, 1);
INSERT INTO comment VALUES (16, '2015-11-18 16:28:54', 'hey\r\n', 20, 11);

INSERT INTO label VALUES (1, '{"name": "important", "color": "yellow"}', 1);
INSERT INTO label VALUES (3, '{"name": "second propriety", "color": "orange"}', 1);
INSERT INTO label VALUES (4, '{"name": "second propriety", "color": "orange"}', 3);
INSERT INTO label VALUES (5, '{"name": "least", "color": "white"}', 4);
INSERT INTO label VALUES (7, '{"name": "least", "color": "white"}', 6);
INSERT INTO label VALUES (8, '{"name": "important", "color": "red"}', 7);
INSERT INTO label VALUES (9, '{"name": "important", "color": "red"}', 8);
INSERT INTO label VALUES (11, '{"name": "important", "color": "red"}', 10);
INSERT INTO label VALUES (12, '{"name": "test"}', 1);
INSERT INTO label VALUES (13, '{"name": "test"}', 1);
INSERT INTO label VALUES (20, '{"name": "important", "color": "red"}', 18);
INSERT INTO label VALUES (22, '{"name": "Important", "color": "red"}', 20);
INSERT INTO label VALUES (23, '{"name": "part3", "color": "blue"}', 20);

INSERT INTO label_task VALUES (1, 1);
INSERT INTO label_task VALUES (1, 11);
INSERT INTO label_task VALUES (3, 3);
INSERT INTO label_task VALUES (5, 5);
INSERT INTO label_task VALUES (8, 8);
INSERT INTO label_task VALUES (9, 9);
INSERT INTO label_task VALUES (19, 20);
INSERT INTO label_task VALUES (21, 22);





