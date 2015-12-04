SELECT *
FROM task T
JOIN list L
ON T.list_id = L.lid
JOIN accessible_user A
ON L.lid = A.list_id
WHERE A.account_id = 1
AND (T.optional->>'due')::timestamp < '01/02/2016';

SELECT *
FROM task T JOIN accessible_user A
ON (T.optional->>'assigned_to')::int = A.account_id;

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
  task_id int NOT NULL REFERENCES task(tid) ON DELETE CASCADE,
  label_id int NOT NULL REFERENCES label(lid) ON DELETE CASCADE,
  UNIQUE (task_id, label_id)
);

-- new label table
CREATE TABLE label (
  lid serial PRIMARY KEY,
  optional JSON,
  list_id int NOT NULL REFERENCES list(lid) ON DELETE CASCADE
);
-- inside JSON (  name varchar(20), color varchar(10))


-- UDF and trigger
DROP FUNCTION checkColor() CASCADE;
CREATE FUNCTION checkColor() RETURNS trigger
AS $$
BEGIN
  IF NEW.optional->>'color' in ('blue', 'red', 'green', 'orange', 'white', 'black', 'yellow', 'purple') THEN
    -- DELETE FROM label WHERE label.lid = NEW.lid;
    RAISE 'Invalid label color';
    RETURN NULL;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insertLabel
  BEFORE INSERT ON label
FOR EACH ROW
  EXECUTE PROCEDURE checkColor();

-- test queries
-- this one should work
INSERT INTO label(optional, list_id) VALUES ('{"name": "part3", "color": "blue"}', 20);
-- this one should NOT work
INSERT INTO label(optional, list_id) VALUES ('{"name": "part3", "color": "abc"}', 20);