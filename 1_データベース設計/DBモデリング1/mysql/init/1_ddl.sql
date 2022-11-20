CREATE DATABASE IF NOT EXISTS praha_sushi DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS praha_sushi.categories(
  category_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  show_category boolean NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.genres(
  genre_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  genre_name VARCHAR(50) NOT NULL,
  show_genre boolean NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.customers(
  customer_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  customer_name VARCHAR(50) NOT NULL,
  customer_phone VARCHAR(20) NOT NULL,
  customer_email VARCHAR(50) NOT NULL,
  customer_address VARCHAR(100) NOT NULL,
  show_customer boolean NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.rice_sizes(
  rice_size_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  rice_size_name VARCHAR(20) NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.areas(
  area_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  area_name VARCHAR(50) NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.shops(
  shop_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  shop_name VARCHAR(50) NOT NULL,
  shop_address VARCHAR(100) NOT NULL,
  area_id INT NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.taxes(
  tax_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tax_name VARCHAR(50) NOT NULL,
  tax_rate decimal(3,2) NOT NULL,
  show_tax boolean NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS praha_sushi.menus(
  menu_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  category_id INT NOT NULL,
  genre_id INT NOT NULL,
  menu_name varchar(50) NOT NULL,
  price INT NOT NULL,
  take_out_enabled boolean NOT NULL,
  show_menu boolean NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX cate_ind (category_id),
  FOREIGN KEY (category_id) 
    REFERENCES categories(category_id)
    ON DELETE CASCADE,
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
  paid_exists boolean NOT NULL,
  cancel_exists boolean NOT NULL,
  ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  bought_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  wasabi_exists boolean NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
