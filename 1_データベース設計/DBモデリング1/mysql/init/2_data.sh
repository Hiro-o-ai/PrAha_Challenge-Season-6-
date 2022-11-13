mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/categories.csv' INTO TABLE categories FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2) SET id=@1, name=@2;"
mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/genres.csv' INTO TABLE genres FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2) SET id=@1, name=@2;"
mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/customers.csv' INTO TABLE customers FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2,@3) SET id=@1, name=@2, phone=@3;"
mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/taxes.csv' INTO TABLE taxes FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2) SET id=@1, tax=@2;"
mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/menus.csv' INTO TABLE menus FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2,@3,@4,@5) SET id=@1, category_id=@2, genre_id=@3, name=@4, price=@5;"
mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/orders.csv' INTO TABLE orders FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2,@3,@4,@5) SET id=@1, customer_id=@2, tax_id=@3, is_paid=@4, is_eat_in=@5;"
mysql -uroot -pmysql praha_sushi -e "LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/order_menus.csv' INTO TABLE order_menus FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (@1,@2,@3,@4) SET id=@1, order_id=@2, menu_id=@3, is_wasabi=@4;"

