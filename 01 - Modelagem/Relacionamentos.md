## Sinal Clínico ↔ Princípio Ativo

**Relacionamento**

> Está associado a

**Cardinalidade**

N:N

Um sinal clínico pode estar associado a vários princípios ativos.

Um princípio ativo pode estar associado a vários sinais clínicos.

O relacionamento será representado pela tabela associativa `sinal_clinico_principio_ativo`.

---

## Princípio Ativo ↔ Nome Comercial

**Relacionamento**

> Está associado a

**Cardinalidade**

N:N

Um princípio ativo pode estar associado a diversos nomes comerciais.

Um nome comercial deve estar associado a um ou mais princípios ativos.

O relacionamento será representado pela tabela associativa `principio_ativo_nome_comercial`.

---

## Fabricante ↔ Nome Comercial

**Relacionamento**

> Produz

**Cardinalidade**

1:N

Um fabricante pode produzir diversos nomes comerciais.

Cada nome comercial cadastrado pertence obrigatoriamente a um único fabricante.

Produtos de fabricantes diferentes podem possuir o mesmo nome ou conter o mesmo princípio ativo sem alterar a cardinalidade desse relacionamento.

---

## Nome Comercial ↔ Apresentação Comercial

**Relacionamento**

> Possui

**Cardinalidade**

1:N

Um nome comercial pode possuir uma ou mais apresentações comerciais.

Cada apresentação comercial pertence obrigatoriamente a um único nome comercial.

No escopo atual, a apresentação comercial armazenará textualmente sua composição e concentração no atributo `composicao`.

---

## Apresentação Comercial ↔ Espécie

**Relacionamento**

> Possui uso farmacológico para

**Cardinalidade**

N:N

Uma apresentação comercial pode possuir informações de uso para uma ou mais espécies.

Uma espécie pode possuir informações de uso para diversas apresentações comerciais.

O relacionamento será representado pela tabela associativa `uso_farmacologico`, que possuirá identidade técnica própria e atributos específicos.

### Informações pertencentes ao relacionamento

- Dose em mg/kg;
    
- Posologia;
    
- Via de administração;
    
- Intervalo;
    
- Indicações;
    
- Contraindicações;
    
- Advertências;
    
- Reações adversas.
    

Essas informações descrevem o uso de uma apresentação comercial específica em determinada espécie. Portanto, não pertencem isoladamente à apresentação comercial nem à espécie.

A dose em mg/kg será armazenada numericamente em `uso_farmacologico.dose_mg_por_kg` e utilizada pela calculadora de dose em miligramas.