CREATE DATABASE simplejdbc;
\c simplejdbc

CREATE TABLE person( -- strong entity
  id serial NOT NULL,
  ssn CHAR(12) NOT NULL,
  age int NOT NULL,
  full_name VARCHAR(350) NOT NULL,
  address VARCHAR(350) NOT NULL,
  phone VARCHAR(350) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE instrument_stock( -- strong entity
  id serial NOT NULL,
  instrument VARCHAR(350) NOT NULL,
  type VARCHAR(350) NOT NULL,
  brand VARCHAR(350) NOT NULL,
  rental_fee FLOAT(10) NOT NULL,
  available_amount INT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE lesson_pricing( -- strong entity
  id serial NOT NULL,
  cost FLOAT(10) NOT NULL,
  additional_day_cost FLOAT(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE lesson_type( -- strong entity
  id serial NOT NULL,
  type VARCHAR(350) NOT NULL,
  cost FLOAT(10) NOT NULL,
  additional_day_cost FLOAT(10) NOT NULL,
  skill_level VARCHAR(350) NOT NULL,
  is_ensamble BIT(1) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE student(
  id serial NOT NULL,
  parent_phone VARCHAR(350) NOT NULL,
  sibling_discount FLOAT(10) NOT NULL,
  debt FLOAT(10) NOT NULL,
  person_id int NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(person_id) REFERENCES person(id) ON DELETE RESTRICT
);

CREATE TABLE instructor(
  id serial NOT NULL,
  instructor_cut FLOAT(10) NOT NULL,
  income_total FLOAT(10) NOT NULL,
  person_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(person_id) REFERENCES person(id) ON DELETE RESTRICT
);

CREATE TABLE rented_instrument(
  id serial NOT NULL,
  lease_start DATE NOT NULL,
  lease_end DATE NOT NULL,
  student_id INT NOT NULL,
  instrument_stock_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(instrument_stock_id) REFERENCES instrument_stock(id) ON DELETE RESTRICT,
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE RESTRICT
);

CREATE TABLE student_siblings(
  student_id1 INT NOT NULL,
  student_id2 INT NOT NULL,
  PRIMARY KEY(student_id1, student_id2),
  FOREIGN KEY(student_id1) REFERENCES student(id) ON DELETE CASCADE,
  FOREIGN KEY(student_id2) REFERENCES student(id) ON DELETE CASCADE
);

CREATE TABLE individual_lesson(
  id serial NOT NULL,
  time_start TIMESTAMP(6) NOT NULL,
  address VARCHAR(350) NOT NULL,
  lesson_type_id INT NOT NULL,
  student_id INT NOT NULL,
  instructor_id INT NOT NULL,
  -- lesson_pricing_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_type(id) ON DELETE RESTRICT,
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE RESTRICT,
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE RESTRICT
  -- FOREIGN KEY(lesson_pricing_id) REFERENCES lesson_pricing(id) ON DELETE RESTRICT
);

CREATE TABLE common_lesson(
  id serial NOT NULL,
  min_attendees INT NOT NULL,
  max_attendees INT NOT NULL,
  address VARCHAR(350) NOT NULL,
  time_start TIMESTAMP(6) NOT NULL,
  time_end TIMESTAMP(6) NOT NULL,
  lesson_type_id INT NOT NULL,
  instructor_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_type(id) ON DELETE RESTRICT,
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE RESTRICT
);

CREATE TABLE common_lesson_student(
  student_id INT NOT NULL,
  common_lesson_id INT NOT NULL,
  PRIMARY KEY(student_id, common_lesson_id),
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE CASCADE,
  FOREIGN KEY(common_lesson_id) REFERENCES common_lesson(id) ON DELETE RESTRICT
);

CREATE TABLE instructor_instrument(
  instrument VARCHAR(350) NOT NULL,
  instructor_id INT NOT NULL,
  PRIMARY KEY(instrument, instructor_id),
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);

CREATE TABLE instructor_schedule(
  instructor_id INT NOT NULL,
  time_start TIMESTAMP(6) NOT NULL,
  time_end TIMESTAMP(6) NOT NULL,
  PRIMARY KEY(instructor_id, time_start, time_end),
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);

CREATE TABLE enrollment_form(
  id serial NOT NULL,
  keep_form BIT(1) NOT NULL,
  accepted BIT(1),
  person_id INT NOT NULL,
  lesson_type_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(person_id) REFERENCES person(id) ON DELETE CASCADE,
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_type(id) ON DELETE RESTRICT
);

CREATE TABLE participation_offer(
  enrollment_form_id INT NOT NULL,
  student_accepted BIT(1) NOT NULL,
  PRIMARY KEY(enrollment_form_id),
  FOREIGN KEY(enrollment_form_id) REFERENCES enrollment_form(id) ON DELETE CASCADE
);

CREATE TABLE audition(
  enrollment_form_id INT NOT NULL,
  time_start TIMESTAMP(6) NOT NULL,
  address VARCHAR(350) NOT NULL,
  passed BIT(1),
  PRIMARY KEY(enrollment_form_id),
  FOREIGN KEY(enrollment_form_id) REFERENCES enrollment_form(id) ON DELETE CASCADE
);

INSERT INTO person(ssn, age, full_name, address, phone) -- 1
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 2
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 3
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 4
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 5
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 6
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 7
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 8
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 9
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 10
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 11
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 12
VALUES('199801019999', 18, 'Anders Andersson', 'Stadsvägen 12', '08080909');

INSERT INTO person(ssn, age, full_name, address, phone) -- 13
VALUES('199801015555', 30, 'Gustav Gustavsson', 'Bokvägen 13', '0809090909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 14
VALUES('199801015555', 35, 'Robert Robertsson', 'Trädvägen 10', '0809090909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 13
VALUES('199801014444', 47, 'Giosippi Aldini', 'Romeway 20', '0809090909');
INSERT INTO person(ssn, age, full_name, address, phone) -- 14
VALUES('199801013333', 76, 'Instructor Ben', 'Trädvägen 10', '0809090909');

--------------------------- STUDENTS -------------------------------------

INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 1); -- 1
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 2); -- 2
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 3); -- 3
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 4); -- 4
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 5); -- 5
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 6); -- 6
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 7); -- 7
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 8); -- 8
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 9); -- 9
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 10); -- 10
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 11); -- 11
INSERT INTO student(parent_phone, sibling_discount, debt, person_id)
VALUES('112', 0, 0, 12); -- 12

