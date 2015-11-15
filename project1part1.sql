CREATE TABLE account (
  aid serial PRIMARY KEY,
  email text NOT NULL UNIQUE,
  name varchar(20) NOT NULL,
  password text NOT NULL,
  CHECK (email LIKE '_%@_%._%')
);

CREATE TABLE list (
  lid serial PRIMARY KEY,
  owner int NOT NULL REFERENCES account(aid),
  name varchar(100) NOT NULL
);

CREATE TABLE accessible_user (
  account_id int NOT NULL REFERENCES account(aid) ON DELETE CASCADE,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  type boolean NOT NULL, -- FALSE just view, TRUE can edit
  UNIQUE (account_id, list_id)
);

CREATE TABLE comment (
  cid serial PRIMARY KEY,
  since timestamp NOT NULL,
  content varchar(1000) NOT NULL,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  sender int NOT NULL,
  FOREIGN KEY (sender, list_id) REFERENCES accessible_user(account_id, list_id)
);

CREATE TABLE task (
  tid serial PRIMARY KEY,
  due timestamp,
  description text,
  name varchar(100) NOT NULL,
  assigned_to int,
  last_editor int NOT NULL,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  status boolean DEFAULT FALSE,
  when_completed timestamp,
  CHECK ((status = TRUE AND when_completed is NOT NULL)
    OR (status = FALSE AND when_completed is NULL)),
  FOREIGN KEY (assigned_to, list_id) REFERENCES accessible_user(account_id, list_id),
  FOREIGN KEY (last_editor, list_id) REFERENCES accessible_user(account_id, list_id)
);

CREATE TABLE checklist (
  cid serial PRIMARY KEY,
  status boolean DEFAULT FALSE,
  name varchar(100) NOT NULL,
  task_id int NOT NULL REFERENCES task(tid) ON DELETE CASCADE
);

CREATE TABLE label (
  lid serial PRIMARY KEY,
  name varchar(20),
  color varchar(10),
  CHECK (color IN ('blue', 'red', 'green', 'orange', 'white', 'black', 'yellow', 'purple')),
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE
);

CREATE TABLE label_task (
  task_id int NOT NULL REFERENCES task(tid),
  label_id int NOT NULL REFERENCES label(lid),
  UNIQUE (task_id, label_id)
);


-- To drop all tables
-- drop table accessible_user, account, checklist, comment, label, label_task, list, task;


-- interesting queries
-- the number of times user 'Eugene' has tasks with different label colors
SELECT L.color, COUNT(L.color) FROM label L, label_task LT, task T
WHERE L.lid = LT.label_id
  AND LT.task_id = T.tid
  AND T.list_id IN (SELECT DISTINCT AU.list_id
                    FROM accessible_user AU, account A
                    WHERE AU.account_id = A.aid 
                      AND A.name = 'Eugene')
GROUP BY L.color
ORDER BY COUNT(L.color) DESC;

-- the number of completed checklist under task 1
SELECT COUNT(DISTINCT C.cid)
FROM checklist C
WHERE C.task_id = 1 AND C.status = true;

-- the number of comments created by user named 'Eugene'in list 6 
SELECT COUNT(DISTINCT C.cid)
FROM comment C
WHERE C.list_id = 6
  AND C.sender = (SELECT A.aid
                  FROM account A
                  WHERE A.name = 'Eugene');

-- join the table of task, label_task and label and select the task that is not complete
-- display information about tasks that are not complete
SELECT T.tid, T.list_id, LT.label_id, T.status, L.color
FROM task T INNER JOIN label_task LT
ON T.tid = LT.task_id
INNER JOIN label L
ON LT.label_id = L.lid
WHERE T.status = false;

-- find the list of the name of the user who can access list 1
SELECT A.name
FROM accessible_user AU INNER JOIN account A
ON AU.account_id = A.aid
WHERE AU.list_id = 1;


