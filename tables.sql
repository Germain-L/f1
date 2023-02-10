-- Active: 1676016305253@@127.0.0.1@3306@f1

CREATE TABLE
    season(
        id INT AUTO_INCREMENT PRIMARY KEY,
        during_year INT
    );

CREATE TABLE
    driver_status(
        id INT AUTO_INCREMENT PRIMARY KEY,
        status ENUM('Active', 'Retired', 'Dead')
    );

CREATE TABLE
    team_status(
        id INT AUTO_INCREMENT PRIMARY KEY,
        status ENUM("Active", "Inactive")
    );

CREATE TABLE
    circuit_type(
        id INT AUTO_INCREMENT PRIMARY KEY,
        type ENUM("Street", "Oval", "Circuit")
    );

CREATE TABLE
    nationality(
        id INT AUTO_INCREMENT PRIMARY KEY,
        contry VARCHAR(50)
    );

CREATE TABLE
    driver(
        id INT AUTO_INCREMENT PRIMARY KEY,
        firstname VARCHAR(50),
        lastname VARCHAR(50),
        dob DATE,
        id_nationality INT NOT NULL,
        id_status INT NOT NULL,
        FOREIGN KEY(id_nationality) REFERENCES nationality(id),
        FOREIGN KEY(id_status) REFERENCES driver_status(id)
    );

CREATE TABLE
    team(
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        id_status INT NOT NULL,
        FOREIGN KEY(id_status) REFERENCES team_status(id)
    );

CREATE TABLE
    race(
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        id_season INT NOT NULL,
        FOREIGN KEY(id_season) REFERENCES season(id)
    );

CREATE TABLE
    circuit(
        id INT AUTO_INCREMENT PRIMARY KEY,
        length DECIMAL(15, 2),
        name VARCHAR(50),
        adress VARCHAR(255),
        id_nationality INT NOT NULL,
        id_circuit_type INT NOT NULL,
        FOREIGN KEY(id_nationality) REFERENCES nationality(id),
        FOREIGN KEY(id_circuit_type) REFERENCES circuit_type(id)
    );

CREATE TABLE
    qualification(
        id INT AUTO_INCREMENT PRIMARY KEY,
        q1 TIME,
        q2 TIME,
        q3 TIME,
        id_race INT NOT NULL,
        FOREIGN KEY(id_race) REFERENCES race(id)
    );

CREATE TABLE
    races(
        id_race INT,
        id_circuit INT,
        FOREIGN KEY(id_race) REFERENCES race(id),
        FOREIGN KEY(id_circuit) REFERENCES circuit(id)
    );

CREATE TABLE
    drive(
        id_driver INT,
        id_team INT,
        FOREIGN KEY(id_driver) REFERENCES driver(id),
        FOREIGN KEY(id_team) REFERENCES team(id)
    );

CREATE TABLE
    qualifies(
        id_qualification INT,
        id_driver INT,
        FOREIGN KEY(id_qualification) REFERENCES qualification(id),
        FOREIGN KEY(id_driver) REFERENCES driver(id)
    );

CREATE TABLE
    ranks(
        id_driver INT,
        id_race INT,
        place INT,
        FOREIGN KEY(id_driver) REFERENCES driver(id),
        FOREIGN KEY(id_race) REFERENCES race(id)
    );