----------------------- INSTRUMENT STOCK ---------------------------------

INSERT INTO instrument_stock(instrument, type, brand, rental_fee, available_amount )
VALUES('Guitar', 'string', 'hypers', 1165, 52);
INSERT INTO instrument_stock(instrument, type, brand, rental_fee, available_amount )
VALUES('Violin', 'string', 'feelsrainman', 999, 10);
INSERT INTO instrument_stock(instrument, type, brand, rental_fee, available_amount )
VALUES('Cello', 'string', 'poggers', 300, 2);
INSERT INTO instrument_stock(instrument, type, brand, rental_fee, available_amount )
VALUES('Hurdy-gurdy', 'string', 'goos', 1500, 0);
INSERT INTO instrument_stock(instrument, type, brand, rental_fee, available_amount )
VALUES('Guitar', 'string', 'peepoleave', 1500, 7);
INSERT INTO instrument_stock(instrument, type, brand, rental_fee, available_amount )
VALUES('Trädstam', 'slag', 'waowaowao', 1500, 7);

---------------------- RENTED INSTRUMENTS -----------------------------------

INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id)
VALUES('2020-01-15', '2021-01-15', 1, 1);
INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id)
VALUES('2020-01-15', '2020-02-15', 1, 1);
INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id)
VALUES('2020-02-15', '2020-06-15', 2, 2);
INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id)
VALUES('2020-10-18', '2020-12-14', 3, 2);
INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id)
VALUES('2020-01-20', '2020-12-17', 4, 3);
INSERT INTO rented_instrument(lease_start, lease_end, student_id, instrument_stock_id)
VALUES('2020-04-30', '2020-06-19', 5, 1);

---------------------- LESSON TYPES -----------------------------------

