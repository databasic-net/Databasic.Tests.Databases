CREATE DATABASE databasic_demo_mlm
	WITH ENCODING='UTF8'
		CONNECTION LIMIT=-1;

CREATE SEQUENCE dealers_seq;

CREATE TABLE dealers (
	id INTEGER NOT NULL DEFAULT NEXTVAL ('dealers_seq'),
	id_parent INTEGER NULL DEFAULT NULL,
	name VARCHAR(64) NOT NULL,
	surname VARCHAR(64) NULL DEFAULT NULL,
	description TEXT NULL,
	turn_over_excl_vat DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	turn_over_incl_vat DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	PRIMARY KEY (id)
);

CREATE INDEX dealers_name ON dealers (name);
CREATE INDEX dealers_surname ON dealers (surname);
CREATE INDEX dealers_turn_over_excl_vat ON dealers (turn_over_excl_vat);
CREATE INDEX dealers_turn_over_incl_vat ON dealers (turn_over_incl_vat);

CREATE SEQUENCE clients_seq;

CREATE TABLE clients (
	id INTEGER NOT NULL DEFAULT NEXTVAL ('clients_seq'),
	name VARCHAR(64) NOT NULL,
	fullname VARCHAR(128) NULL DEFAULT NULL,
	discount DECIMAL(5,2) NOT NULL DEFAULT '0.00',
	street VARCHAR(64) NULL DEFAULT NULL,
	city VARCHAR(64) NULL DEFAULT NULL,
	zip VARCHAR(10) NULL DEFAULT NULL,
	region VARCHAR(64) NULL DEFAULT NULL,
	country VARCHAR(64) NULL DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX clients_name ON clients (name);
CREATE INDEX clients_fullname ON clients (fullname);
CREATE INDEX clients_discount ON clients (discount);
CREATE INDEX clients_street ON clients (street);
CREATE INDEX clients_city ON clients (city);
CREATE INDEX clients_zip ON clients (zip);
CREATE INDEX clients_region ON clients (region);
CREATE INDEX clients_country ON clients (country);

CREATE SEQUENCE orders_seq;

CREATE TABLE orders (
	id INTEGER NOT NULL DEFAULT NEXTVAL ('orders_seq'),
	id_dealer INTEGER NULL DEFAULT NULL,
	id_client INTEGER NULL DEFAULT NULL,
	price_excl_vat DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	price_incl_vat DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	date_submit TIMESTAMP(0) NOT NULL DEFAULT NOW(),
	date_dispatch TIMESTAMP(0) NULL DEFAULT NULL,
	paid SMALLINT NOT NULL DEFAULT '0',
	status VARCHAR(10) NOT NULL DEFAULT 'NEW',
	PRIMARY KEY (id)
);

CREATE INDEX orders_price_excl_vat ON orders (price_excl_vat);
CREATE INDEX orders_price_incl_vat ON orders (price_incl_vat);
CREATE INDEX orders_date_submit ON orders (date_submit);
CREATE INDEX orders_date_dispatch ON orders (date_dispatch);
CREATE INDEX orders_paid ON orders (paid);
CREATE INDEX orders_status ON orders (status);

ALTER TABLE dealers
	ADD CONSTRAINT FK_dealers_dealers FOREIGN KEY (id_parent) REFERENCES dealers (id);
	
ALTER TABLE orders
	ADD CONSTRAINT FK_orders_dealers FOREIGN KEY (id_dealer) REFERENCES dealers (id),
	ADD CONSTRAINT FK_orders_clients FOREIGN KEY (id_client) REFERENCES clients (id);