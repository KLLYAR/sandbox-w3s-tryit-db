CREATE TABLE customers(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE category(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT 
);

CREATE TABLE employees(
    id INT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    photo VARCHAR(100),
    notes TEXT
);

CREATE TABLE shippers(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL
);

CREATE TABLE suppliers(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL
);

CREATE TABLE orders(
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date VARCHAR(100) NOT NULL,
    shipper_id INT NOT NULL,

    FOREIGN KEY(customer_id) REFERENCES customers(id),
    FOREIGN KEY(employee_id) REFERENCES employees(id),
    FOREIGN KEY(shipper_id) REFERENCES shippers(id)
);

CREATE TABLE products(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    supplier_id INT NOT NULL,
    category_id INT NOT NULL,
    unit INT NOT NULL,
    price DOUBLE NOT NULL,

    FOREIGN KEY(supplier_id) REFERENCES shippers(id),
    FOREIGN KEY(category_id) REFERENCES category(id)
);

CREATE TABLE order_details(
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);