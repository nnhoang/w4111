CREATE TABLE account (
  aid int PRIMARY KEY,
  email text NOT NULL UNIQUE,
  name text NOT NULL
);

CREATE TABLE list (
  lid int PRIMARY KEY,
  owner int NOT NULL REFERENCES account(aid),
  name text NOT NULL
);

CREATE TABLE accessible_user (
  account_id int NOT NULL REFERENCES account(aid) ON DELETE CASCADE,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  type boolean NOT NULL, -- FALSE just view, TRUE can edit
  UNIQUE (account_id, list_id)
);

CREATE TABLE comment (
  cid int PRIMARY KEY,
  since timestamp NOT NULL,
  content text NOT NULL,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  sender int NOT NULL,
  FOREIGN KEY (sender, list_id) REFERENCES accessible_user(account_id, list_id)
);

CREATE TABLE task (
  tid int PRIMARY KEY,
  due timestamp,
  description text,
  name text NOT NULL,
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
  cid int PRIMARY KEY,
  status boolean DEFAULT FALSE,
  name text NOT NULL,
  task_id int NOT NULL REFERENCES task(tid) ON DELETE CASCADE
);

CREATE TABLE label (
  lid int PRIMARY KEY,
  name text,
  color text,
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
-- count tasks with different label color by user
SELECT a.name, l.color FROM account a, label l
WHERE a.aid = ();

-- the # of completed checklist under a task
