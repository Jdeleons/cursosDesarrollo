-- MySQL Script generated by MySQL Workbench
-- Fri 25 May 2018 11:26:00 PM CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbventasLaravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbventasLaravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbventasLaravel` DEFAULT CHARACTER SET utf8 ;
USE `dbventasLaravel` ;

-- -----------------------------------------------------
-- Table `dbventasLaravel`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `condicion` TINYINT NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventasLaravel`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`articulo` (
  `idarticulo` INT NOT NULL AUTO_INCREMENT,
  `idcategoria` INT NOT NULL,
  `codigo` VARCHAR(45) NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `stock` INT NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  `imagen` VARCHAR(45) NULL,
  `estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idarticulo`),
  INDEX `fk_articulo_categoria_idx` (`idcategoria` ASC),
  CONSTRAINT `fk_articulo_categoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `dbventasLaravel`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventasLaravel`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `tipo_persona` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `tipo_documento` VARCHAR(20) NULL,
  `num_documento` VARCHAR(20) NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` VARCHAR(15) NULL,
  `email` VARCHAR(45) NULL,
  `personacol` VARCHAR(45) NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventasLaravel`.`ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`ingreso` (
  `idingreso` INT NOT NULL AUTO_INCREMENT,
  `idproveedor` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `serie_comprobante` VARCHAR(7) NULL,
  `num_comprobante` VARCHAR(7) NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `impuesto` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idingreso`),
  INDEX `fk_ingreso_persona_idx` (`idproveedor` ASC),
  CONSTRAINT `fk_ingreso_persona`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `dbventasLaravel`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventasLaravel`.`detalle_ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`detalle_ingreso` (
  `iddetalle_ingreso` INT NOT NULL AUTO_INCREMENT,
  `idingreso` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_compra` DECIMAL(11,2) NOT NULL,
  `precio_venta` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ingreso`),
  INDEX `fk_detalle_ingreso_idx` (`idingreso` ASC),
  INDEX `fk_detalle_ingreso_articulo_idx` (`idarticulo` ASC),
  CONSTRAINT `fk_detalle_ingreso`
    FOREIGN KEY (`idingreso`)
    REFERENCES `dbventasLaravel`.`ingreso` (`idingreso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ingreso_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `dbventasLaravel`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventasLaravel`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `tipo_comprobante` VARCHAR(20) NOT NULL,
  `serie_comprobante` VARCHAR(10) NOT NULL,
  `num_comprobante` VARCHAR(10) NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `impuesto` VARCHAR(45) NOT NULL,
  `total_venta` DECIMAL(11,2) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_venta_cliente_idx` (`idcliente` ASC),
  CONSTRAINT `fk_venta_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `dbventasLaravel`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbventasLaravel`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbventasLaravel`.`detalle_venta` (
  `iddetalle` INT NOT NULL AUTO_INCREMENT,
  `idventa` INT NOT NULL,
  `idarticulo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_venta` DECIMAL(11,2) NOT NULL,
  `descuento` DECIMAL(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle`),
  INDEX `fk_detalle_venta_articulo_idx` (`idarticulo` ASC),
  INDEX `fk_detalle_venta_idx` (`idventa` ASC),
  CONSTRAINT `fk_detalle_venta_articulo`
    FOREIGN KEY (`idarticulo`)
    REFERENCES `dbventasLaravel`.`articulo` (`idarticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta`
    FOREIGN KEY (`idventa`)
    REFERENCES `dbventasLaravel`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;