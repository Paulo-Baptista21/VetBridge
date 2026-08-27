# Diagrama Entidade-Relacionamento

Documentação das versões gráficas da modelagem conceitual do VetBridge.

## Estado atual

A versão V5 é a última representação gráfica produzida e será mantida como registro histórico da evolução do projeto.

As decisões posteriores à V5 estão consolidadas em:

- [[Decisões de Arquitetura]];
    
- [[Modelo Lógico]].
    

Esses dois documentos representam o estado vigente da arquitetura e constituem a fonte utilizada para a implementação inicial em MySQL.

Uma nova versão gráfica do DER poderá ser produzida futuramente como refinamento documental, sem bloquear a implementação do banco de dados.

## DER V5

![[DER VetBridge V5.pdf]]

A versão V5 incorporou:

- separação entre Nome Comercial e Apresentação Comercial;
    
- relacionamento 1:N entre Nome Comercial e Apresentação Comercial;
    
- transferência do relacionamento com Espécie para Apresentação Comercial;
    
- manutenção de Uso Farmacológico como relacionamento com atributos;
    
- relacionamento 1:N entre Fabricante e Nome Comercial.
    

## Decisões posteriores à V5

Após a construção do DER V5, foram consolidadas as seguintes alterações:

- Classe Farmacológica foi renomeada para Classe Terapêutica e permaneceu como atributo textual de Princípio Ativo;
    
- Apresentação Comercial foi reduzida a `id`, `nome_comercial_id` e `composicao`;
    
- composição e concentração passaram a ser armazenadas textualmente em `apresentacao_comercial.composicao`;
    
- Uso Farmacológico recebeu `dose_mg_por_kg` como atributo numérico;
    
- a calculadora passou a produzir exclusivamente uma dose em miligramas a partir do peso e da dose em mg/kg;
    
- foram definidas chaves, nulabilidade, unicidade, validação da dose e ações referenciais no modelo lógico.
    

Essas alterações preservam o núcleo funcional:

`sinal clínico ↔ princípio ativo ↔ nome comercial`

## Histórico de diagramas

### Versão inicial

![[DER VetBridge.pdf]]

### Versão 2

![[DER VetBridge V2.pdf]]

### Versão 3

![[DER VetBridge V3.pdf]]

### Versão 4

![[DER VetBridge V4.pdf]]

### Versão 5

![[DER VetBridge V5.pdf]]

As versões anteriores não deverão ser utilizadas como fonte para a criação das tabelas SQL.