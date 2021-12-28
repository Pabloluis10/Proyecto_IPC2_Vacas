CREATE SCHEMA IF NOT EXISTS `Practica` ;
USE `Practica` ;

-- -----------------------------------------------------
-- Table `Practica`.`Secretaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Secretaria` (
  `CUI` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `telefono` VARCHAR(15) NULL,
  PRIMARY KEY (`CUI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`Laboratorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Laboratorista` (
  `CUI` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `no_Colegiado` VARCHAR(45) NULL,
  `telefono` VARCHAR(15) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`CUI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Administrador` (
  `CUI` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `telefono` VARCHAR(15) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`CUI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`Examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Examen` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NULL,
  `MontoCosto` DOUBLE NULL,
  `MontoPagar` DOUBLE NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Paciente` (
  `Codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `CUI` VARCHAR(15) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`RealizarExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`RealizarExamen` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `Paciente_Codigo` INT NULL,
  `Examen_Codigo` INT NULL,
  `Laboratorista_CUI` VARCHAR(15) NULL,
  `Resultado` VARCHAR(45) NULL,
  `hecho` TINYINT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Paciente_has_Examen_Examen1_idx` (`Examen_Codigo` ASC) VISIBLE,
  INDEX `fk_Paciente_has_Examen_Paciente1_idx` (`Paciente_Codigo` ASC) VISIBLE,
  INDEX `fk_Paciente_has_Examen_Laboratorista1_idx` (`Laboratorista_CUI` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_has_Examen_Paciente1`
    FOREIGN KEY (`Paciente_Codigo`)
    REFERENCES `Practica`.`Paciente` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_has_Examen_Examen1`
    FOREIGN KEY (`Examen_Codigo`)
    REFERENCES `Practica`.`Examen` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_has_Examen_Laboratorista1`
    FOREIGN KEY (`Laboratorista_CUI`)
    REFERENCES `Practica`.`Laboratorista` (`CUI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `Secretaria_CUI` VARCHAR(15) NOT NULL,
  `Monto` DOUBLE NULL,
  PRIMARY KEY (`idFactura`, `Secretaria_CUI`),
  INDEX `fk_Factura_Secretaria1_idx` (`Secretaria_CUI` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Secretaria1`
    FOREIGN KEY (`Secretaria_CUI`)
    REFERENCES `Practica`.`Secretaria` (`CUI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Practica`.`Factura_has_RealizarExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica`.`Factura_has_RealizarExamen` (
  `Factura_idFactura` INT NOT NULL AUTO_INCREMENT,
  `Factura_Secretaria_CUI` VARCHAR(15) NULL,
  `RealizarExamen_codigo` INT NULL,
  `detalle` VARCHAR(45) NULL,
  `MontoDetalle` DOUBLE NULL,
  PRIMARY KEY (`Factura_idFactura`),
  INDEX `fk_Factura_has_RealizarExamen_RealizarExamen1_idx` (`RealizarExamen_codigo` ASC) VISIBLE,
  INDEX `fk_Factura_has_RealizarExamen_Factura1_idx` (`Factura_idFactura` ASC, `Factura_Secretaria_CUI` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_has_RealizarExamen_Factura1`
    FOREIGN KEY (`Factura_idFactura` , `Factura_Secretaria_CUI`)
    REFERENCES `Practica`.`Factura` (`idFactura` , `Secretaria_CUI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_has_RealizarExamen_RealizarExamen1`
    FOREIGN KEY (`RealizarExamen_codigo`)
    REFERENCES `Practica`.`RealizarExamen` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
