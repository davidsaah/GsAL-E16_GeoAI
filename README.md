# GsAL E16 GeoAI Course Factory

This repository defines the controlled production system for the University of San Francisco GsAL E16 GeoAI for Environmental Science course. The current course materials remain in the authoritative Google Drive; this repository contains orchestration, quality standards, schemas, and reproducible workflow configuration.

The system is designed to research, build, test, review, design, and publish an eight-class, no-code GeoAI course for students and professionals with little or no programming experience. ArcGIS Pro remains the authoritative environment for spatial analysis and validation.

## Core principles

- One deterministic workflow coordinates the work. Individual agents do not approve their own outputs.
- Every factual or scientific claim must be traceable to an authoritative source.
- AI proposes, drafts, tests, and critiques. David Saah retains final academic approval.
- Students do not write, edit, or execute code in the required course.
- Every class contains an approximately one-hour lecture and a two-hour guided laboratory.
- Weeks 1 through 7 are self-contained. Week 8 contains the bounded mini-capstone.
- Published course materials are never overwritten by an agent.

## Where components live

| Component | System of record |
|---|---|
| Agent instructions and workflow contracts | This repository |
| Workflow execution, task state, and run logs | Self-hosted n8n and PostgreSQL |
| Search index | Local vector database |
| Temporary workspaces | Dedicated course-factory computer |
| Source documents and course deliverables | [Authoritative Google Drive](https://drive.google.com/drive/folders/1GVEgY3waGcLhcYtkZRI2GKmDaU61OeQI) |
| API credentials | Encrypted n8n credential store |

Google Drive is the authoritative home for syllabi, lectures, laboratories, datasets, instructor guides, and published materials. This repository must not contain student records, sensitive data, partner-restricted material, API keys, or large geospatial datasets.

## Agent team

| Agent | Function |
|---|---|
| Course Producer | Coordinates tasks, state, dependencies, and approval summaries |
| Research Librarian | Produces evidence packs and source matrices |
| Pedagogy Architect | Aligns outcomes, learning activities, and assessments |
| Course Builder | Produces lecture, lab, instructor, and assessment drafts |
| Student Tester | Simulates novice use and records usability and timing failures |
| Visual Designer | Applies the visual system and improves clarity and accessibility |
| Independent Critic | Red-teams accuracy, validity, pedagogy, ethics, and reproducibility |
| Publisher | Packages approved materials and releases them to Drive |

Agent instructions are stored in [`agents/`](agents/). Course-wide requirements are stored in [`standards/`](standards/). Machine-readable handoff contracts are stored in [`schemas/`](schemas/).

## Production states

Every class package moves through the following states:

1. `SCOPED`
2. `RESEARCH_COMPLETE`
3. `PEDAGOGY_APPROVED`
4. `CONTENT_DRAFTED`
5. `STUDENT_TESTED`
6. `DESIGN_COMPLETE`
7. `CRITIC_PASSED`
8. `HUMAN_PILOT_PASSED`
9. `DAVID_APPROVED`
10. `PUBLISHED`

Only the Course Producer may update workflow state. Only David may authorize `DAVID_APPROVED`. Only the Publisher may write to the published Drive folder.

## Authoritative course controls

Before changing course content, contributors must read the Drive file `00_START_HERE_E16_GeoAI_Course_Build.md`. Authority is resolved in this order:

1. The active syllabus controls course sequence and topics.
2. The research-complete lecture blueprint controls researched content.
3. The stable weekly `ACTIVE.pptx` controls the delivered lecture.
4. `08_DECK_CANON.md` and `14_LAB_PACKAGE_STANDARD.md` control cross-week wording and package requirements.

If authoritative sources conflict, stop and request a decision; do not silently choose one. The fixed recurring questions are:

1. What do the data actually show?
2. What does the model or agent produce?
3. What does a human infer from that output?
4. What evidence is needed before the inference can guide action?

See [`docs/current-course-inventory.md`](docs/current-course-inventory.md) and [`docs/google-drive-layout.md`](docs/google-drive-layout.md).

## Production pilot

The first end-to-end production run is Week 2, Spatial Data, Labels, Bias, and Evaluation. Week 2 was selected because draft lecture and laboratory materials already exist and can be tested against the complete workflow before scaling to Weeks 3 through 8.

See [`docs/pilot-week-02.md`](docs/pilot-week-02.md).

## Local deployment

1. Copy `.env.example` to `.env` and replace placeholders.
2. Install Docker Desktop or Docker Engine, Ollama-compatible GPU drivers when applicable, and Tailscale on the host.
3. Start the stack with `docker compose -f infrastructure/docker-compose.yml up -d`.
4. Expose only the n8n interface through the private Tailscale network.
5. Configure provider credentials inside n8n. Never commit credentials to this repository.

Detailed guidance is in [`docs/deployment.md`](docs/deployment.md) and [`docs/security.md`](docs/security.md).

## Validation

Run:

```bash
./scripts/validate_repo.sh
```

The same checks run automatically for pull requests. Passing repository checks does not replace scientific review, ArcGIS testing, a novice human pilot, or David's approval.

## Current status

The authoritative Drive contains stable active lecture decks and build-source archives for all eight weeks. Lab folders are present for Weeks 1–5; the control record reports that Weeks 2–5 lab packages are complete. Week 6–8 lab folders are not yet present at the top level and must be created only through the approved production workflow. The SIG LibreChat platform is the approved course assistant for Weeks 5–7. Remote MCP support for the Week 7 Esri lab remains a pre-term verification risk.

This repository scaffold has been aligned to the Drive inventory as of 2026-09-04. Runtime deployment, credentials, retrieval indexing, classroom-build validation, human pilots, final instructor approval, and publication remain environment-specific gates.
