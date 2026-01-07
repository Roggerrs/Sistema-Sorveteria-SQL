-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `ID_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TAMANHO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TAMANHO` (
  `ID_TAMANHO` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(20) NOT NULL,
  `PRECO_BASE` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`ID_TAMANHO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PEDIDO` (
  `ID_PEDIDO` INT NOT NULL AUTO_INCREMENT,
  `DATA_PEDIDO` DATETIME NOT NULL,
  `CLIENTE_ID_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  INDEX `fk_PEDIDO_CLIENTE_idx` (`CLIENTE_ID_CLIENTE` ASC),
  CONSTRAINT `fk_PEDIDO_CLIENTE`
    FOREIGN KEY (`CLIENTE_ID_CLIENTE`)
    REFERENCES `mydb`.`CLIENTE` (`ID_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SORVETE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SORVETE` (
  `ID_SORVETE` INT NOT NULL AUTO_INCREMENT,
  `PEDIDO_ID_PEDIDO` INT NOT NULL,
  `TAMANHO_ID_TAMANHO` INT NOT NULL,
  PRIMARY KEY (`ID_SORVETE`),
  INDEX `fk_SORVETE_PEDIDO1_idx` (`PEDIDO_ID_PEDIDO` ASC),
  INDEX `fk_SORVETE_TAMANHO1_idx` (`TAMANHO_ID_TAMANHO` ASC),
  CONSTRAINT `fk_SORVETE_PEDIDO1`
    FOREIGN KEY (`PEDIDO_ID_PEDIDO`)
    REFERENCES `mydb`.`PEDIDO` (`ID_PEDIDO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SORVETE_TAMANHO1`
    FOREIGN KEY (`TAMANHO_ID_TAMANHO`)
    REFERENCES `mydb`.`TAMANHO` (`ID_TAMANHO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SABOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SABOR` (
  `ID_SABOR` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_SABOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SORVETE_has_SABOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SORVETE_has_SABOR` (
  `SORVETE_ID_SORVETE` INT NOT NULL,
  `SABOR_ID_SABOR` INT NOT NULL,
  PRIMARY KEY (`SORVETE_ID_SORVETE`, `SABOR_ID_SABOR`),
  INDEX `fk_SORVETE_has_SABOR_SABOR1_idx` (`SABOR_ID_SABOR` ASC),
  INDEX `fk_SORVETE_has_SABOR_SORVETE1_idx` (`SORVETE_ID_SORVETE` ASC),
  CONSTRAINT `fk_SORVETE_has_SABOR_SORVETE1`
    FOREIGN KEY (`SORVETE_ID_SORVETE`)
    REFERENCES `mydb`.`SORVETE` (`ID_SORVETE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SORVETE_has_SABOR_SABOR1`
    FOREIGN KEY (`SABOR_ID_SABOR`)
    REFERENCES `mydb`.`SABOR` (`ID_SABOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- =====================================================
-- CONFIGURAÇÕES INICIAIS
-- =====================================================
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- =====================================================
-- SCHEMA
-- =====================================================
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

-- =====================================================
-- TABELA CLIENTE
-- =====================================================
CREATE TABLE IF NOT EXISTS `CLIENTE` (
  `ID_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`)
) ENGINE = InnoDB;

-- =====================================================
-- TABELA TAMANHO
-- =====================================================
CREATE TABLE IF NOT EXISTS `TAMANHO` (
  `ID_TAMANHO` INT NOT NULL AUTO_INCREMENT,
  `DESCRICAO` VARCHAR(20) NOT NULL,
  `PRECO_BASE` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`ID_TAMANHO`)
) ENGINE = InnoDB;

-- =====================================================
-- TABELA SABOR
-- =====================================================
CREATE TABLE IF NOT EXISTS `SABOR` (
  `ID_SABOR` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_SABOR`)
) ENGINE = InnoDB;

-- =====================================================
-- TABELA PEDIDO
-- =====================================================
CREATE TABLE IF NOT EXISTS `PEDIDO` (
  `ID_PEDIDO` INT NOT NULL AUTO_INCREMENT,
  `DATA_PEDIDO` DATETIME NOT NULL,
  `CLIENTE_ID_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  INDEX `fk_PEDIDO_CLIENTE_idx` (`CLIENTE_ID_CLIENTE`),
  CONSTRAINT `fk_PEDIDO_CLIENTE`
    FOREIGN KEY (`CLIENTE_ID_CLIENTE`)
    REFERENCES `CLIENTE` (`ID_CLIENTE`)
) ENGINE = InnoDB;

-- =====================================================
-- TABELA SORVETE
-- =====================================================
CREATE TABLE IF NOT EXISTS `SORVETE` (
  `ID_SORVETE` INT NOT NULL AUTO_INCREMENT,
  `PEDIDO_ID_PEDIDO` INT NOT NULL,
  `TAMANHO_ID_TAMANHO` INT NOT NULL,
  PRIMARY KEY (`ID_SORVETE`),
  CONSTRAINT `fk_SORVETE_PEDIDO`
    FOREIGN KEY (`PEDIDO_ID_PEDIDO`)
    REFERENCES `PEDIDO` (`ID_PEDIDO`),
  CONSTRAINT `fk_SORVETE_TAMANHO`
    FOREIGN KEY (`TAMANHO_ID_TAMANHO`)
    REFERENCES `TAMANHO` (`ID_TAMANHO`)
) ENGINE = InnoDB;

-- =====================================================
-- TABELA ASSOCIATIVA SORVETE_HAS_SABOR
-- =====================================================
CREATE TABLE IF NOT EXISTS `SORVETE_has_SABOR` (
  `SORVETE_ID_SORVETE` INT NOT NULL,
  `SABOR_ID_SABOR` INT NOT NULL,
  PRIMARY KEY (`SORVETE_ID_SORVETE`, `SABOR_ID_SABOR`),
  CONSTRAINT `fk_SS_SORVETE`
    FOREIGN KEY (`SORVETE_ID_SORVETE`)
    REFERENCES `SORVETE` (`ID_SORVETE`),
  CONSTRAINT `fk_SS_SABOR`
    FOREIGN KEY (`SABOR_ID_SABOR`)
    REFERENCES `SABOR` (`ID_SABOR`)
) ENGINE = InnoDB;

-- =====================================================
-- INSERTS
-- =====================================================

-- CLIENTES
INSERT INTO CLIENTE (NOME) VALUES
('João Silva'),
('Maria Oliveira');

-- TAMANHOS
INSERT INTO TAMANHO (DESCRICAO, PRECO_BASE) VALUES
('Médio', 8.50),
('Grande', 12.00);

-- SABORES (5)
INSERT INTO SABOR (NOME) VALUES
('Chocolate'),
('Morango'),
('Baunilha'),
('Limão'),
('Doce de Leite');

-- PEDIDOS
INSERT INTO PEDIDO (DATA_PEDIDO, CLIENTE_ID_CLIENTE) VALUES
(NOW(), 1),
(NOW(), 2);

-- SORVETES
INSERT INTO SORVETE (PEDIDO_ID_PEDIDO, TAMANHO_ID_TAMANHO) VALUES
(1, 1),
(1, 2),
(2, 2);

-- SORVETE x SABOR
INSERT INTO SORVETE_has_SABOR VALUES (1, 1);
INSERT INTO SORVETE_has_SABOR VALUES (1, 2);
INSERT INTO SORVETE_has_SABOR VALUES (2, 3);
INSERT INTO SORVETE_has_SABOR VALUES (3, 4);
INSERT INTO SORVETE_has_SABOR VALUES (3, 5);

-- =====================================================
-- SELECTS
-- =====================================================

-- Todos os clientes
SELECT * FROM CLIENTE;

-- Pedidos com cliente
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME
FROM PEDIDO P
JOIN CLIENTE C ON C.ID_CLIENTE = P.CLIENTE_ID_CLIENTE;

-- Sorvetes com tamanho
SELECT S.ID_SORVETE, T.DESCRICAO, T.PRECO_BASE
FROM SORVETE S
JOIN TAMANHO T ON T.ID_TAMANHO = S.TAMANHO_ID_TAMANHO;

-- Sorvetes com sabores
SELECT S.ID_SORVETE, SA.NOME AS SABOR
FROM SORVETE S
JOIN SORVETE_has_SABOR SS ON SS.SORVETE_ID_SORVETE = S.ID_SORVETE
JOIN SABOR SA ON SA.ID_SABOR = SS.SABOR_ID_SABOR
ORDER BY S.ID_SORVETE;

-- Pedido completo
SELECT 
  C.NOME AS CLIENTE,
  P.ID_PEDIDO,
  T.DESCRICAO AS TAMANHO,
  T.PRECO_BASE AS PRECO_BASE,
  SA.NOME AS SABOR
FROM PEDIDO P
JOIN CLIENTE C ON C.ID_CLIENTE = P.CLIENTE_ID_CLIENTE
JOIN SORVETE S ON S.PEDIDO_ID_PEDIDO = P.ID_PEDIDO
JOIN TAMANHO T ON T.ID_TAMANHO = S.TAMANHO_ID_TAMANHO
JOIN SORVETE_has_SABOR SS ON SS.SORVETE_ID_SORVETE = S.ID_SORVETE
JOIN SABOR SA ON SA.ID_SABOR = SS.SABOR_ID_SABOR
ORDER BY P.ID_PEDIDO, S.ID_SORVETE;

-- =====================================================
-- FINALIZAÇÃO
-- =====================================================
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

