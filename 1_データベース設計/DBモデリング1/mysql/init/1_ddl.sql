CREATE DATABASE IF NOT EXISTS praha_sushi DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS praha_sushi.categories(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.genres(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.customers(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.taxes(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tax decimal(3,2) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.menus(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  category_id INT NOT NULL,
  genre_id INT NOT NULL,
  name varchar(50) NOT NULL,
  price INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX cate_ind (category_id),
  FOREIGN KEY (category_id) 
    REFERENCES categories(id)
    ON DELETE CASCADE,
  INDEX genr_ind (genre_id),
  FOREIGN KEY (genre_id) 
    REFERENCES genres(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_sushi.orders(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  tax_id INT NOT NULL,
  is_paid boolean NOT NULL,
  is_eat_in boolean NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX cus_ind (customer_id),
  FOREIGN KEY (customer_id) 
    REFERENCES customers(id)
    ON DELETE CASCADE,
  INDEX tax_ind (tax_id),
  FOREIGN KEY (tax_id) 
    REFERENCES taxes(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_sushi.order_menus(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  order_id INT NOT NULL,
  menu_id INT NOT NULL,
  is_wasabi boolean NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX ord_ind (order_id),
  FOREIGN KEY (order_id) 
    REFERENCES orders(id)
    ON DELETE CASCADE,
  INDEX menu_ind (menu_id),
  FOREIGN KEY (menu_id) 
    REFERENCES menus(id)
    ON DELETE CASCADE
);
