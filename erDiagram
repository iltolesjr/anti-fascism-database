erDiagram
    historical_cases {
        int case_id PK
        string name
        string time_period
        string country
        string outcome
        string key_lessons
    }
    
    resistance_tactics {
        int tactic_id PK
        string name
        int effectiveness
        int case_id FK
    }
    
    policy_recommendations {
        int policy_id PK
        string name
        string country
        int success_probability
        int historical_case_id FK
    }
    
    organizations {
        int org_id PK
        string name
        string focus_area
        string contact
    }
    
    tactical_guides {
        int guide_id PK
        string title
        string risk_level
        int org_id FK
    }
    
    historical_cases ||--o{ resistance_tactics : has
    historical_cases ||--o{ policy_recommendations : suggests
    
    organizations ||--o{ tactical_guides : publishes
    
    organizations ||--o{ org_policy_support : supports
    policy_recommendations ||--o{ org_policy_support : supported by
    
    org_policy_support {
        int org_id FK
        int policy_id FK
        string support_level
    }
