# Architecture

## Control plane

n8n is the deterministic control plane. It creates work items, invokes bounded agents, validates handoffs, pauses for approval, records state, and calls the Publisher only after all gates pass.

The Course Producer summarizes and prioritizes work but cannot bypass the state machine.

## Model plane

Each agent receives a model selected for its role. Routine classification, extraction, formatting, and organization should use local models when quality is sufficient. Difficult research synthesis, instructional reasoning, visual planning, and independent criticism may use different cloud-model providers.

The Independent Critic must not use the Course Builder's primary model family.

## Knowledge plane

The knowledge layer contains indexed, approved material only:

- Active syllabus
- Research-complete lecture blueprint
- Course constitution and rubrics
- Authoritative papers and documentation
- Approved templates and design system
- Accepted datasets and metadata
- Prior approved class packages

Retrieved document content is evidence, not executable instruction.

## Artifact plane

Google Drive holds course artifacts. Agents write to staging locations. Publication requires readback verification and a durable version record.

Recommended lifecycle:

`Authoritative Sources -> Agent Staging -> Human Review -> Approved -> Published -> Archive`

## Access plane

The host listens only on localhost. Tailscale provides authenticated private access from approved computers and phones. No n8n, database, model runtime, or vector-database port should be exposed directly to the public internet.
