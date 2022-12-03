CREATE DATABASE IF NOT EXISTS praha_sushi DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS praha_sushi.categories(
  category_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  category_showable BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_sushi.genres(
  genre_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  category_id INT NOT NULL,
  genre_name VARCHAR(50) NOT NULL,
  genre_showable BOOLEAN NOT NULL,
  INDEX cate_ind (category_id),
  FOREIGN KEY (category_id) 
    REFERENCES categories(category_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_sushi.customers(
  customer_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  customer_pw VARCHAR(20) NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  customer_phone VARCHAR(20) NOT NULL,
  customer_email VARCHAR(50) NOT NULL,
  customer_address VARCHAR(100) NOT NULL,
  withdrawn BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_sushi.rice_sizes(
  rice_size_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  rice_size_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_sushi.areas(
  area_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  area_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_sushi.shops(
  shop_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  shop_name VARCHAR(50) NOT NULL,
  shop_address VARCHAR(100) NOT NULL,
  area_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_sushi.taxes(
  tax_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tax_name VARCHAR(50) NOT NULL,
  tax_rate decimal(3,2) NOT NULL,
  tax_showable BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS praha_sushi.menus(
  menu_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  genre_id INT NOT NULL,
  menu_name varchar(50) NOT NULL,
  price INT NOT NULL,
  take_out_enabled BOOLEAN NOT NULL,
  menu_showable BOOLEAN NOT NULL,
  INDEX genr_ind (genre_id),
  FOREIGN KEY (genre_id) 
    REFERENCES genres(genre_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_sushi.orders(
  order_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  tax_id INT NOT NULL,
  shop_id INT NOT NULL,
  is_paid BOOLEAN NOT NULL,
  is_cancel BOOLEAN NOT NULL,
  ordered_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  bought_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX cus_ind (customer_id),
  FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id)
    ON DELETE CASCADE,
  INDEX tax_ind (tax_id),
  FOREIGN KEY (tax_id) 
    REFERENCES taxes(tax_id)
    ON DELETE CASCADE,
  INDEX sho_ind (shop_id),
  FOREIGN KEY (shop_id) 
    REFERENCES shops(shop_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS praha_sushi.order_menus(
  ordet_menu_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  order_id INT NOT NULL,
  menu_id INT NOT NULL,
  rice_size_id INT NOT NULL,
  ordet_menu_quantity INT NOT NULL,
  wasabi_exists BOOLEAN NOT NULL,
  INDEX ord_ind (order_id),
  FOREIGN KEY (order_id) 
    REFERENCES orders(order_id)
    ON DELETE CASCADE,
  INDEX menu_ind (menu_id),
  FOREIGN KEY (menu_id) 
    REFERENCES menus(menu_id)
    ON DELETE CASCADE,
  INDEX rice_ind (rice_size_id),
  FOREIGN KEY (rice_size_id) 
    REFERENCES rice_sizes(rice_size_id)
    ON DELETE CASCADE
);
