# VetBridge

VetBridge is an educational software engineering project focused on organizing veterinary pharmacological information through a relational database and an Object-Oriented application architecture.

Instead of acting as a clinical decision system, VetBridge aims to centralize medication references and provide structured access to veterinary pharmacological data, allowing searches through multiple entry points such as clinical signs, active ingredients, commercial products and manufacturers.

The project is being developed primarily as a Software Engineering and Database Modeling portfolio project.

---

# Current Development Stage

The project has completed its conceptual modeling phase and is currently transitioning into software implementation.

Completed milestones:

* Software Requirements Specification
* Functional Requirements
* Non-Functional Requirements
* Entity identification
* Entity attributes definition
* Relationship modeling
* Complete Entity-Relationship Diagram (ERD)
* Initial Object-Oriented architecture
* First Python classes
* Initial relationship methods

Current focus:

* Expansion of Python domain model
* Logical database model
* SQL implementation
* Database population
* Search engine implementation

---

# Core Architecture

Current domain entities:

* Clinical Sign
* Active Ingredient
* Commercial Product
* Manufacturer
* Species

Relationship entity:

* Pharmacological Use

The application follows an Object-Oriented approach where each entity is represented by its own Python class, responsible for maintaining both its internal state and its relationships with other entities.

---

# Planned Search Flow

Users will be able to search starting from multiple entry points:

Clinical Sign

↓

Active Ingredient

↓

Commercial Product

↓

Manufacturer

↓

Species-specific pharmacological information

↓

Dosage Calculator

The architecture allows navigation in both directions between related entities.

---

# Technologies

Current

* Python
* Git
* GitHub
* Database Modeling
* Software Engineering

Upcoming

* SQLite / PostgreSQL
* SQL
* Search Algorithms
* Data Persistence

---

# Repository Structure

docs/

* Requirements
* Architecture
* Database Modeling
* Design Decisions

src/

* Domain Classes
* Future Database Layer
* Future Search Engine

---

# Educational Purpose

VetBridge is developed as an educational project intended to practice:

* Object-Oriented Programming
* Software Architecture
* Database Modeling
* Relational Databases
* Python Development
* Git Workflow

The project does not replace professional veterinary judgement and should not be used as a diagnostic or therapeutic recommendation system.

---

# Author

Paulo Henrique Retamero Baptista
