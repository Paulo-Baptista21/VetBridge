# Database Modeling

## Current Stage

The conceptual database model is currently in its final validation stage.

The logical database model is in progress and will convert the domain concepts and relationships into relational tables, primary keys, foreign keys, and associative tables.

---

## Domain Concepts

The current conceptual model contains the following domain concepts:

- Clinical Sign
- Active Ingredient
- Commercial Name
- Manufacturer
- Commercial Presentation
- Species

### Pharmacological Use

Pharmacological Use does not represent an independent domain entity.

It represents the relationship between a specific Commercial Presentation and a Species.

Because this relationship contains its own attributes, it may be represented:

- as an association class in the Object-Oriented model;
- as an associative table in the logical database model.

---

## Relationship Model

### Clinical Sign ↔ Active Ingredient

**Cardinality:** N:N

A Clinical Sign may be associated with multiple Active Ingredients.

An Active Ingredient may be associated with multiple Clinical Signs.

---

### Active Ingredient ↔ Commercial Name

**Cardinality:** N:N

An Active Ingredient may be present in multiple Commercial Names.

A Commercial Name may contain one or more Active Ingredients.

---

### Manufacturer ↔ Commercial Name

**Cardinality:** 1:N

A Manufacturer may produce multiple Commercial Names.

Each registered Commercial Name belongs to one Manufacturer.

Different manufacturers may produce products containing the same Active Ingredient, but each Commercial Name remains associated with its own Manufacturer.

---

### Commercial Name ↔ Commercial Presentation

**Cardinality:** 1:N

A Commercial Name may have one or more Commercial Presentations.

Each Commercial Presentation belongs to one Commercial Name.

A Commercial Presentation is defined, at minimum, by:

- pharmaceutical form;
- concentration.

---

### Commercial Presentation ↔ Species

**Cardinality:** N:N

A Commercial Presentation may be indicated for one or more Species.

A Species may be served by multiple Commercial Presentations.

This relationship is represented by Pharmacological Use.

---

## Pharmacological Use Attributes

The Pharmacological Use relationship stores information that depends on both the Commercial Presentation and the Species, including:

- dosage instructions;
- administration route;
- administration interval;
- indications;
- contraindications;
- warnings;
- adverse reactions.

These attributes do not belong exclusively to the Commercial Presentation or exclusively to the Species.

They describe the use of a specific Commercial Presentation in a specific Species.

---

## Planned Logical Representation

In the logical database model, the N:N relationships will be converted into associative tables.

The relationship between Commercial Presentation and Species will be represented by a table such as:

Pharmacological Use

↔

Commercial Presentation

(1:N)

---

Commercial Name

↔

Commercial Presentation

(1:N)

---

## Next Steps

* Logical Model
* Primary Keys
* Foreign Keys
* Normalization
* SQL Implementation

