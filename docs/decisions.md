# Decision Log

Record durable architecture and course-production decisions here. Do not use this file for temporary task notes.

## 2026-10-01: Repository responsibility

- GitHub is the system of record for agent instructions, workflow specifications, standards, schemas, tests, and deployment configuration.
- Google Drive remains the system of record for source materials and course deliverables.
- The dedicated host stores runtime databases, indexes, temporary workspaces, logs, and encrypted credentials.

## 2026-10-01: Workflow ownership

- n8n is the deterministic coordinator.
- The Course Producer summarizes and assigns work but cannot bypass gates.
- Agents cannot approve their own outputs.
- David Saah retains final academic and publication approval.

## 2026-10-01: Initial pilot

- Week 2 is the first end-to-end production pilot.
- Production does not scale to other weeks until Week 2 completes scientific review, student simulation, a novice human pilot, and final approval.
