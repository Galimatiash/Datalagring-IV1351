CREATE DATABASE soundgood;
\c soundgood

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

CREATE TABLE lesson_types( -- strong entity
  id serial NOT NULL,
  type VARCHAR(350) NOT NULL,
  skill_level VARCHAR(350) NOT NULL,
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
  lesson_pricing_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_types(id) ON DELETE RESTRICT,
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE RESTRICT,
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE RESTRICT,
  FOREIGN KEY(lesson_pricing_id) REFERENCES lesson_pricing(id) ON DELETE RESTRICT
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
  lesson_pricing_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_types(id) ON DELETE RESTRICT,
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE RESTRICT,
  FOREIGN KEY(lesson_pricing_id) REFERENCES lesson_pricing(id) ON DELETE RESTRICT
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

CREATE TABLE available_schedule(
  instructor_id INT NOT NULL,
  time_start TIMESTAMP(6),
  time_end TIMESTAMP(6),
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
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_types(id) ON DELETE RESTRICT
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
