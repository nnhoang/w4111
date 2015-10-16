CREATE TABLE account (
  aid int PRIMARY KEY,
  email text NOT NULL,
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
  UNIQUE (account_id, list_id)
);

CREATE TABLE editor (
) INHERITS (accessible_user);

CREATE TABLE comment (
  cid int PRIMARY KEY,
  since date NOT NULL,
  content text NOT NULL,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  sender int NOT NULL,
  FOREIGN KEY (sender, list_id) REFERENCES accessible_user(account_id, list_id)
);

CREATE TABLE task (
  tid int PRIMARY KEY,
  due date,
  description text,
  name text NOT NULL,
  assigned_to int,
  last_editor int,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE,
  FOREIGN KEY (assigned_to, list_id) REFERENCES accessible_user(account_id, list_id),
  FOREIGN KEY (last_editor, list_id) REFERENCES accessible_user(account_id, list_id)
);

CREATE TABLE not_completed_task (
) INHERITS (task);

CREATE TABLE completed_task (
  since date NOT NULL
) INHERITS (task);

CREATE TABLE subtask (
  sid int PRIMARY KEY,
  status boolean DEFAULT FALSE,
  name text NOT NULL,
  task_id int NOT NULL REFERENCES task(tid) ON DELETE CASCADE
);

CREATE TABLE label (
  lid int PRIMARY KEY,
  name text,
  color text,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE
);

CREATE TABLE label_task (
  task_id int NOT NULL REFERENCES task(tid),
  label_id int NOT NULL REFERENCES label(lid),
  UNIQUE (task_id, label_id)
);
