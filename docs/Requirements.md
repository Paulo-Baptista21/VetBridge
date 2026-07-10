# VetBridge – Software Requirements Specification

**Current Version:** 0.1

**Status:** Requirements Analysis

---

# 1. Identification

**Project Name:** VetBridge

**Requirements Author:** Paulo Henrique Retamero Baptista

**Date:** June 26, 2026

VetBridge is a consultation support tool designed for veterinary students and recently graduated professionals who require a fast and organized way to access veterinary pharmacological information.

The system aims to centralize information that is often scattered across official package inserts by allowing users to search clinical signs and retrieve related active ingredients, commercial formulations, dosage information, contraindications, administration routes, and recommended intervals.

Additionally, VetBridge includes a dosage calculation module capable of converting prescribed doses into administrable volumes according to patient weight, drug concentration, and dosage unit.

Dose calculation:

* Volume = Weight × Dose ÷ Concentration (mg/ml)
* Volume = Weight × Dose (when dosage is expressed in ml/kg)

VetBridge is intended exclusively as an informational and consultation support tool. It is not designed to establish diagnoses, recommend therapeutic protocols, or replace professional veterinary judgment. Clinical decisions remain entirely under the responsibility of qualified professionals.

---

# 2. Context

## 2.1 Problem Description

During veterinary education, medications are primarily introduced through their active ingredients and therapeutic indications. However, in clinical practice, these active ingredients may be available under multiple commercial names, concentrations, and pharmaceutical presentations.

As a result, professionals frequently need to consult different sources in order to associate an active ingredient with its available commercial products and corresponding dosage recommendations.

The lack of a centralized reference increases consultation time and reduces efficiency during clinical routine.

---

## 2.2 Objective

Develop a software tool capable of organizing veterinary pharmacological information and providing fast access to medication references through clinical signs.

---

# 3. Users

Target users:

* Veterinary students
* Recently graduated veterinarians

---

# 4. Functional Requirements

| Code | Requirement                                                                                                    |
| ---- | -------------------------------------------------------------------------------------------------------------- |
| FR01 | The system shall allow users to search for a single input.                                                     |
| FR02 | The system shall display entities associated with the searched input.                                          |
| FR03 | The system shall allow navigation between associated entities.                                                 |
| FR04 | The system shall display dosage information for each commercial formulation according to the target species.   |
| FR05 | The system shall calculate medication dosage based on patient weight, prescribed dose, and drug concentration. |
| FR06 | The system shall allow users to return to the main menu after completing a consultation.                       |

---

# 5. Non-Functional Requirements

| Code  | Requirement                                                                                                               |
| ----- | ------------------------------------------------------------------------------------------------------------------------- |
| NFR01 | Search results should be returned within two seconds.                                                                     |
| NFR02 | The system shall operate on Windows and Linux platforms.                                                                  |
| NFR03 | The interface shall remain simple and intuitive.                                                                          |
| NFR04 | The database shall contain information exclusively obtained from official package inserts.                                |
| NFR05 | The pharmacological database shall support future updates without requiring modifications to the application source code. |

---

# 6. Business Rules

| Code | Rule                                                                                                       |
| ---- | ---------------------------------------------------------------------------------------------------------- |
| BR01 | Only one search input may be used per consultation.                                                        |
| BR02 | Clinical signs must originate from official medication package inserts.                                    |
| BR03 | Only officially registered veterinary medications may be included in the database.                         |
| BR04 | Each commercial formulation shall be associated with active ingredient.                                    |
| BR05 | Pharmacological information displayed shall correspond exclusively to the medication selected by the user. |

---

# 7. Project Scope

VetBridge is designed exclusively as a pharmacological consultation support tool.

The system does **not**:

* Perform diagnoses.
* Recommend therapeutic protocols.
* Interpret laboratory or imaging examinations.
* Suggest drug combinations or interactions.
* Replace clinical decision-making.

Its purpose is limited to providing organized pharmacological information and dosage calculations.

---

# 8. Disclaimer

VetBridge is intended exclusively as an informational and educational support tool.

The information provided does not replace professional veterinary judgment, nor should it be interpreted as medical advice or treatment recommendation.

All clinical decisions remain entirely under the responsibility of the attending veterinarian.
