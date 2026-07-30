## VetBridge

Educational software engineering and database modeling project focused on organizing veterinary pharmacological information.

## Overview:

VetBridge is a personal portfolio project developed during my transition from Veterinary Medicine to Software Development.

The project aims to organize veterinary pharmacological information that is commonly distributed across official package inserts, allowing structured navigation between clinical signs, active ingredients, commercial names, commercial presentations, manufacturers, species, and species-specific pharmacological information.

VetBridge is being developed primarily to practice software requirements, domain modeling, Object-Oriented Programming, relational database design, SQL, and data persistence.

## Scope:

VetBridge is an informational consultation-support project. It does not:

- perform diagnoses;

- recommend therapeutic protocols;

- interpret laboratory or imaging examinations;

- recommend medication combinations;

- replace professional veterinary judgment.

The project is intended to organize reference information and support dosage calculations based on values entered by the user.

## Planned Consultation Flow:

Clinical Sign

    ↓
    
Active Ingredients

    ↓
    
Commercial Names

    ↓
    
Commercial Presentations

    ↓

    
Species-specific Pharmacological Information

    ↓
    
Dosage Calculator

Navigation between related domain entities is planned to be bidirectional.

## Domain Model:

Current domain concepts:

- Clinical Sign

- Active Ingredient

- Commercial Name

- Manufacturer

- Commercial Presentation

- Species

Pharmacological Use represents the association between a commercial presentation and a species. This association stores information that may vary according to both, including:

- dosage instructions;

- administration route;

- interval;

- indications;

- contraindications;

- warnings;

- adverse reactions.

## Main Relationships:

| Clinical Sign N:N Active Ingredient | Active Ingredient N:N Commercial Name | Manufacturer 1:N Commercial Name | Commercial Name         1:N Commercial Presentation | Commercial Presentation N:N Species |

The N relationship between Commercial Presentation and Species is represented by Pharmacological Use, which contains its own attributes.

## Current Development Stage

## Completed:

- project objective and scope definition;

- functional and non-functional requirements;

- business rules;

- general consultation flow;

- initial identification of entities, attributes, and relationships;

- multiple iterations of the conceptual Entity-Relationship Diagram;

- initial dosage calculator prototype in Python;

- initial Python domain classes and relationship methods.

## In Progress:

- final validation of the conceptual model;

- conversion of the conceptual model into a logical relational model;

- definition of tables, primary keys, foreign keys, and normalization;

- expansion of the Object-Oriented domain model;

- SQL and MySQL study applied to the project;

- initial database implementation and query prototyping.

## Planned:

- population of the pharmacological database using official package inserts;

- search and navigation between related entities;

- presentation of species-specific pharmacological information;

- integration of the dosage calculator with the application;

- data persistence;

- interface, tests, and final documentation.

## Dosage Calculator:

The initial prototype supports the following calculation:

- Total dose (mg) = Weight (kg) × Prescribed dose (mg/kg)

- Volume (mL) = Total dose (mg) ÷ Concentration (mg/mL)

A second calculation flow is planned for doses expressed directly in mL/kg.

## Technologies and Concepts Currently Applied:

- Python

- Object-Oriented Programming

- Software Requirements

- Domain Modeling

- Entity-Relationship Modeling

- Relational Database Fundamentals

- Git

- GitHub

## Currently Being Introduced:

- SQL

- MySQL

- Logical Database Modeling

- Data Persistence

## Documentation:

The repository documentation covers:

- software requirements;

- domain and Object-Oriented architecture;

- database modeling;

- architectural decisions.

The documentation is updated as the project evolves.

## Data Sources:

The planned pharmacological database will use information obtained from official veterinary medication package inserts.

## Educational Purpose and Disclaimer:

VetBridge is an educational project and must not be used as a diagnostic or therapeutic recommendation system. Clinical decisions remain entirely under the responsibility of qualified professionals.

## Author:

Paulo Henrique Retamero Baptista

Veterinarian and Systems Analysis and Development student transitioning into software development.

---

