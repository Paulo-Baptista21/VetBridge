
## Definição

Associação entre uma [[Apresentação Comercial]] e uma [[Espécie]], responsável por reunir as informações gerais de segurança aplicáveis a essa combinação.

Existe apenas um Uso Farmacológico para cada combinação entre apresentação comercial e espécie.

## Atributos

- Contraindicações
    
- Advertências
    
- Reações adversas
    

## Relacionamentos

- Pertence a uma [[Apresentação Comercial]]
    
- Pertence a uma [[Espécie]]
    
- Possui um ou mais [[Regime Posológico|Regimes Posológicos]]
    

## Representação lógica

A tabela `uso_farmacologico` possui:

- `id`
    
- `apresentacao_comercial_id`
    
- `especie_id`
    
- `contraindicacoes`
    
- `advertencias`
    
- `reacoes_adversas`
    

O par `apresentacao_comercial_id + especie_id` deve ser único.