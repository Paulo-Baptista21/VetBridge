# VetBridge Architecture

## Overview

VetBridge follows an evolving Object-Oriented architecture in which the main domain concepts are represented by Python classes.

The Object-Oriented model is designed to remain consistent with the conceptual database model while serving a different purpose:

- the conceptual model describes the domain and its relationships;
- the Object-Oriented model represents domain concepts as Python objects;
- the logical database model will represent those concepts as relational tables.

The architecture is currently under development and will evolve alongside the validation of the conceptual and logical models.

---

## Current Architecture Stage

The project currently has:

- an advanced conceptual model undergoing final validation;
- initial Object-Oriented classes implemented in Python;
- initial methods for associating related objects;
- a documented plan for the remaining domain classes;
- a dosage calculator prototype.

The Object-Oriented model is not yet complete.

---

## Domain Concepts

The current domain model contains the following concepts:

- Clinical Sign
- Active Ingredient
- Commercial Name
- Manufacturer
- Commercial Presentation
- Species

### Pharmacological Use

Pharmacological Use is not treated as an independent domain entity.

It represents the relationship between a specific Commercial Presentation and a Species.

Because this relationship contains its own attributes, it may be represented as an association class in the Object-Oriented model.

Its attributes include:

- dosage instructions;
- administration route;
- administration interval;
- indications;
- contraindications;
- warnings;
- adverse reactions.

---

## Object Relationships

### Clinical Sign ↔ Active Ingredient

**Cardinality:** N:N

A Clinical Sign may be associated with multiple Active Ingredients.

An Active Ingredient may be associated with multiple Clinical Signs.

---

### Active Ingredient ↔ Commercial Name

**Cardinality:** N:N

An Active Ingredient may be associated with multiple Commercial Names.

A Commercial Name may contain one or more Active Ingredients.

---

### Manufacturer ↔ Commercial Name

**Cardinality:** 1:N

A Manufacturer may be associated with multiple Commercial Names.

Each Commercial Name belongs to one Manufacturer.

---

### Commercial Name ↔ Commercial Presentation

**Cardinality:** 1:N

A Commercial Name may have multiple Commercial Presentations.

Each Commercial Presentation belongs to one Commercial Name.

---

### Commercial Presentation ↔ Species

**Cardinality:** N:N

A Commercial Presentation may be used for multiple Species.

A Species may have multiple Commercial Presentations associated with it.

This relationship is represented by Pharmacological Use.

---

## Design Principles

Each domain class should be responsible for:

- storing its own attributes;
- maintaining its own relationships;
- exposing methods that modify its internal state;
- avoiding duplicate associations;
- maintaining consistency in bidirectional relationships.

Relationship methods should update both associated objects when required.

For example, associating a Clinical Sign with an Active Ingredient should also make the Clinical Sign available from the Active Ingredient.

The complete implementation of these bidirectional relationships is still in progress.

---

## Currently Published Python Components

### Dosage Calculator

The repository contains an initial dosage calculator prototype based on:

- animal weight;
- prescribed dose;
- medication concentration.

The calculator returns:

- total dose in milligrams;
- administration volume in milliliters.

---

### Clinical Sign

Initial attributes:

- `id`
- `nome`
- `descricao`
- `principios_ativos`

Initial relationship method:

- `associar_principio_ativo()`

---

### Active Ingredient

Initial attributes:

- `id`
- `nome`
- `classe_farmacologica`
- `descricao`
- `sinais_clinicos`
- `nomes_comerciais`

Initial relationship methods:

- `associar_sinal_clinico()`
- `associar_nome_comercial()`

These classes represent an initial implementation and will still be revised to ensure duplicate-safe and bidirectional relationships.

---

## Planned Object-Oriented Components

The following classes still require implementation, revision, or publication in the repository:

- Manufacturer;
- Commercial Name;
- Commercial Presentation;
- Species;
- Pharmacological Use.

The implementation order may change according to the evolution of the conceptual and logical models.

---

## Relationship Consistency

The intended Object-Oriented design uses bidirectional relationships.

Example:

```text
Clinical Sign
    ↕
Active Ingredient* Managing its own relationships.
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

