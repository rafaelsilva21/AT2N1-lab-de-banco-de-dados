CREATE DATABASE IF NOT EXISTS Riqueza;
USE Riqueza;

-- -----------------------------------------------------
-- Table Pais
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pais (
  idPais INT NOT NULL ,
  nome VARCHAR(45) NOT NULL ,
  qtdHabitantes DOUBLE NOT NULL ,
  PRIMARY KEY (idPais)
);


-- -----------------------------------------------------
-- Table Industria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Industria (
  idIndustria INT NOT NULL ,
  nome VARCHAR(45) NOT NULL ,
  transacao DOUBLE NOT NULL ,
  PRIMARY KEY (idIndustria)
);


-- -----------------------------------------------------
-- Table Pessoa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pessoa (
  idPessoa INT NOT NULL ,
  nomeCompleto VARCHAR(100) NOT NULL ,
  netWorth DOUBLE NOT NULL ,
  ytd DOUBLE NOT NULL ,
  Pais_idPais INT NOT NULL ,
  Industria_idIndustria INT NOT NULL ,
  PRIMARY KEY (idPessoa) ,
  CONSTRAINT fk_Pessoa_idPais
    FOREIGN KEY (Pais_idPais)
    REFERENCES Pais(idPais)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_Pessoa_idIndustria
    FOREIGN KEY (Industria_idIndustria)
    REFERENCES Industria(idIndustria)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Universidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Universidade (
  idUniversidade INT NOT NULL ,
  nome VARCHAR(100) NOT NULL ,
  pontGeral DOUBLE NOT NULL ,
  pontEnsino DOUBLE NOT NULL ,
  pontPesquisa DOUBLE NOT NULL ,
  pontCitacao DOUBLE NOT NULL ,
  Pais_idPais INT NOT NULL ,
  PRIMARY KEY (idUniversidade) ,
  CONSTRAINT fk_Universidade_idPais
    FOREIGN KEY (Pais_idPais)
    REFERENCES Pais(idPais)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Curso (
  idCurso INT NOT NULL ,
  nome VARCHAR(45) NOT NULL ,
  PRIMARY KEY (idCurso)
);


-- -----------------------------------------------------
-- Table Cursos_Oferecidos_Universidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Curso_Universidade (
  Curso_idCurso INT NOT NULL ,
  Universidade_idUniversidade INT NOT NULL ,
  PRIMARY KEY (Curso_idCurso, Universidade_idUniversidade),
  CONSTRAINT fk_idCurso
    FOREIGN KEY (Curso_idCurso)
    REFERENCES Curso(idCurso)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT fk_idUniversidade
    FOREIGN KEY (Universidade_idUniversidade)
    REFERENCES Universidade(idUniversidade)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);