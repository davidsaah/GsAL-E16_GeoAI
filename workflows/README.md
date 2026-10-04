# Workflow specifications

This directory contains version-controlled workflow specifications. The imported n8n workflow is generated from, and must remain consistent with, these specifications.

`course-production.yaml` defines the authoritative states, agents, gates, permissions, and escalation rules. Changes to the workflow specification require review because they can alter who may create, approve, or publish course materials.

Do not commit n8n credential exports. Exported n8n workflow JSON may be committed only after removing credential identifiers, webhook secrets, user identifiers, execution data, and environment-specific folder IDs.

## Continuous review contract

Version 0.2.0 separates recurring production cycles from the unchanged release-state order. Critic feedback occurs in every cycle; only exact-final different-family review may establish CRITIC_PASSED. Routine in-scope pedagogy acceptance is automated, while novice human pilot and David approval occur in the final human phase.

This YAML is a specification, not evidence that an n8n scheduler or cloud worker is deployed or running. A runtime must implement the cycle contract, finding limits, invalidation and gates, then be validated separately. No originating computer is required by this contract. Never claim ongoing background work from a repository update alone.

