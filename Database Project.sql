-- Create database
CREATE DATABASE AntiFascismDB;
USE AntiFascismDB;

-- Create tables
CREATE TABLE Organizations (
    OrganizationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Country VARCHAR(100),
    FoundedYear INT,
    Description TEXT
);

CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Date DATE,
    Location VARCHAR(255),
    Description TEXT
);

CREATE TABLE Individuals (
    IndividualID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    BirthYear INT,
    Nationality VARCHAR(100),
    Role VARCHAR(255)
);

CREATE TABLE Publications (
    PublicationID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    PublishedYear INT,
    OrganizationID INT,
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID)
);

CREATE TABLE Participation (
    ParticipationID INT AUTO_INCREMENT PRIMARY KEY,
    IndividualID INT,
    EventID INT,
    Role VARCHAR(255),
    FOREIGN KEY (IndividualID) REFERENCES Individuals(IndividualID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

-- Insert records
INSERT INTO Organizations (Name, Country, FoundedYear, Description)
VALUES ('Anti-Fascist Network', 'UK', 2013, 'A network of anti-fascist groups in the UK.');

INSERT INTO Events (Name, Date, Location, Description)
VALUES ('Protest Against Fascism', '2025-04-01', 'London', 'A large protest against fascist movements.');

INSERT INTO Individuals (Name, BirthYear, Nationality, Role)
VALUES ('John Doe', 1985, 'British', 'Activist');

INSERT INTO Publications (Title, Author, PublishedYear, OrganizationID)
VALUES ('Fighting Fascism', 'Jane Smith', 2020, 1);

INSERT INTO Participation (IndividualID, EventID, Role)
VALUES (1, 1, 'Speaker');

-- Update records
UPDATE Organizations
SET Description = 'A prominent network of anti-fascist groups in the UK.'
WHERE OrganizationID = 1;

UPDATE Events
SET Location = 'Central London'
WHERE EventID = 1;

-- Stored procedure
DELIMITER //
CREATE PROCEDURE GetEventDetails()
BEGIN
    SELECT e.Name AS EventName, e.Date, e.Location, i.Name AS ParticipantName, p.Role
    FROM Events e
    JOIN Participation p ON e.EventID = p.EventID
    JOIN Individuals i ON p.IndividualID = i.IndividualID
    WHERE e.Date > '2025-01-01';
END //
DELIMITER ;

-- Drop tables
DROP TABLE IF EXISTS Participation;
DROP TABLE IF EXISTS Publications;
DROP TABLE IF EXISTS Individuals;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS Organizations;