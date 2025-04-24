# anti-fascism-database
anti-fascism-database

# Anti-Fascism Database

## Project Overview
The **Anti-Fascism Database** is a resource designed to document and analyze tactics, events, and strategies related to anti-fascist movements. This repository serves as an educational tool to provide a centralized and organized resource for researchers, activists, and educators.

## Features
- **Database of Tactics**: A comprehensive list of tactics used in various scenarios.
- **Scenario Analysis**: Options and decision-making processes for different scenarios.
- **Educational Resource**: Designed to inform and educate users on anti-fascist strategies.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/iltolesjr/anti-fascism-database.git

## Project Directory Structure

The project is organized as follows:

```plaintext
anti-fascism-database/
├── app/
│   ├── __init__.py          # Initialize the Flask app (optional for modularity)
│   ├── routes.py            # Contains the Flask routes (e.g., /tips, /kanban)
│   ├── database.py          # Database connection logic
│   ├── models.py            # Define database models (if using an ORM like SQLAlchemy)
│   └── templates/           # (Optional) HTML templates for rendering (if needed)
├── database/
│   ├── database.db          # SQLite database file
│   ├── schema.sql           # SQL file to define the database schema
├── static/
│   ├── kanban-board.html    # Kanban board HTML file
│   ├── styles.css           # CSS for styling the Kanban board
│   └── script.js            # JavaScript for Kanban board interactivity
├── requirements.txt         # Python dependencies (e.g., Flask, SQLite)
├── run.py                   # Entry point to run the Flask app
└── [README.md](http://_vscodecontentref_/2)                # Documentation for the project