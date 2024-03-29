-- MySQL Script generated by MySQL Workbench
-- Mon Jul  8 20:32:25 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`racas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`racas` (
  `id_animal` INT NOT NULL AUTO_INCREMENT,
  `raca` VARCHAR(45) NULL,
  `sintomas` VARCHAR(200) NULL,
  `origem` INT NULL,
  `tipo` INT NULL,
  `porte` VARCHAR(45) NULL,
  PRIMARY KEY (`id_animal`),
  UNIQUE INDEX `id_animal_UNIQUE` (`id_animal` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clinicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clinicas` (
  `id_clinica` INT NOT NULL AUTO_INCREMENT,
  `cnpj` INT NOT NULL,
  `localizacao` VARCHAR(100) NOT NULL,
  `status_atendimento` INT NOT NULL,
  PRIMARY KEY (`id_clinica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cpf` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NULL,
  `categoria` INT NULL,
  `clinica_id_clinica` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `clinica_id_clinica`),
  INDEX `fk_usuario_clinica1_idx` (`clinica_id_clinica` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_clinica1`
    FOREIGN KEY (`clinica_id_clinica`)
    REFERENCES `mydb`.`clinicas` (`id_clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ongs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ongs` (
  `id_ong` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `localizacao` VARCHAR(100) NULL,
  PRIMARY KEY (`id_ong`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veterinarios` (
  `id_veterinario` INT NOT NULL AUTO_INCREMENT,
  `crmv` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `disponibilidade` INT NOT NULL,
  PRIMARY KEY (`id_veterinario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`animais_identificados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`animais_identificados` (
  `usuario_id_usuario` INT NOT NULL,
  `animal_id_animal` INT NOT NULL,
  `localizacao` VARCHAR(100) NULL,
  `foto` BLOB NULL,
  `horario` DATETIME NULL,
  `sintoma` VARCHAR(200) NULL,
  `nome` VARCHAR(45) NULL,
  `ong_id_ong` INT NOT NULL,
  PRIMARY KEY (`usuario_id_usuario`, `animal_id_animal`, `ong_id_ong`),
  INDEX `fk_usuario_has_animal_animal1_idx` (`animal_id_animal` ASC) VISIBLE,
  INDEX `fk_usuario_has_animal_usuario_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_usuario_animal_ong1_idx` (`ong_id_ong` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_animal_usuario`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_animal_animal1`
    FOREIGN KEY (`animal_id_animal`)
    REFERENCES `mydb`.`racas` (`id_animal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_animal_ong1`
    FOREIGN KEY (`ong_id_ong`)
    REFERENCES `mydb`.`ongs` (`id_ong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clinicas_veterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clinicas_veterinarios` (
  `clinica_id_clinica` INT NOT NULL,
  `veterinario_id_veterinario` INT NOT NULL,
  PRIMARY KEY (`clinica_id_clinica`, `veterinario_id_veterinario`),
  INDEX `fk_clinica_has_veterinario_veterinario1_idx` (`veterinario_id_veterinario` ASC) VISIBLE,
  INDEX `fk_clinica_has_veterinario_clinica1_idx` (`clinica_id_clinica` ASC) VISIBLE,
  CONSTRAINT `fk_clinica_has_veterinario_clinica1`
    FOREIGN KEY (`clinica_id_clinica`)
    REFERENCES `mydb`.`clinicas` (`id_clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clinica_has_veterinario_veterinario1`
    FOREIGN KEY (`veterinario_id_veterinario`)
    REFERENCES `mydb`.`veterinarios` (`id_veterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ong_has_clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ong_has_clinica` (
  `ong_id_ong` INT NOT NULL,
  `clinica_id_clinica` INT NOT NULL,
  PRIMARY KEY (`ong_id_ong`, `clinica_id_clinica`),
  INDEX `fk_ong_has_clinica_clinica1_idx` (`clinica_id_clinica` ASC) VISIBLE,
  INDEX `fk_ong_has_clinica_ong1_idx` (`ong_id_ong` ASC) VISIBLE,
  CONSTRAINT `fk_ong_has_clinica_ong1`
    FOREIGN KEY (`ong_id_ong`)
    REFERENCES `mydb`.`ongs` (`id_ong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ong_has_clinica_clinica1`
    FOREIGN KEY (`clinica_id_clinica`)
    REFERENCES `mydb`.`clinicas` (`id_clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`atendimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`atendimentos` (
  `id_atendimento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(200) NULL,
  `animais_identificados_usuario_id_usuario` INT NOT NULL,
  `animais_identificados_animal_id_animal` INT NOT NULL,
  `animais_identificados_ong_id_ong` INT NOT NULL,
  `clinica_id_clinica` INT NOT NULL,
  PRIMARY KEY (`id_atendimento`, `animais_identificados_usuario_id_usuario`, `animais_identificados_animal_id_animal`, `animais_identificados_ong_id_ong`, `clinica_id_clinica`),
  UNIQUE INDEX `id_animal_UNIQUE` (`id_atendimento` ASC) VISIBLE,
  INDEX `fk_atendimento_animais_identificados1_idx` (`animais_identificados_usuario_id_usuario` ASC, `animais_identificados_animal_id_animal` ASC, `animais_identificados_ong_id_ong` ASC) VISIBLE,
  INDEX `fk_atendimento_clinica1_idx` (`clinica_id_clinica` ASC) VISIBLE,
  CONSTRAINT `fk_atendimento_animais_identificados1`
    FOREIGN KEY (`animais_identificados_usuario_id_usuario` , `animais_identificados_animal_id_animal` , `animais_identificados_ong_id_ong`)
    REFERENCES `mydb`.`animais_identificados` (`usuario_id_usuario` , `animal_id_animal` , `ong_id_ong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atendimento_clinica1`
    FOREIGN KEY (`clinica_id_clinica`)
    REFERENCES `mydb`.`clinicas` (`id_clinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
