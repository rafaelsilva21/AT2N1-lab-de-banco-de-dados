CREATE DATABASE IF NOT EXISTS Riqueza;
USE Riqueza;

-- -----------------------------------------------------
-- Table `Riqueza`.`Pais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Riqueza`.`Pais` (
  `idPais` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `qtdHabitantes` DOUBLE NOT NULL ,
  PRIMARY KEY (`idPais`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Riqueza`.`Industria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Riqueza`.`Industria` (
  `idIndustria` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `transacao` DOUBLE NOT NULL ,
  PRIMARY KEY (`idIndustria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Riqueza`.`Pessoa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Riqueza`.`Pessoa` (
  `idPessoa` INT NOT NULL ,
  `nomeCompleto` VARCHAR(100) NOT NULL ,
  `netWorth` DOUBLE NOT NULL ,
  `ytd` DOUBLE NOT NULL ,
  `Pais_idPais` INT NOT NULL ,
  `Industria_idIndustria` INT NOT NULL ,
  PRIMARY KEY (`idPessoa`) ,
  UNIQUE INDEX `idPessoa_UNIQUE` (`idPessoa` ASC) ,
  UNIQUE INDEX `nomeCompleto_UNIQUE` (`nomeCompleto` ASC) ,
  INDEX `fk_Pessoa_Pais_idx` (`Pais_idPais` ASC) ,
  INDEX `fk_Pessoa_Industria1_idx` (`Industria_idIndustria` ASC) ,
  CONSTRAINT `fk_Pessoa_Pais`
    FOREIGN KEY (`Pais_idPais` )
    REFERENCES `Riqueza`.`Pais` (`idPais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Industria1`
    FOREIGN KEY (`Industria_idIndustria` )
    REFERENCES `Riqueza`.`Industria` (`idIndustria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Riqueza`.`Universidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Riqueza`.`Universidade` (
  `idUniversidade` INT NOT NULL ,
  `nome` VARCHAR(100) NOT NULL ,
  `pontGeral` VARCHAR(45) NOT NULL ,
  `pontEnsino` VARCHAR(45) NOT NULL ,
  `pontPesquisa` VARCHAR(45) NOT NULL ,
  `pontCitacao` VARCHAR(45) NOT NULL ,
  `Pais_idPais` INT NOT NULL ,
  PRIMARY KEY (`idUniversidade`) ,
  INDEX `fk_Universidade_Pais1_idx` (`Pais_idPais` ASC) ,
  CONSTRAINT `fk_Universidade_Pais1`
    FOREIGN KEY (`Pais_idPais` )
    REFERENCES `Riqueza`.`Pais` (`idPais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Riqueza`.`Cursos_Oferecidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Riqueza`.`Cursos_Oferecidos` (
  `idCursos_Oferecidos` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCursos_Oferecidos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Riqueza`.`Cursos_Oferecidos_Universidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Riqueza`.`Cursos_Oferecidos_Universidade` (
  `Cursos_Oferecidos_idCursos_Oferecidos` INT NOT NULL ,
  `Universidade_idUniversidade` INT NOT NULL ,
  PRIMARY KEY (`Cursos_Oferecidos_idCursos_Oferecidos`, `Universidade_idUniversidade`) ,
  INDEX `fk_Cursos_Oferecidos_has_Universidade_Universidade1_idx` (`Universidade_idUniversidade` ASC) ,
  INDEX `fk_Cursos_Oferecidos_has_Universidade_Cursos_Oferecidos1_idx` (`Cursos_Oferecidos_idCursos_Oferecidos` ASC) ,
  CONSTRAINT `fk_Cursos_Oferecidos_has_Universidade_Cursos_Oferecidos1`
    FOREIGN KEY (`Cursos_Oferecidos_idCursos_Oferecidos` )
    REFERENCES `Riqueza`.`Cursos_Oferecidos` (`idCursos_Oferecidos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cursos_Oferecidos_has_Universidade_Universidade1`
    FOREIGN KEY (`Universidade_idUniversidade` )
    REFERENCES `Riqueza`.`Universidade` (`idUniversidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Riqueza` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
