# Deployment Plan

## Recommended host

- Dedicated Windows workstation capable of running ArcGIS Pro
- Docker Desktop with WSL2 for the course-factory services
- At least 32 GB RAM; 64 GB preferred
- At least 2 TB NVMe storage
- NVIDIA GPU with at least 16 GB VRAM preferred for useful local models
- Wired network connection and automatic power recovery

The system can run without a GPU by using cloud models, but local-model performance will be limited.

## Installation sequence

1. Enable full-disk encryption and create a dedicated administrator account.
2. Install current security updates, ArcGIS Pro, Docker Desktop, Git, and Tailscale.
3. Clone this repository to a non-synchronized local directory.
4. Create `.env` from `.env.example` and generate strong unique secrets.
5. Start PostgreSQL, Qdrant, Ollama, and n8n using Docker Compose.
6. Create the first n8n owner account and enable multifactor authentication where supported.
7. Add OpenAI, Anthropic, Google, Google Drive, and other credentials inside n8n.
8. Configure Tailscale Serve for the localhost n8n port.
9. Apply Tailscale access controls so only named users and devices can connect.
10. Configure encrypted nightly backups and test a restore.
11. Import the versioned workflow only after its credentials and folder IDs are mapped locally.
12. Run the Week 2 pilot before enabling production for other weeks.

## Backup set

- PostgreSQL database dump
- n8n encryption key stored in a separate password manager
- n8n workflow export stripped of environment-specific secrets
- Agent and standards repository
- Qdrant snapshot, or a documented process to rebuild the index
- Google Drive publication and version records

Backups are not valid until a restore has been tested on another machine or isolated environment.
