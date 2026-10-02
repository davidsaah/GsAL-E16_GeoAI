# Workflow specifications

This directory contains version-controlled workflow specifications. The imported n8n workflow is generated from, and must remain consistent with, these specifications.

`course-production.yaml` defines the authoritative states, agents, gates, permissions, and escalation rules. Changes to the workflow specification require review because they can alter who may create, approve, or publish course materials.

Do not commit n8n credential exports. Exported n8n workflow JSON may be committed only after removing credential identifiers, webhook secrets, user identifiers, execution data, and environment-specific folder IDs.
