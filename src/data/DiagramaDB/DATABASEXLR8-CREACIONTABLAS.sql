-- MySQL Script generated by MySQL Workbench
-- Wed Jan 25 20:30:43 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema xrl8
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `xrl8` ;

-- -----------------------------------------------------
-- Schema xrl8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `xrl8` DEFAULT CHARACTER SET utf8mb4 ;
USE `xrl8` ;

-- -----------------------------------------------------
-- Table `xrl8`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xrl8`.`users` ;

CREATE TABLE IF NOT EXISTS `xrl8`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` INT(11) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `genre` VARCHAR(100) NOT NULL,
  `id_users_categories` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_users_categories1_idx` (`id_users_categories` ASC)  )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Base de datos de nuestros clientes	';


-- -----------------------------------------------------
-- Table `xrl8`.`users_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xrl8`.`users_categories` ;

CREATE TABLE IF NOT EXISTS `xrl8`.`users_categories` (
  `id` TINYINT(1) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)  ,
  CONSTRAINT `id_users_categories`
    FOREIGN KEY (`id`)
    REFERENCES `xrl8`.`users` (`id_users_categories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `xrl8`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xrl8`.`products` ;

CREATE TABLE IF NOT EXISTS `xrl8`.`products` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` INT(11) NOT NULL,
  `price_discount` INT(11) NOT NULL,
  `size` VARCHAR(100) NOT NULL,
  `color` VARCHAR(100) NOT NULL,
  `genre_product` VARCHAR(100) NOT NULL,
  `type` VARCHAR(100) NOT NULL,
  `new` TINYINT(1) NOT NULL,
  `created` DATE NOT NULL,
  `updated` DATE NOT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `id_purchase_order` INT(11) NOT NULL,
  `id_product_photo` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Base de datos de nuestros productos';


-- -----------------------------------------------------
-- Table `xrl8`.`purchase_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xrl8`.`purchase_orders` ;

CREATE TABLE IF NOT EXISTS `xrl8`.`purchase_orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `order_value` INT(11) NOT NULL,
  `order_cart` INT(11) NOT NULL,
  `order_payment` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_purchase_orders_users1_idx` (`users_id` ASC)  ,
  CONSTRAINT `fk_purchase_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `xrl8`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Ordenes de compras';


-- -----------------------------------------------------
-- Table `xrl8`.`orders_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xrl8`.`orders_products` ;

CREATE TABLE IF NOT EXISTS `xrl8`.`orders_products` (
  `id` INT(11) NOT NULL,
  `id_product` INT(11) NOT NULL,
  `id_purchase_orders` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_has_purchase_orders_purchase_orders1_idx` (`id_purchase_orders` ASC)  ,
  INDEX `fk_products_has_purchase_orders_products1_idx` (`id_product` ASC)  ,
  CONSTRAINT `fk_products_has_purchase_orders_products1`
    FOREIGN KEY (`id_product`)
    REFERENCES `xrl8`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_purchase_orders_purchase_orders1`
    FOREIGN KEY (`id_purchase_orders`)
    REFERENCES `xrl8`.`purchase_orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `xrl8`.`products_photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xrl8`.`products_photos` ;

CREATE TABLE IF NOT EXISTS `xrl8`.`products_photos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `photo1` VARCHAR(255) NOT NULL,
  `photo2` VARCHAR(255) NOT NULL,
  `photo3` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products`
    FOREIGN KEY (`id`)
    REFERENCES `xrl8`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'Base de datos de fotos de nuestros productos';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;