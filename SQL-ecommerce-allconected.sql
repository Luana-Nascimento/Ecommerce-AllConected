-- MySQL Script generated by MySQL Workbench
-- Fri May 17 12:27:43 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_ecommerce_allconected
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_ecommerce_allconected
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_ecommerce_allconected` DEFAULT CHARACTER SET utf8 ;
USE `db_ecommerce_allconected` ;

-- -----------------------------------------------------
-- Table `db_ecommerce_allconected`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ecommerce_allconected`.`tb_categoria` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `voltagem` VARCHAR(255) NULL,
  `tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ecommerce_allconected`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ecommerce_allconected`.`tb_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ecommerce_allconected`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ecommerce_allconected`.`tb_produto` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `quantidade` INT NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `tamanho` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NOT NULL,
  `tb_categoria_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `tb_categoria_id`, `tb_usuario_id`),
  INDEX `fk_tb_produto_tb_categoria_idx` (`tb_categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_produto_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produto_tb_categoria`
    FOREIGN KEY (`tb_categoria_id`)
    REFERENCES `db_ecommerce_allconected`.`tb_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produto_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_ecommerce_allconected`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
