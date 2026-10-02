# Authoritative Google Drive Layout

Root: [E16 GeoAI course materials](https://drive.google.com/drive/folders/1GVEgY3waGcLhcYtkZRI2GKmDaU61OeQI)

```text
E16 GeoAI Course
├── 00_Master_Course
├── 01_Week_1_Course_Overview
├── 02_Week_2_Data_Labels_and_Evaluation
├── 03_Week_3_ML_and_Deep_Learning
├── 04_Week_4_Geospatial_Foundation_Models
├── 05_Week_5_LLMs_for_Geospatial_Reasoning
├── 06_Week_6_Agentic_Geospatial_Analysis
├── 07_Week_7_Skills_MCP_and_Automation
├── 08_Week_8_Mini_Capstone
├── 09_Shared_Resources
├── 10_AI_Collaboration_MD
└── 99_Archive
```

## Rules

- Preserve this existing organization; do not create a parallel staging hierarchy in Drive.
- Use one stable `ACTIVE.pptx` per weekly lecture. Instructors edit it in Google Slides Office-compatibility mode; Drive revision history provides routine versioning.
- Each weekly lab lives in `02_Lab/`, with starter data in `01_Starter_Data/` and protected material in `02_Instructor_Only/`.
- Active course-wide documents live in `00_Master_Course`; reusable templates and guides live in `09_Shared_Resources`.
- Markdown collaboration records live only in `10_AI_Collaboration_MD`.
- Rejected and superseded materials go to `99_Archive`; do not delete them. Prefix rejected files with `REJECTED -` and milestone snapshots with an ISO date.
- Never expose answer keys, internal prompts, credentials, critic reports, or instructor-only notes to students.
- Preserve file identity, links, sharing state, and version history whenever possible.
- Do not create new Word, PowerPoint, or Excel files. The stable weekly `ACTIVE.pptx` files are an explicit existing-workflow exception, not permission to create competing copies.
