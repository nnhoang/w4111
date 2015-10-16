-- template
-- INSERT INTO VALUES (1);
-- INSERT INTO VALUES (2);
-- INSERT INTO VALUES (3);
-- INSERT INTO VALUES (4);
-- INSERT INTO VALUES (5);
-- INSERT INTO VALUES (6);
-- INSERT INTO VALUES (7);
-- INSERT INTO VALUES (8);
-- INSERT INTO VALUES (9);
-- INSERT INTO VALUES (10);

-- account
INSERT INTO account VALUES (1, 'nam.hoang@columbia.edu', 'Nam');
INSERT INTO account VALUES (2, 'tz2278@columbia.edu', 'Tianci');
INSERT INTO account VALUES (3, 'abhijit@columbia.edu', 'Abhijit');
INSERT INTO account VALUES (4, 'ayush@columbia.edu', 'Ayush');
INSERT INTO account VALUES (5, 'jincheng@columbia.edu', 'Jincheng');
INSERT INTO account VALUES (6, 'mengquing@columbia.edu', 'Mengquing');
INSERT INTO account VALUES (7, 'sania@columbia.edu', 'Sania');
INSERT INTO account VALUES (8, 'eugene@columbia.edu', 'Eugene');
INSERT INTO account VALUES (9, 'namhoang1909@gmail.com', 'Nam');
INSERT INTO account VALUES (10, 'abc@gmail.com', 'Abc');

-- list
INSERT INTO list VALUES (1, 1, 'Work');
INSERT INTO list VALUES (2, 2, 'DB proj1part1');
INSERT INTO list VALUES (3, 3, 'DB proj1part2');
INSERT INTO list VALUES (4, 4, 'DB hw0');
INSERT INTO list VALUES (5, 5, 'DB hw1');
INSERT INTO list VALUES (6, 6, 'Things to do before you die');
INSERT INTO list VALUES (7, 7, 'Personal');
INSERT INTO list VALUES (8, 8, 'abc def');
INSERT INTO list VALUES (9, 9, 'ajije aksjfi ');
INSERT INTO list VALUES (10, 1, 'oaskfd pj ijfei');

-- accessible_user
INSERT INTO accessible_user VALUES (1, 6, FALSE);
INSERT INTO accessible_user VALUES (2, 2, FALSE);
INSERT INTO accessible_user VALUES (3, 4, FALSE);
INSERT INTO accessible_user VALUES (4, 4, FALSE);
INSERT INTO accessible_user VALUES (5, 4, FALSE);
INSERT INTO accessible_user VALUES (6, 5, FALSE);
INSERT INTO accessible_user VALUES (1, 4, FALSE);
INSERT INTO accessible_user VALUES (2, 6, FALSE);
INSERT INTO accessible_user VALUES (3, 2, FALSE);
INSERT INTO accessible_user VALUES (4, 10, FALSE);
INSERT INTO accessible_user VALUES (1, 5, FALSE);
INSERT INTO accessible_user VALUES (9, 1, FALSE);
INSERT INTO accessible_user VALUES (10, 6, FALSE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (6, 8, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (5, 2, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (4, 3, FALSE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (2, 1, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (1, 10, FALSE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (10, 1, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (9, 2, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (8, 3, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (8, 4, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (7, 5, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (6, 6, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (5, 6, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (4, 2, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (3, 6, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (2, 7, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (1, 8, TRUE);

-- comment
INSERT INTO comment VALUES (1, '2014-09-02 12:05:22', 'hamster', 2, 3);
INSERT INTO comment VALUES (2, '2014-12-02 1:05:56', 'I love this class', 5, 1);
INSERT INTO comment VALUES (3, '2014-01-02 12:05:02', 'ijhi', 4, 2);
INSERT INTO comment VALUES (4, '2014-05-02 2:02:32', 'hello?', 1, 9);
INSERT INTO comment VALUES (5, '2014-11-02 8:08:28', 'test', 4, 3);
INSERT INTO comment VALUES (6, '2014-01-02 3:02:32', 'pig', 6, 8);
INSERT INTO comment VALUES (7, '2014-11-02 5:01:07', 'dog', 6, 8);
INSERT INTO comment VALUES (8, '2014-02-02 2:09:46', 'cat', 6, 6);
INSERT INTO comment VALUES (9, '2014-04-02 3:03:09', 'tiger', 6, 10);
INSERT INTO comment VALUES (10, '2015-01-02 2:05:02', 'fish', 6, 10);

-- task
INSERT INTO task(tid, due, name, list_id, last_editor) VALUES (1, '2016-01-01 12:00:00', 'new start of the year', 10, 1);
INSERT INTO task(tid, due, description, name, status, since,list_id, last_editor) VALUES (2, '2015-01-01 12:00:00', 'just trying to generate random data','year 2015', TRUE, '2014-12-30 11:30:00',9, 2);
INSERT INTO task(tid, due, name, list_id, last_editor) VALUES (3, '2015-12-01 22:00:00', 'task for list 8', 8, 3);
INSERT INTO task(tid, due, description, name, status, since,list_id,last_editor) VALUES (4, '2016-01-01 12:00:00', 'inset complete','complete task in 2015', TRUE, '2015-10-16 14:30:00',8, 4);
INSERT INTO task(tid, due, name, list_id, last_editor) VALUES (5, '2017-12-01 22:00:00', 'task for list 7', 7, 5);
INSERT INTO task(tid, due, name, list_id, last_editor, assigned_to) VALUES (6, '2016-12-08 12:00:00', 'task for list 6', 6, 6, 8);
INSERT INTO task(tid, due, name, list_id, last_editor, assigned_to) VALUES (7, '2016-12-08 12:00:00', 'task for list 5', 5, 6, 2);
INSERT INTO task(tid, due, description, name,  status, since,list_id, last_editor, assigned_to) VALUES (8, '2015-01-01 12:00:00', 'just trying to generate random data','complete task for 4', TRUE, '2014-10-30 11:30:00',4, 2, 3);
INSERT INTO task(tid, due, name, description, list_id, last_editor, assigned_to) VALUES (9, '2016-12-08 12:00:00', 'task for list 3','blah blah blah', 3, 6, 2);
INSERT INTO task(tid, due, name, description, list_id,  last_editor, assigned_to) VALUES (10, '2016-12-08 12:00:00', 'task for list 2', 'hello world again', 2, 7, 1);
INSERT INTO task(tid, due, name, description, list_id, last_editor, assigned_to) VALUES (11, '2016-12-08 12:00:00', 'task for list 1','hello world', 1, 8, 10);


