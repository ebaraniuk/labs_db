CREATE TABLE "clients" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone" varchar,
  "address" varchar,
  "teacher_id" int
);

CREATE TABLE "teachers" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "subject_id" int
);

CREATE TABLE "subject" (
  "id" SERIAL UNIQUE PRIMARY KEY,
  "name" varchar,
  "group_id" int UNIQUE
);

ALTER TABLE "clients" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

ALTER TABLE "teachers" ADD FOREIGN KEY ("subject_id") REFERENCES "subject" ("id");
