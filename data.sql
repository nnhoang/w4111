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
INSERT INTO account VALUES (default, 'nam.hoang@columbia.edu', 'Nam', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'tz2278@columbia.edu', 'Tianci', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'abhijit@columbia.edu', 'Abhijit', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'ayush@columbia.edu', 'Ayush', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'jincheng@columbia.edu', 'Jincheng', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'mengquing@columbia.edu', 'Mengquing', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'sania@columbia.edu', 'Sania', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'eugene@columbia.edu', 'Eugene', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'namhoang1909@gmail.com', 'Nam', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');
INSERT INTO account VALUES (default, 'abc@gmail.com', 'Abc', 'pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b');

-- list
INSERT INTO list VALUES (default, 1, 'Work');
INSERT INTO list VALUES (default, 2, 'DB proj1part1');
INSERT INTO list VALUES (default, 3, 'DB proj1part2');
INSERT INTO list VALUES (default, 4, 'DB hw0');
INSERT INTO list VALUES (default, 5, 'DB hw1');
INSERT INTO list VALUES (default, 6, 'Things to do before you die');
INSERT INTO list VALUES (default, 7, 'Personal');
INSERT INTO list VALUES (default, 8, 'abc def');
INSERT INTO list VALUES (default, 9, 'ajije aksjfi ');
INSERT INTO list VALUES (default, 1, 'oaskfd pj ijfei');

-- accessible_user
INSERT INTO accessible_user VALUES (1, 6, FALSE);
INSERT INTO accessible_user VALUES (2, 2, FALSE);
INSERT INTO accessible_user VALUES (3, 4, FALSE);
INSERT INTO accessible_user VALUES (4, 4, FALSE);
INSERT INTO accessible_user VALUES (5, 4, FALSE);
INSERT INTO accessible_user VALUES (1, 4, FALSE);
INSERT INTO accessible_user VALUES (2, 6, FALSE);
INSERT INTO accessible_user VALUES (3, 2, FALSE);
INSERT INTO accessible_user VALUES (4, 10, FALSE);
INSERT INTO accessible_user VALUES (1, 5, FALSE);
INSERT INTO accessible_user VALUES (9, 1, FALSE);
INSERT INTO accessible_user VALUES (10, 6, FALSE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (6, 8, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (5, 2, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (2, 1, TRUE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (1, 10, FALSE);
INSERT INTO accessible_user(list_id, account_id, type) VALUES (3, 2, FALSE);
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
INSERT INTO comment VALUES (default, '2014-09-02 12:05:22', 'hamster', 2, 3);
INSERT INTO comment VALUES (default, '2014-12-02 1:05:56', 'I love this class', 5, 1);
INSERT INTO comment VALUES (default, '2014-01-02 12:05:02', 'ijhi', 4, 2);
INSERT INTO comment VALUES (default, '2014-05-02 2:02:32', 'hello?', 1, 9);
INSERT INTO comment VALUES (default, '2014-11-02 8:08:28', 'test', 4, 3);
INSERT INTO comment VALUES (default, '2014-01-02 3:02:32', 'pig', 6, 8);
INSERT INTO comment VALUES (default, '2014-11-02 5:01:07', 'dog', 6, 8);
INSERT INTO comment VALUES (default, '2014-02-02 2:09:46', 'cat', 6, 6);
INSERT INTO comment VALUES (default, '2014-04-02 3:03:09', 'tiger', 6, 10);
INSERT INTO comment VALUES (default, '2015-01-02 2:05:02', 'fish', 6, 10);

-- task
INSERT INTO task(tid, due, name, list_id, last_editor) VALUES (default, '2016-01-01 12:00:00', 'new start of the year', 10, 1);
INSERT INTO task(tid, due, description, name, status, when_completed,list_id, last_editor) VALUES (default, '2015-01-01 12:00:00', 'just trying to generate random data','year 2015', TRUE, '2014-12-30 11:30:00',9, 2);
INSERT INTO task(tid, due, name, list_id, last_editor) VALUES (default, '2015-12-01 22:00:00', 'task for list 8', 8, 3);
INSERT INTO task(tid, due, description, name, status, when_completed,list_id,last_editor) VALUES (default, '2016-01-01 12:00:00', 'inset complete','complete task in 2015', TRUE, '2015-10-16 14:30:00',8, 4);
INSERT INTO task(tid, due, name, list_id, last_editor) VALUES (default, '2017-12-01 22:00:00', 'task for list 7', 7, 5);
INSERT INTO task(tid, due, name, list_id, last_editor, assigned_to) VALUES (default, '2016-12-08 12:00:00', 'task for list 6', 6, 6, 8);
INSERT INTO task(tid, due, name, list_id, last_editor, assigned_to) VALUES (default, '2016-12-08 12:00:00', 'task for list 5', 5, 6, 2);
INSERT INTO task(tid, due, description, name,  status, when_completed,list_id, last_editor, assigned_to) VALUES (default, '2015-01-01 12:00:00', 'just trying to generate random data','complete task for 4', TRUE, '2014-10-30 11:30:00',4, 2, 3);
INSERT INTO task(tid, due, name, description, list_id, last_editor, assigned_to) VALUES (default, '2016-12-08 12:00:00', 'task for list 3','blah blah blah', 3, 6, 2);
INSERT INTO task(tid, due, name, description, list_id,  last_editor, assigned_to) VALUES (default, '2016-12-08 12:00:00', 'task for list 2', 'hello world again', 2, 7, 1);
INSERT INTO task(tid, due, name, description, list_id, last_editor, assigned_to) VALUES (default, '2016-12-08 12:00:00', 'task for list 1','hello world', 1, 8, 10);

-- checklist
INSERT INTO checklist(cid, name, task_id, status) VALUES (default, 'under task 1', 1, TRUE);
INSERT INTO checklist(cid, name, task_id) VALUES (default, 'under task 2', 2);
INSERT INTO checklist(cid, name, task_id) VALUES (default, 'under task 3', 3);
INSERT INTO checklist(cid, name, task_id) VALUES (default, 'under task 4', 4);
INSERT INTO checklist(cid, name, task_id) VALUES (default, 'under task 5', 5);
INSERT INTO checklist(cid, name, task_id, status) VALUES (default, 'under task 6', 6, TRUE);
INSERT INTO checklist(cid, name, task_id, status) VALUES (default, 'under task 7', 7, TRUE);
INSERT INTO checklist(cid, name, task_id, status) VALUES (default, 'under task 8', 8, TRUE);
INSERT INTO checklist(cid, name, task_id, status) VALUES (default, 'under task 9', 9, TRUE);
INSERT INTO checklist(cid, name, task_id, status) VALUES (default, 'under task 10', 10, TRUE);

-- label
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'important', 'yellow', 1);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'important', 'red', 2);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'second propriety', 'orange', 1);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'second propriety', 'orange', 3);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'least', 'white', 4);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'second propriety','orange', 5);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'least', 'white', 6);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'important', 'red', 7);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'important', 'red', 8);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'important', 'red', 9);
INSERT INTO label(lid, name, color, list_id) VALUES (default, 'important', 'red', 10);

-- label-task
INSERT INTO label_task VALUES (1,1);
INSERT INTO label_task VALUES (1,11);
INSERT INTO label_task VALUES (2,2);
INSERT INTO label_task VALUES (2,3);
INSERT INTO label_task VALUES (3,3);
INSERT INTO label_task VALUES (4,4);
INSERT INTO label_task VALUES (5,5);
INSERT INTO label_task VALUES (6,6);
INSERT INTO label_task VALUES (7,7);
INSERT INTO label_task VALUES (8,8);
INSERT INTO label_task VALUES (9,9);
INSERT INTO label_task VALUES (10,10);
INSERT INTO label_task VALUES (11,7);
INSERT INTO label_task VALUES (11,4);