INSERT INTO lesson_type(type, skill_level, cost, additional_day_cost, is_ensamble)
VALUES('Guitar', 'Beginner', 2.50, 0, '0');
INSERT INTO lesson_type(type, skill_level, cost, additional_day_cost, is_ensamble)
VALUES('Violin', 'Beginner', 5.50, 0, '0');
INSERT INTO lesson_type(type, skill_level, cost, additional_day_cost, is_ensamble)
VALUES('Metal', 'Beginner', 1550, 5, '1');
INSERT INTO lesson_type(type, skill_level, cost, additional_day_cost, is_ensamble)
VALUES('Cello', 'Beginner', 1550, 5, '0');

---------------------- INSTRUCTOR -------------------------------------

INSERT INTO instructor(instructor_cut, income_total, person_id)
VALUES(0.55, 38000, 13);
INSERT INTO instructor(instructor_cut, income_total, person_id)
VALUES(0.45, 27000, 14);
INSERT INTO instructor(instructor_cut, income_total, person_id)
VALUES(0.45, 27000, 15);
INSERT INTO instructor(instructor_cut, income_total, person_id)
VALUES(0.45, 27000, 16);

---------------------- INSTRUCTOR_INSTRUMENTS --------------------------

INSERT INTO instructor_instrument(instrument, instructor_id)
VALUES('Triangel', 1);
INSERT INTO instructor_instrument(instrument, instructor_id)
VALUES('Orgel', 2);
INSERT INTO instructor_instrument(instrument, instructor_id)
VALUES('Xylofon', 2);
INSERT INTO instructor_instrument(instrument, instructor_id)
VALUES('Maracas', 2);

-------------------- INSTRUCTOR SCHEDULE --------------------------------

INSERT INTO instructor_schedule(instructor_id, time_start, time_end)
VALUES(1, '2020-03-13 09:00:00-07', '2020-03-13 18:00:00-07');
INSERT INTO instructor_schedule(instructor_id, time_start, time_end)
VALUES(1, '2020-03-13 10:00:00-07', '2020-03-13 21:00:00-07');
INSERT INTO instructor_schedule(instructor_id, time_start, time_end)
VALUES(3, '2020-03-13 10:00:00-07', '2020-03-13 21:00:00-07');
INSERT INTO instructor_schedule(instructor_id, time_start, time_end)
VALUES(4, '2020-03-13 10:00:00-07', '2020-03-13 21:00:00-07');

------------------- INDIVIDUAL LESSON -----------------------------------

INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-1-1 13:37:00-07', 'Musiksal A', 1, 2, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-02-02 13:37:00-07', 'Musiksal B', 1, 5, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-03-02 13:37:00-07', 'Musiksal C', 1, 7, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-04-02 13:37:00-07', 'Musiksal D', 1, 4, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-05-02 13:37:00-07', 'Musiksal A', 1, 1, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-06-02 13:37:00-07', 'Musiksal B', 1, 1, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-07-02 13:37:00-07', 'Musiksal C', 1, 5, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-07-02 13:37:00-07', 'Musiksal D', 1, 10, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-09-02 13:37:00-07', 'Musiksal A', 1, 9, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-10-02 13:37:00-07', 'Musiksal B', 1, 10, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-11-02 13:37:00-07', 'Musiksal C', 1, 1, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-12-02 13:37:00-07', 'Musiksal D', 1, 8, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-07-02 13:37:00-07', 'Musiksal A', 1, 4, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-09-02 13:37:00-07', 'Musiksal B', 1, 6, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-09-02 13:37:00-07', 'Musiksal C', 1, 5, 2);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-05-04 13:37:00-07', 'Musiksal C', 1, 5, 3);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-03-09 13:37:00-07', 'Musiksal C', 1, 5, 3);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-10-04 13:37:00-07', 'Musiksal C', 1, 5, 4);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-1-1 13:37:00-07', 'Musiksal A', 1, 2, 3);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-11-1 13:37:00-07', 'Musiksal A', 1, 2, 3);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-11-1 13:37:00-07', 'Musiksal A', 1, 2, 3);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-11-1 13:37:00-07', 'Musiksal A', 1, 2, 4);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-11-02 13:37:00-07', 'Musiksal A', 1, 2, 1);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-12-02 13:37:00-07', 'Musiksal A', 1, 2, 3);
INSERT INTO individual_lesson(time_start, address, lesson_type_id, student_id, instructor_id)
VALUES('2020-12-02 13:37:00-07', 'Musiksal A', 1, 2, 4);


