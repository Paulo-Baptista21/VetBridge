# Database Modeling

## Current Stage

The conceptual database model has been completed.

Current entities:

* Clinical Sign
* Active Ingredient
* Commercial Product
* Manufacturer
* Species

Relationship entity:

* Pharmacological Use

---

## Relationship Model

Clinical Sign

↔

Active Ingredient

(N:N)

---

Active Ingredient

↔

Commercial Product

(N:N)

---

Commercial Product

↔

Species

(N:N)

---

Manufacturer

↔

Commercial Product

(N:N)

---

## Next Steps

* Logical Model
* Primary Keys
* Foreign Keys
* Normalization
* SQL Implementation

