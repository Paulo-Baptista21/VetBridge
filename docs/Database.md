# Database

## Current State

The VetBridge relational model is implemented in MySQL for the current project scope.

The database structure includes domain tables, associative tables, foreign keys, uniqueness constraints, referential actions, and validation of positive dosage values.

The current structure is exported to [`schema.sql`](https://chatgpt.com/06%20-%20Banco%20de%20Dados/schema.sql).

## Main Tables

- `fabricante`
    
- `nome_comercial`
    
- `apresentacao_comercial`
    
- `principio_ativo`
    
- `sinal_clinico`
    
- `especie`
    
- `uso_farmacologico`
    
- `regime_posologico`
    

## Associative Tables

- `principio_ativo_nome_comercial`
    
- `sinal_clinico_principio_ativo`
    

These tables use composite primary keys to prevent duplicate relationships.

## Core Relationships

### Manufacturer and Commercial Name

A manufacturer may produce multiple commercial names.

Each commercial name belongs to one manufacturer.

### Commercial Name and Commercial Presentation

A commercial name may have multiple commercial presentations.

Each commercial presentation belongs to one commercial name and stores its composition as text.

### Active Ingredient and Commercial Name

Active ingredients and commercial names have an N:N relationship represented by `principio_ativo_nome_comercial`.

### Clinical Sign and Active Ingredient

Clinical signs and active ingredients have an N:N relationship represented by `sinal_clinico_principio_ativo`.

### Commercial Presentation and Species

A commercial presentation may be used by multiple species, and a species may have multiple commercial presentations.

This relationship is represented by `uso_farmacologico`.

Each presentation-and-species combination may have only one pharmacological-use record.

### Pharmacological Use and Dosage Regimen

A pharmacological use may have multiple dosage regimens.

Each `regime_posologico` stores:

- indication;
    
- dose in mg/kg;
    
- administration route;
    
- administration interval;
    
- complementary dosage instructions.
    

This separation allows one presentation to retain multiple calculable doses for the same species without duplicating its general safety information.

## Dosage Calculation

After a dosage regimen is selected, the total dose is calculated as:

```text
total dose (mg) = body weight (kg) × dose (mg/kg)
```

The database requires `dose_mg_por_kg` to be greater than zero.

## Referential Integrity

Foreign keys use `RESTRICT` when dependent records with their own content must be protected from accidental deletion.

`CASCADE` is used for pure associations and records that have no meaning without their parent.

`ON UPDATE CASCADE` keeps foreign-key references synchronized if a referenced identifier is changed.