-------------------------- GROUP LESSONS ------------------------------------------------

INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(5, 8, 'Online', '2020-01-02 09:00:00-07', '2020-01-02 12:00:00-07', 1, 1);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(5, 8, 'Online', '2020-02-02 09:00:00-07', '2020-02-02 12:00:00-07', 2, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-03-02 09:00:00-07', '2020-03-02 12:00:00-07', 2, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(2, 8, 'Online', '2020-04-02 09:00:00-07', '2020-04-02 12:00:00-07', 1, 1);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(7, 8, 'Online', '2020-05-02 09:00:00-07', '2020-05-02 12:00:00-07', 2, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(4, 8, 'Online', '2020-06-02 09:00:00-07', '2020-06-02 12:00:00-07', 2, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(5, 8, 'Online', '2020-07-02 09:00:00-07', '2020-07-02 12:00:00-07', 2, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-07-02 09:00:00-07', '2020-07-02 12:00:00-07', 1, 1);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 10, 'Online', '2021-01-01 09:00:00-07', '2021-01-01 12:00:00-07', 1, 3);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 10, 'Online', '2021-01-02 09:00:00-07', '2021-01-02 12:00:00-07', 4, 3);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 10, 'Online', '2021-03-01 09:00:00-07', '2021-04-01 12:00:00-07', 4, 3);

--------------------------------- ENSEMBLES -----------------------------------------

INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-02-02 09:00:00-07', '2020-02-02 12:00:00-07', 3, 1);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-04-02 09:00:00-07', '2020-04-02 12:00:00-07', 3, 1);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-06-02 09:00:00-07', '2020-06-02 12:00:00-07', 3, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-08-02 09:00:00-07', '2020-08-02 12:00:00-07', 3, 1);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-10-02 09:00:00-07', '2020-10-02 12:00:00-07', 3, 2);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(3, 8, 'Online', '2020-10-02 09:00:00-07', '2020-10-02 12:00:00-07', 3, 3);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(1, 5, 'House él Arriba', '2021-01-01 09:00:00-07', '2021-01-02 12:00:00-07', 3, 3);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(2, 4, 'Casa del siempre Mariachi', '2021-01-02 09:00:00-07', '2021-01-02 12:00:00-07', 3, 4);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(1, 6, 'Stadshuset', '2020-12-29 09:00:00-07', '2021-01-02 12:00:00-07', 3, 4);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(1, 6, 'McDonalds Bollhav', '2021-01-12 09:00:00-07', '2021-01-12 12:00:00-07', 3, 4);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(1, 6, 'McDonalds Bollhav', '2021-01-13 09:00:00-07', '2021-01-14 12:00:00-07', 3, 4);
INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
VALUES(1, 6, 'McDonalds Bollhav', '2021-01-14 09:00:00-07', '2021-01-15 12:00:00-07', 3, 4);
-- INSERT INTO common_lesson(min_attendees, max_attendees, address, time_start, time_end, lesson_type_id, instructor_id)
-- VALUES(1, 6, 'BurgerKing Parkeringsplats', '2021-01-15 09:00:00-07', '2021-01-15 12:00:00-07', 3, 4);


---------------------------------- ENSEMBLE ATTENDEES ---------------------------------------------

INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(1, 16);
INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(2, 16);
INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(3, 16);

INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(4, 17);
INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(5, 17);
INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(6, 17);
INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(7, 17);

INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(9, 18);
INSERT INTO common_lesson_student(student_id, common_lesson_id)
VALUES(10, 21);

------------------------------------------- VIEWS -----------------------------------------------------

