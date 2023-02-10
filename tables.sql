-- Active: 1676016305253@@127.0.0.1@3306@f1

CREATE TABLE
    season(
        id INT AUTO_INCREMENT PRIMARY KEY,
        during_year INT
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
        status ENUM("Active", "Retired", "Dead"),
        FOREIGN KEY(id_nationality) REFERENCES nationality(id)
    );

CREATE TABLE
    team(
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        status ENUM("Active", "Inactive")
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
        type ENUM("Street", "Oval", "Circuit"),
        id_nationality INT NOT NULL,
        FOREIGN KEY(id_nationality) REFERENCES nationality(id)
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