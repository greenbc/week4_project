CREATE OR REPLACE FUNCTION add_car (_color VARCHAR, _make VARCHAR, _model VARCHAR, __year INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO car(color,make,model,_year)
	VALUES(_color,_make,_model,__year);
END;
$$
LANGUAGE plpgsql;

SELECT add_car('Black','Kia','Optima',2017);
SELECT add_car('Black','Toyota','Camry',2012);

CREATE OR REPLACE FUNCTION add_customer (_first_name VARCHAR, _last_name VARCHAR, _birth_date DATE, _email VARCHAR)
RETURNS void
AS $$
BEGIN
	INSERT INTO customer(first_name,last_name,birth_date,email)
	VALUES(_first_name,_last_name,_birth_date,_email);
END;
$$
LANGUAGE plpgsql;

SELECT add_customer('Ben','Green','8/6/1992','greenbc005@gmail.com');
SELECT add_customer('John', 'Doe', '5/17/1986', 'johndoe@gmail.com');

CREATE OR REPLACE FUNCTION add_mechanic (_first_name VARCHAR, _last_name VARCHAR, _mech_hire_date DATE)
RETURNS void
AS $$
BEGIN
	INSERT INTO mechanic(first_name,last_name,mech_hire_date)
	VALUES(_first_name,_last_name,_mech_hire_date);
END;
$$
LANGUAGE plpgsql;

SELECT add_mechanic('George','Washington','2/23/2012');
SELECT add_mechanic('John', 'Adams', '5/7/2017');

CREATE OR REPLACE FUNCTION add_parts (_part_name VARCHAR, _part_cost NUMERIC, _part_quantity INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO parts(part_name,part_cost,part_quantity)
	VALUES(_part_name,_part_cost,_part_quantity);
END;
$$
LANGUAGE plpgsql;

SELECT add_parts('Air Filter', 30.99, 6);
SELECT add_parts('Battery', 99.99, 10);

CREATE OR REPLACE FUNCTION add_services (_services_name VARCHAR)
RETURNS void
AS $$
BEGIN
	INSERT INTO services(services_name)
	VALUES(_services_name);
END;
$$
LANGUAGE plpgsql;

SELECT add_services('Oil Change');
SELECT add_services('Car Wash');

CREATE OR REPLACE FUNCTION add_salesperson (_first_name VARCHAR, _last_name VARCHAR, _sales_hire_date DATE)
RETURNS void
AS $$
BEGIN
	INSERT INTO salesperson(first_name,last_name,sales_hire_date)
	VALUES(_first_name,_last_name,_sales_hire_date);
END;
$$
LANGUAGE plpgsql;

SELECT add_salesperson('Joel', 'Carter', '8/5/2014');
SELECT add_salesperson('Brian', 'Stanton', '10/17/2015');

CREATE OR REPLACE FUNCTION add_sale_invoice (_date_sold DATE, _amount NUMERIC, _msrp NUMERIC, _customer_id INTEGER, _vin_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO sale_invoice(date_sold,amount,msrp,customer_id,vin_id)
	VALUES(_date_sold,_amount,_msrp,_customer_id,_vin_id);
END;
$$
LANGUAGE plpgsql;

SELECT add_sale_invoice('1/25/2021',17000,20000,1,1);
SELECT add_sale_invoice('1/28/2021',19000,24000,2,2);

CREATE OR REPLACE FUNCTION add_salesperson_invoice (_salesperson_id INTEGER, _invoice_num INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO salesperson_invoice(salesperson_id,invoice_num)
	VALUES(_salesperson_id,_invoice_num);
END;
$$
LANGUAGE plpgsql;

SELECT add_salesperson_invoice(1,1);
SELECT add_salesperson_invoice(2,2);

CREATE OR REPLACE FUNCTION add_service_invoice (_date_serviced DATE, _customer_id INTEGER, _part_id INTEGER, _vin_id INTEGER)
RETURNS void
AS $$
BEGIN
	INSERT INTO service_invoice(date_serviced,customer_id,part_id,vin_id)
	VALUES(_date_serviced,_customer_id,_part_id,_vin_id);
END;
$$
LANGUAGE plpgsql;

SELECT add_service_invoice('1/29/2021',1,2,1);
SELECT add_service_invoice('1/29/2021',2,1,2);

CREATE OR REPLACE FUNCTION add_labor (_invoice_id INTEGER, _mechanic_id INTEGER, _services_id INTEGER, _labor_cost NUMERIC)
RETURNS void
AS $$
BEGIN
	INSERT INTO labor(invoice_id,mechanic_id,services_id,labor_cost)
	VALUES(_invoice_id,_mechanic_id,_services_id,_labor_cost);
END;
$$
LANGUAGE plpgsql;

SELECT add_labor(1,1,1,20.99);
SELECT add_labor(2,2,2,16.99);