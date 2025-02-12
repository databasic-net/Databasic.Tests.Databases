CREATE TABLE departments (
    id_department INTEGER       PRIMARY KEY ASC AUTOINCREMENT,
    name          VARCHAR (100) NOT NULL,
    description   TEXT
);
CREATE TABLE contacts_categories (
    id_contact_category INTEGER      PRIMARY KEY ASC AUTOINCREMENT,
    name                VARCHAR (50) NOT NULL
);
CREATE TABLE persons (
    id_person     INTEGER        PRIMARY KEY ASC AUTOINCREMENT,
    id_parent     INTEGER        CONSTRAINT FK_person_person REFERENCES persons (id_person) ON DELETE RESTRICT
                                                                                            ON UPDATE RESTRICT,
    id_department INTEGER        CONSTRAINT FK_person_department REFERENCES departments (id_department) ON DELETE RESTRICT
                                                                                                        ON UPDATE RESTRICT,
    name          VARCHAR (100)  NOT NULL,
    surname       VARCHAR (100),
    salary        DECIMAL (9, 2) DEFAULT (0),
    gender        CHAR (1)       DEFAULT 'O'
);
CREATE TABLE contacts (
    id_person           INTEGER       CONSTRAINT FK_contacts_persons REFERENCES persons (id_person) ON DELETE RESTRICT
                                                                                                    ON UPDATE RESTRICT,
    id_contact_category INTEGER       CONSTRAINT FK_contacts_contacts_categories REFERENCES contacts_categories (id_contact_category) ON DELETE RESTRICT
                                                                                                                                      ON UPDATE RESTRICT,
    `value`             VARCHAR (100) NOT NULL
);
CREATE TABLE attendance (
    id_person INT      CONSTRAINT FK_attendance_persons REFERENCES persons (id_person) ON DELETE RESTRICT
                                                                                       ON UPDATE RESTRICT,
    `date`    DATE     NOT NULL,
    `time`    TIME (0) NOT NULL
);
