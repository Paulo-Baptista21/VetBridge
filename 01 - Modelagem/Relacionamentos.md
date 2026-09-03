## Sinal Clínico ↔ Princípio Ativo

**Relacionamento**

> Está associado a

**Cardinalidade**

N:N

Um sinal clínico pode estar associado a vários princípios ativos.

Um princípio ativo pode estar associado a vários sinais clínicos.

---

## Princípio Ativo ↔ Nome Comercial

**Relacionamento**

> Possui

**Cardinalidade**

N:N

Um princípio ativo pode originar diversos nomes comerciais.

Um nome comercial pode conter um ou mais princípios ativos.

---

## Fabricante ↔ Nome Comercial

**Relacionamento**

> Produz

**Cardinalidade**

1:N

Um fabricante pode produzir diversos nomes comerciais.

Cada nome comercial cadastrado pertence a um único fabricante.

Produtos de fabricantes diferentes podem conter o mesmo princípio ativo, mas são cadastrados como produtos comerciais distintos.

A presença do mesmo princípio ativo em produtos diferentes não transforma o relacionamento entre Fabricante e Nome Comercial em N:N.

---

## Apresentação Comercial ↔ Espécie

**Cardinalidade**

N:N

Uma apresentação comercial pode ser indicada para uma ou mais espécies. Uma espécie pode ser atendida por diversas apresentações comerciais.

Na modelagem lógica, esse relacionamento é representado por [[Uso Farmacológico]]. Existe um único Uso Farmacológico para cada combinação entre apresentação comercial e espécie.

### Informações gerais pertencentes ao uso farmacológico

- Contraindicações
    
- Advertências
    
- Reações adversas
    

Essas informações não pertencem isoladamente à apresentação comercial nem à espécie.

---

## Uso Farmacológico ↔ Regime Posológico

**Relacionamento**

> Possui

**Cardinalidade**

1:N

Um Uso Farmacológico pode possuir um ou mais [[Regime Posológico|Regimes Posológicos]].

Cada Regime Posológico pertence a um único Uso Farmacológico e reúne:

- Posologia
    
- Via de administração
    
- Intervalo
    
- Indicação
    
- Dose em mg/kg
    

---

## Nome Comercial ↔ Apresentação Comercial

**Relacionamento**

> Possui

**Cardinalidade**

1:N

Um nome comercial pode possuir uma ou mais apresentações comerciais.

Cada apresentação comercial pertence a um único nome comercial.

Na implementação lógica vigente, uma apresentação comercial registra sua composição em texto, preservando a descrição da bula oficial sem decomposição estrutural obrigatória.