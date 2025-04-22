-- Create the schema for the Anti-Fascism Database

-- Create the table for organizations
CREATE TABLE Organizations (
    OrganizationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    FoundedYear INT,
    Website VARCHAR(255)
);

-- Create the table for scenarios
CREATE TABLE Scenarios (
    ScenarioID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Create the table for tactics
CREATE TABLE Tactics (
    TacticID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    ScenarioID INT,
    FOREIGN KEY (ScenarioID) REFERENCES Scenarios(ScenarioID) ON DELETE SET NULL
);

-- Create the table for events
CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Location VARCHAR(255),
    Description TEXT,
    OrganizationID INT,
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID) ON DELETE CASCADE
);

-- Create a junction table for many-to-many relationship between Events and Tactics
CREATE TABLE EventTactics (
    EventID INT,
    TacticID INT,
    PRIMARY KEY (EventID, TacticID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE CASCADE,
    FOREIGN KEY (TacticID) REFERENCES Tactics(TacticID) ON DELETE CASCADE
);
