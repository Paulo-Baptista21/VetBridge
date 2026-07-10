# Architectural Decisions

---

## 2026-07-06

### Bidirectional Relationships

Decision

Relationships between entities will be bidirectional.

Reason

Users must be able to navigate through the system starting from different entry points.

Example

Clinical Sign

↓

Active Ingredient

↓

Commercial Product

Manufacturer

↓

Commercial Product

↓

Active Ingredient

---

## 2026-07-08

### Entity Responsibilities

Decision

Each entity is responsible for managing its own relationships.

Reason

This follows Object-Oriented design principles and keeps responsibilities localized.

---

## 2026-07-09

### Initial Object-Oriented Architecture

Decision

Implementation starts by creating entity classes before introducing database persistence.

Reason

Allows validation of domain behavior independently from SQL implementation.

