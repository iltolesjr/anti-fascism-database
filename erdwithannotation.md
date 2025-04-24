---
config:
  theme: neo-dark
---
erDiagram
    "Past Events" {
        int event_id PK
        string "Event Name"
        string "Time Period"
        string "Country"
        string "Outcome"
        string "Key Lessons"
    }
    "Ways of Resisting" {
        int tactic_id PK
        string "Method Name"
        int Effectiveness
        int event_id FK
    }
    "Future Ideas" {
        int idea_id PK
        string "Idea Name"
        string "Country"
        int "Success Probability"
        int event_id FK
    }
    "Groups Involved" {
        int group_id PK
        string "Group Name"
        string "Focus Area"
        string "Contact Info"
    }
    "How-To Guides" {
        int guide_id PK
        string "Guide Title"
        string "Risk Level"
        int group_id FK
    }
    "Group Support for Ideas" {
        int group_id FK
        int idea_id FK
        string "Support Level"
    }

    "Past Events" ||--o{ "Ways of Resisting" : has
    "Past Events" ||--o{ "Future Ideas" : suggests
    "Groups Involved" ||--o{ "How-To Guides" : publishes
    "Groups Involved" ||--o{ "Group Support for Ideas" : provides support
    "Future Ideas" ||--o{ "Group Support for Ideas" : is supported by
