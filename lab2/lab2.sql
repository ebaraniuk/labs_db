CREATE TABLE "clients" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone" varchar,
  "address" varchar,
  "group_id" int
);

CREATE TABLE "teachers" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "students" int
);

CREATE TABLE "subject" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "name" varchar,
  "teacher_id" int
);

CREATE TABLE "progress" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "student_id" int,
  "time" timestamp,
  "level" int
);

CREATE TABLE "group" (
  "id" int,
  "teacher" int,
  "students" int
);

ALTER TABLE "clients" ADD FOREIGN KEY ("id") REFERENCES "teachers" ("students");

ALTER TABLE "teachers" ADD FOREIGN KEY ("id") REFERENCES "subject" ("teacher_id");

ALTER TABLE "teachers" ADD FOREIGN KEY ("id") REFERENCES "group" ("teacher");

ALTER TABLE "progress" ADD FOREIGN KEY ("student_id") REFERENCES "clients" ("id");

ALTER TABLE "clients" ADD FOREIGN KEY ("group_id") REFERENCES "group" ("id");