-- task 3 bullet 2
CREATE VIEW lessons_per_month AS
SELECT k.month, k.lesson, SUM(count) FROM (
SELECT 'January' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL
SELECT 'January' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL

SELECT 'February' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-02-02' and time_start < '2020-03-01')
UNION ALL
SELECT 'February' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL

SELECT 'March' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-03-02' and time_start < '2020-04-01')
UNION ALL
SELECT 'March' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL

SELECT 'April' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-04-02' and time_start < '2020-05-01')
UNION ALL
SELECT 'April' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL

SELECT 'May' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-05-02' and time_start < '2020-06-01')
UNION ALL
SELECT 'May' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL

SELECT 'June' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-06-02' and time_start < '2020-07-01')
UNION ALL
SELECT 'June' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-06-01' and time_start < '2020-07-01')
UNION ALL

SELECT 'July' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-07-02' and time_start < '2020-08-01')
UNION ALL
SELECT 'July' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL

SELECT 'August' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-08-02' and time_start < '2020-09-01')
UNION ALL
SELECT 'August' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL

SELECT 'September' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-09-02' and time_start < '2020-10-01')
UNION ALL
SELECT 'September' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL

SELECT 'October' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-10-02' and time_start < '2020-11-01')
UNION ALL
SELECT 'October' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL

SELECT 'November' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-11-02' and time_start < '2020-12-01')
UNION ALL
SELECT 'November' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL

SELECT 'December' as month, 'every instrument' as lesson, COUNT (*) from individual_lesson where
(time_start >= '2020-12-02' and time_start < '2021-01-01')
UNION ALL
SELECT 'December' as month, 'every instrument' as lesson, COUNT (*) from common_lesson where
(time_start >= '2020-12-01' and time_start < '2021-01-01')
) as k
GROUP BY k.month, k.lesson

UNION ALL
SELECT 'January' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01')
UNION ALL
Select 'January' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'January' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-01-01' and time_start < '2020-02-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'Feburary' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01')
UNION ALL
Select 'Feburary' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'February' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-02-01' and time_start < '2020-03-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'March' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01')
UNION ALL
Select 'March' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'March' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-03-01' and time_start < '2020-04-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'April' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01')
UNION ALL
Select 'April' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'April' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-04-01' and time_start < '2020-05-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'May' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01')
UNION ALL
Select 'May' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'May' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-05-01' and time_start < '2020-06-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'June' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01')
UNION ALL
Select 'June' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'June' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-06-01' and time_start < '2020-07-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'Juli' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01')
UNION ALL
Select 'Juli' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'Juli' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-07-01' and time_start < '2020-08-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'August' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01')
UNION ALL
Select 'August' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'August' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-08-01' and time_start < '2020-09-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'September' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01')
UNION ALL
Select 'September' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'September' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-09-01' and time_start < '2020-10-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'Oktober' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01')
UNION ALL
Select 'October' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'October' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-10-01' and time_start < '2020-11-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'November' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01')
UNION ALL
Select 'November' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'November' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-11-01' and time_start < '2020-12-01') and lesson_type.is_ensamble = '0'
UNION ALL

SELECT 'December' as month, 'individual' as lesson, COUNT(individual_lesson)
FROM individual_lesson
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01')
UNION ALL
Select 'December' as month, 'ensemble' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01') and lesson_type.is_ensamble = '1'
UNION ALL
Select 'December' as month, 'group' as lesson, COUNT(*)
FROM common_lesson as c
INNER JOIN lesson_type
ON c.lesson_type_id = lesson_type.id
WHERE (time_start >= '2020-12-01' and time_start < '2021-01-01') and lesson_type.is_ensamble = '0';

-------------------------------------- VIEW 2 ---------------------------------------------------------

-- 3 bullet 1

