# Momo-analytics  
Mobile Money Transaction Processing System
For more detailed documentation visit: https://deepwiki.com/pdusenge/Momo-analytics 
## 📌 Project Description
A complete ETL and analytics system to process :contentReference[oaicite:0]{index=0} SMS-based mobile money transactions.  
It ingests raw XML SMS data, cleans and normalizes it, stores it in a relational database, and serves analytics via a dashboard and optional API.

---

## 👥 Team Members  
*Team Name: EWD-group-3*

- Peggy Dusenge  
- Esther Digne Irakoze  
- Kagaba Shingiro Etienne  
- Frank Nkurunziza  
- Umwari Grace  

*Scrum Board:* [Trello Board](https://trello.com/invite/b/68bf6d4ff57bdd9777616bf6/ATTI7367a1d02e2da2d9696262bdb1d51b1546D3C578/momo-trananalytics-scrum-board)  
*Architecture Diagram:* [Miro Board](https://miro.com/app/board/uXjVJKkj0Zg=/?share_link_id=844505314297)

---

## 📁 Week 2 Deliverables

### 1. Entity Relationship Diagram (ERD)
- *File:https://docs.google.com/document/d/1cqCeBFdkxUXEDf90Kc4gXdeRdCvI6SGQu8DsI1x7lFQ/edit?tab=t.0
- Shows all entities, attributes, PKs/FKs, and relationships
- Includes:
  - users — customer details  
  - transactions — core financial records  
  - sms — raw SMS source data  
  - system_logs — ETL pipeline activity

### 2. SQL Database Implementation
- *File:* database/database_setup.sql
- Contains:
  - All table DDL with constraints
  - ENUM types for transaction fields
  - Foreign keys with cascading rules
  - Indexes for optimized queries
  - Sample insert data
- Tested with :contentReference[oaicite:1]{index=1}

### 3. JSON Data Models
- *File:* examples/json_schemas.json
- Includes:
  - One JSON object per entity (user, sms, transaction)
  - One complex JSON object representing a complete transaction with nested user + sms info
- Used to demonstrate how data is serialized in API responses

### 4. Database Design Document
- *File:[* docs/database_design.pdf](https://docs.google.com/document/d/1cqCeBFdkxUXEDf90Kc4gXdeRdCvI6SGQu8DsI1x7lFQ/edit?tab=t.0#heading=h.bslennmrfyrj)
- Includes:
  - ERD diagram
  - Data dictionary (tables, columns, types, descriptions)
  - Design rationale (200–300 words)
  - Screenshots of sample CRUD queries
  - Security rules and constraints used

---

## 📂 Project Structure
.
├── docs/
│ ├── erd_diagram.png
│ └── database_design.pdf
├── database/
│ └── database_setup.sql
├── examples/
│ └── json_schemas.json
├── pipeline/
├── services/
├── storage/
└── ...

yaml


---

## ⚙ Setup Instructions

### Prerequisites
- :contentReference[oaicite:2]{index=2} 3.8+
- :contentReference[oaicite:3]{index=3}
- :contentReference[oaicite:4]{index=4} or :contentReference[oaicite:5]{index=5}

📦 Installation
Prerequisites

Python 3.8+

Git

1. Clone the Repository
git clone https://github.com/pdusenge/Momo-analytics.git
cd momo-analytics

2. Create Virtual Environment
python -m venv venv
# On Linux/Mac
source venv/bin/activate
# On Windows
venv\Scripts\activate
3. Install Dependencies
pip install -r requirements.txt

4. Configure Environment Variables
cp .env.example .env
# Then open .env and set DATABASE_URL or SQLite path

⚡ Running the System
Run ETL Pipeline
./automation/run_pipeline.sh
# Or:
python pipeline/main_runner.py --xml storage/input/momo_transactions.xml

Export Dashboard Data
./automation/generate_dashboard_data.sh

Start Dashboard
./automation/start_server.sh
# Visit: http://localhost:8000

Optional: Start API Server
cd services
uvicorn web_api:app --reload
# API available at http://localhost:8000

✨ Features
Core Features

XML Data Processing: Parse and extract transaction data from XML files

Data Cleaning: Normalize amounts, dates, and phone numbers

Transaction Categorization: Automatic categorization of transaction types

SQLite Storage: Efficient local database storage

Web Dashboard: Interactive analytics and reporting interface

Logging: Comprehensive ETL process logging and error handling

Optional (Bonus) Features

REST API: FastAPI endpoints for programmatic data access

Real-time Updates: Live dashboard data refresh

Advanced Analytics: Statistical analysis and trends

🤖 AI Usage Policy
Allowed: grammar/syntax checks, researching SQL best practices

Not allowed: generating ERDs, SQL schema logic, or explanations

AI-assisted content is marked in commits and logged
