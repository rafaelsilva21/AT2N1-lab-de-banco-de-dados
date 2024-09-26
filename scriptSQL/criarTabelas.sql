CREATE DATABASE IF NOT EXISTS Wealth;
USE Wealth;

-- -----------------------------------------------------
-- Table Pais
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Country (
  idCountry INT NOT NULL ,
  name VARCHAR(45) NOT NULL ,
  populaceMi DOUBLE NOT NULL ,
  PRIMARY KEY (idCountry)
);


-- -----------------------------------------------------
-- Table Industria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Industry (
  idIndustry INT NOT NULL ,
  name VARCHAR(60) NOT NULL ,
  incomesBi DOUBLE NOT NULL ,
  PRIMARY KEY (idIndustry)
);


-- -----------------------------------------------------
-- Table Pessoa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Person (
  idPerson INT NOT NULL ,
  fullName VARCHAR(100) NOT NULL ,
  netWorthBi DOUBLE NOT NULL ,
  ytdBi DOUBLE NOT NULL ,
  Country_idCountry INT NOT NULL ,
  Industry_idIndustry INT NOT NULL ,
  PRIMARY KEY (idPerson) ,
  CONSTRAINT fk_Pessoa_idCountry
    FOREIGN KEY (Country_idCountry)
    REFERENCES Country(idCountry)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_Pessoa_idIndustry
    FOREIGN KEY (Industry_idIndustry)
    REFERENCES Industry(idIndustry)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Universidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS University (
  idUniversity INT NOT NULL ,
  name VARCHAR(100) NOT NULL ,
  overallScore DOUBLE NOT NULL ,
  teachingScore DOUBLE NOT NULL ,
  searchScore DOUBLE NOT NULL ,
  citationScore DOUBLE NOT NULL ,
  Country_idCountry INT NOT NULL ,
  PRIMARY KEY (idUniversity) ,
  CONSTRAINT fk_University_idCountry
    FOREIGN KEY (Country_idCountry)
    REFERENCES Country(idCountry)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Course (
  idCourse INT NOT NULL ,
  name VARCHAR(100) NOT NULL ,
  PRIMARY KEY (idCourse)
);


-- -----------------------------------------------------
-- Table Cursos_Oferecidos_Universidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Course_University (
  Course_idCourse INT NOT NULL ,
  University_idUniversity INT NOT NULL ,
  CONSTRAINT fk_idCourse
    FOREIGN KEY (Course_idCourse)
    REFERENCES Course(idCourse)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_idUniversity
    FOREIGN KEY (University_idUniversity)
    REFERENCES University(idUniversity)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);