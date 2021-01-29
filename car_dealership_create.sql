CREATE TABLE car (
  vin_id SERIAL PRIMARY KEY,
  color VARCHAR(100),
  make VARCHAR(100),
  model VARCHAR(100),
  _year NUMERIC(4)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  mech_hire_date DATE
);

CREATE TABLE services (
  services_id SERIAL PRIMARY KEY,
  services_name VARCHAR(150)
);

CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  sales_hire_date DATE
);

CREATE TABLE parts (
  part_id SERIAL PRIMARY KEY,
  part_name VARCHAR(150),
  part_cost NUMERIC(10,2),
  part_quantity INTEGER
);

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  birth_date DATE,
  email VARCHAR(150)
);

CREATE TABLE service_invoice (
  invoice_id SERIAL PRIMARY KEY,
  date_serviced DATE,
  customer_id INTEGER,
  part_id INTEGER,
  vin_id INTEGER,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(part_id) REFERENCES parts(part_id),
  FOREIGN KEY(vin_id) REFERENCES car(vin_id)
);

CREATE TABLE sale_invoice (
  invoice_num SERIAL PRIMARY KEY,
  date_sold DATE,
  amount NUMERIC(10,2),
  msrp NUMERIC(10,2),
  customer_id INTEGER,
  vin_id INTEGER,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY(vin_id) REFERENCES car(vin_id)
);

CREATE TABLE labor (
  invoice_id INTEGER,
  mechanic_id INTEGER,
  services_id INTEGER,
  labor_cost NUMERIC(10,2),
  FOREIGN KEY(invoice_id) REFERENCES service_invoice(invoice_id),
  FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
  FOREIGN KEY(services_id) REFERENCES services(services_id)	
);

CREATE TABLE salesperson_invoice (
  salesperson_id INTEGER,
  invoice_num INTEGER,
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
  FOREIGN KEY(invoice_num) REFERENCES sale_invoice(invoice_num)
);