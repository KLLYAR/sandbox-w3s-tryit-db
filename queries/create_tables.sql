CREATE TABLE customers(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_name VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE category(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE employees(
    id INT PRIMARY KEY,
    last_name VARCHAR(100),
    first_name VARCHAR(100),
    birth_date DATE,
    photo VARCHAR(100),
    notes TEXT
);

CREATE TABLE shippers(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(100)
);

CREATE TABLE suppliers(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_name VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(100),
    country VARCHAR(100),
    phone VARCHAR(100)
);

CREATE TABLE orders(
    id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date VARCHAR(100),
    shipper_id INT,

    FOREIGN KEY(customer_id) REFERENCES customers(id),
    FOREIGN KEY(employee_id) REFERENCES employees(id),
    FOREIGN KEY(shipper_id) REFERENCES shippers(id)
);

CREATE TABLE products(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    supplier_id INT,
    category_id INT,
    unit INT,
    price DOUBLE,

    FOREIGN KEY(supplier_id) REFERENCES shippers(id),
    FOREIGN KEY(category_id) REFERENCES category(id)
);

CREATE TABLE order_details(
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);