# VetBridge Architecture

## Overview

VetBridge follows an Object-Oriented architecture where each domain entity is represented by its own Python class.

The project architecture mirrors the conceptual database model, allowing the software implementation to remain consistent with the Entity-Relationship Diagram (ERD).

---

## Current Domain Entities

* Clinical Sign
* Active Ingredient
* Commercial Product
* Manufacturer
* Species

Relationship entity:

* Pharmacological Use

---

## Design Principles

Each entity is responsible for:

* Managing its own attributes.
* Managing its own relationships.
* Providing methods that modify only its own internal state.

Relationships are implemented through object associations.

---

## Current Implemented Classes

### Clinical Sign

Attributes

* id
* name
* description

Methods

* associate_active_ingredient()

---

### Active Ingredient

Attributes

* id
* name
* pharmacological_class
* description

Methods

* associate_clinical_sign()
* associate_commercial_product()

---

## Current Development Stage

✔ Conceptual architecture completed.

✔ Initial Object-Oriented implementation started.

Remaining entities will follow the same design pattern.

