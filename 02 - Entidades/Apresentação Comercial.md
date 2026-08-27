

## Definição

Registro que representa uma apresentação específica vinculada a um nome comercial.

No escopo atual, sua finalidade é permitir a consulta textual da composição e da concentração informadas na bula oficial, sem estruturar separadamente substâncias, quantidades ou unidades.

## Atributos

- Composição
    

## Relacionamentos

- Pertence obrigatoriamente a um [[Nome Comercial]];
    
- Possui informações de uso específicas para uma ou mais [[Espécie|Espécies]] por meio de Uso Farmacológico.
    

## Exemplo

Um mesmo nome comercial pode possuir apresentações com composições diferentes:

- Nome Comercial X — `Cada comprimido contém 150 mg do princípio ativo`;
    
- Nome Comercial X — `Cada comprimido contém 600 mg do princípio ativo`.
    

As descrições completas serão armazenadas textualmente no atributo `composicao`.

## Observações

A composição poderá incluir concentração, forma de apresentação ou outras informações necessárias à leitura veterinária.

Essas informações não serão utilizadas em cálculos, comparações numéricas, filtros por concentração ou conversões para comprimidos e mililitros.

A calculadora utilizará exclusivamente o peso do animal e a dose em mg/kg armazenada no respectivo Uso Farmacológico.