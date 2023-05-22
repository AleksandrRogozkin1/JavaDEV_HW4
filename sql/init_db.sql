--CREATED TABLE FOR WORKERS
CREATE TABLE WORKER(
ID IDENTITY PRIMARY KEY,
NAME CHARACTER  VARYING NOT NULL,
BIRTHDAY DATE,
LEVEL ENUM('Trainee', 'Junior', 'Middle', 'Senior') DEFAULT 'Trainee' NOT NULL,
SALARY INTEGER,
CONSTRAINT WORKER_BIRTHDAY CHECK("BIRTHDAY" > DATE '1900-01-01'),
  CONSTRAINT WORKER_NAME CHECK((CHAR_LENGTH("NAME") >= 2) AND (CHAR_LENGTH("NAME") <= 1000)),
  CONSTRAINT WORKER_SALARY CHECK(("SALARY" >= 100) AND ("SALARY" <= 100000))
);

-- CREATED TABLE FOR CLIENT 
CREATE TABLE CLIENT(
ID IDENTITY PRIMARY KEY,
NAME CHARACTER VARYING NOT NULL,
CONSTRAINT CLIENT_NAME CHECK((CHAR_LENGTH("NAME") >= 2) AND (CHAR_LENGTH("NAME") <= 1000))
);


-- CREATED TABLE FOR PROJECT 
CREATE TABLE PROJECT(
ID IDENTITY PRIMARY KEY,
CLIENT_ID INTEGER,
START_DATE DATE,
FINISH_DATE DATE
);

-- CREATED TABLE FOR project_worker 
CREATE TABLE project_worker (
PROJECT_ID INTEGER,
WORKER_ID INTEGER,
CONSTRAINT frk_project_id FOREIGN KEY  (PROJECT_ID) REFERENCES PROJECT(ID),
CONSTRAINT frk_worker_id FOREIGN KEY  (WORKER_ID) REFERENCES WORKER(ID),
CONSTRAINT project_primary_key PRIMARY KEY (PROJECT_ID, WORKER_ID)
);