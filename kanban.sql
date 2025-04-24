CREATE TABLE tips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    description TEXT NOT NULL,
    resource_link TEXT
);

CREATE TABLE kanban (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    task TEXT NOT NULL,
    status TEXT CHECK(status IN ('To Do', 'In Progress', 'Done')) NOT NULL DEFAULT 'To Do',
    priority TEXT CHECK(priority IN ('Low', 'Medium', 'High')) NOT NULL DEFAULT 'Medium'
);