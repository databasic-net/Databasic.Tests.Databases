CREATE INDEX attendance_date ON attendance (`date` ASC, `time` ASC);

CREATE INDEX contacts_value ON contacts (`value` ASC);

CREATE INDEX contacts_categories_name ON contacts_categories (name ASC);

CREATE INDEX departments_name ON departments (name ASC);

CREATE INDEX persons_names ON persons (name ASC, surname ASC);
CREATE INDEX persons_salary ON persons (salary ASC);
CREATE INDEX persons_gender ON persons (gender ASC);