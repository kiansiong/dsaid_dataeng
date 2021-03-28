CREATE TABLE manufacturers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    serial_no varchar(255),
    manufacturer_id INT,
    model_name VARCHAR(255),
    weight DOUBLE PRECISION,
    CONSTRAINT fk_manufacturer
        FOREIGN KEY (manufacturer_id)
        REFERENCES manufacturers (id)
);


CREATE TABLE salespersons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE transactions (
    datetime timestamp,
    salespersons_id INT,
    car_id INT,
    customer_name VARCHAR(255),
    customer_phone VARCHAR(50),
    price DOUBLE PRECISION,
    CONSTRAINT fk_cars
        FOREIGN KEY (car_id)
        REFERENCES cars (id),
    CONSTRAINT fk_salespersons
        FOREIGN KEY (salespersons_id)
        REFERENCES salespersons (id)
);