CREATE VIEW instrument_per_month AS
SELECT * FROM(
SELECT 'January' as month, 'every instrument' as instrument, COUNT (*) from rented_instrument where
((lease_start <= '2020-01-01' AND lease_end >= '2020-02-01') OR -- begin before, end after
(lease_start <= '2020-01-01' AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) OR -- begin before, end during
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND lease_end >= '2020-02-01')) OR -- begin during, end after
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND (lease_end BETWEEN '2020-01-01' and '2020-02-01'))
UNION ALL
SELECT 'February' as month, 'every instrument' as instrument, COUNT (*) from rented_instrument where
((lease_start <= '2020-02-01' AND lease_end >= '2020-03-01') OR
(lease_start <= '2020-02-01' AND (lease_end BETWEEN '2020-02-01' and '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND lease_end >= '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND (lease_end BETWEEN '2020-02-01' and '2020-03-01'))
UNION ALL
SELECT 'March' as month, 'every instrument' as instrument, COUNT (*) from rented_instrument where
((lease_start <= '2020-03-01' AND lease_end >= '2020-04-01') OR
(lease_start <= '2020-03-01' AND (lease_end BETWEEN '2020-03-01' and '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND lease_end >= '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND (lease_end BETWEEN '2020-03-01' and '2020-04-01'))
UNION ALL
SELECT 'April' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-04-01' AND lease_end >= '2020-05-01') OR
(lease_start <= '2020-04-01' AND (lease_end BETWEEN '2020-04-01' and '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND lease_end >= '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND (lease_end BETWEEN '2020-04-01' and '2020-05-01'))
UNION ALL
SELECT 'May' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-05-01' AND lease_end >= '2020-06-01') OR
(lease_start <= '2020-05-01' AND (lease_end BETWEEN '2020-05-01' and '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND lease_end >= '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND (lease_end BETWEEN '2020-05-01' and '2020-06-01'))
UNION ALL
SELECT 'June' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-06-01' AND lease_end >= '2020-07-01') OR
(lease_start <= '2020-06-01' AND (lease_end BETWEEN '2020-06-01' and '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND lease_end >= '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND (lease_end BETWEEN '2020-06-01' and '2020-07-01'))
UNION ALL
SELECT 'July' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-07-01' AND lease_end >= '2020-08-01') OR
(lease_start <= '2020-07-01' AND (lease_end BETWEEN '2020-07-01' and '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND lease_end >= '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND (lease_end BETWEEN '2020-07-01' and '2020-08-01'))
UNION ALL
SELECT 'August' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-08-01' AND lease_end >= '2020-09-01') OR
(lease_start <= '2020-08-01' AND (lease_end BETWEEN '2020-08-01' and '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND lease_end >= '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND (lease_end BETWEEN '2020-08-01' and '2020-09-01'))
UNION ALL
SELECT 'September' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-09-01' AND lease_end >= '2020-10-01') OR
(lease_start <= '2020-09-01' AND (lease_end BETWEEN '2020-09-01' and '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND lease_end >= '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND (lease_end BETWEEN '2020-09-01' and '2020-10-01'))
UNION ALL
SELECT 'October' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-10-01' AND lease_end >= '2020-11-01') OR
(lease_start <= '2020-10-01' AND (lease_end BETWEEN '2020-10-01' and '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND lease_end >= '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND (lease_end BETWEEN '2020-10-01' and '2020-11-01'))
UNION ALL
SELECT 'November' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-11-01' AND lease_end >= '2020-12-01') OR
(lease_start <= '2020-11-01' AND (lease_end BETWEEN '2020-11-01' and '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND lease_end >= '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND (lease_end BETWEEN '2020-11-01' and '2020-12-01'))
UNION ALL
SELECT 'December' as month, 'every instrument' as instrument, COUNT(*) from rented_instrument where
((lease_start <= '2020-12-01' AND lease_end >= '2021-01-01') OR
(lease_start <= '2020-12-01' AND (lease_end BETWEEN '2020-12-01' and '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND lease_end >= '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND (lease_end BETWEEN '2020-12-01' and '2021-01-01'))
) as k
UNION ALL


SELECT * FROM(
SELECT 'January' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-01-01' AND lease_end >= '2020-02-01') OR
(lease_start <= '2020-01-01' AND (lease_end BETWEEN '2020-01-01' and '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND lease_end >= '2020-02-01')) OR
((lease_start BETWEEN '2020-01-01' and '2020-02-01') AND (lease_end BETWEEN '2020-01-01' and '2020-02-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'February' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-02-01' AND lease_end >= '2020-03-01') OR
(lease_start <= '2020-02-01' AND (lease_end BETWEEN '2020-02-01' and '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND lease_end >= '2020-03-01')) OR
((lease_start BETWEEN '2020-02-01' and '2020-03-01') AND (lease_end BETWEEN '2020-02-01' and '2020-03-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'March' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-03-01' AND lease_end >= '2020-04-01') OR
(lease_start <= '2020-03-01' AND (lease_end BETWEEN '2020-03-01' and '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND lease_end >= '2020-04-01')) OR
((lease_start BETWEEN '2020-03-01' and '2020-04-01') AND (lease_end BETWEEN '2020-03-01' and '2020-04-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'April' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-04-01' AND lease_end >= '2020-05-01') OR
(lease_start <= '2020-04-01' AND (lease_end BETWEEN '2020-04-01' and '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND lease_end >= '2020-05-01')) OR
((lease_start BETWEEN '2020-04-01' and '2020-05-01') AND (lease_end BETWEEN '2020-04-01' and '2020-05-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'May' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-05-01' AND lease_end >= '2020-06-01') OR
(lease_start <= '2020-05-01' AND (lease_end BETWEEN '2020-05-01' and '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND lease_end >= '2020-06-01')) OR
((lease_start BETWEEN '2020-05-01' and '2020-06-01') AND (lease_end BETWEEN '2020-05-01' and '2020-06-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'June' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-06-01' AND lease_end >= '2020-07-01') OR
(lease_start <= '2020-06-01' AND (lease_end BETWEEN '2020-06-01' and '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND lease_end >= '2020-07-01')) OR
((lease_start BETWEEN '2020-06-01' and '2020-07-01') AND (lease_end BETWEEN '2020-06-01' and '2020-07-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'July' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-07-01' AND lease_end >= '2020-08-01') OR
(lease_start <= '2020-07-01' AND (lease_end BETWEEN '2020-07-01' and '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND lease_end >= '2020-08-01')) OR
((lease_start BETWEEN '2020-07-01' and '2020-08-01') AND (lease_end BETWEEN '2020-07-01' and '2020-08-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'August' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-08-01' AND lease_end >= '2020-09-01') OR
(lease_start <= '2020-08-01' AND (lease_end BETWEEN '2020-08-01' and '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND lease_end >= '2020-09-01')) OR
((lease_start BETWEEN '2020-08-01' and '2020-09-01') AND (lease_end BETWEEN '2020-08-01' and '2020-09-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'September' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-09-01' AND lease_end >= '2020-10-01') OR
(lease_start <= '2020-09-01' AND (lease_end BETWEEN '2020-09-01' and '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND lease_end >= '2020-10-01')) OR
((lease_start BETWEEN '2020-09-01' and '2020-10-01') AND (lease_end BETWEEN '2020-09-01' and '2020-10-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'October' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-10-01' AND lease_end >= '2020-11-01') OR
(lease_start <= '2020-10-01' AND (lease_end BETWEEN '2020-10-01' and '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND lease_end >= '2020-11-01')) OR
((lease_start BETWEEN '2020-10-01' and '2020-11-01') AND (lease_end BETWEEN '2020-10-01' and '2020-11-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'November' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-11-01' AND lease_end >= '2020-12-01') OR
(lease_start <= '2020-11-01' AND (lease_end BETWEEN '2020-11-01' and '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND lease_end >= '2020-12-01')) OR
((lease_start BETWEEN '2020-11-01' and '2020-12-01') AND (lease_end BETWEEN '2020-11-01' and '2020-12-01'))
GROUP BY(s.instrument)
UNION ALL
SELECT 'December' as month, s.instrument, COUNT (s.instrument)
FROM rented_instrument as r INNER JOIN instrument_stock as s
ON r.instrument_stock_id = s.id
WHERE ((lease_start <= '2020-12-01' AND lease_end >= '2021-01-01') OR
(lease_start <= '2020-12-01' AND (lease_end BETWEEN '2020-12-01' and '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND lease_end >= '2021-01-01')) OR
((lease_start BETWEEN '2020-12-01' and '2021-01-01') AND (lease_end BETWEEN '2020-12-01' and '2021-01-01'))
GROUP BY(s.instrument) ORDER BY count DESC
) as y;
