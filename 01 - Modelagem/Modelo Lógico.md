
Conversão progressiva da modelagem conceitual do VetBridge em estruturas relacionais.
## Estado

Concluído e validado para a implementação inicial em MySQL.

O modelo define as tabelas, colunas, tipos de dados, chaves primárias, chaves estrangeiras, nulabilidade, restrições de unicidade, validação da dose e ações referenciais necessárias ao escopo atual do VetBridge.

## Regras de conversão

### Convenção para nome e descrição

As entidades que possuírem os atributos `nome` ou `descricao` seguirão a padronização:

`nome VARCHAR(100) NOT NULL`

`descricao TEXT NOT NULL`

A convenção define tipo e obrigatoriedade, mas não concede automaticamente a restrição `UNIQUE`.

A unicidade de `nome` será avaliada separadamente conforme as regras de negócio de cada entidade.
### Identificadores

As tabelas que representam registros com identidade própria utilizarão:

`id INT AUTO_INCREMENT PRIMARY KEY`

Essa convenção será aplicada a:

- `fabricante`;
    
- `especie`;
    
- `sinal_clinico`;
    
- `principio_ativo`;
    
- `nome_comercial`;
    
- `apresentacao_comercial`;
    
- `uso_farmacologico`.
    

Embora Uso Farmacológico não seja uma entidade independente do domínio, seus registros possuirão identidade técnica própria devido aos atributos e às operações individuais previstas.

As tabelas associativas puras não possuirão coluna `id`:

- `principio_ativo_nome_comercial`;
    
- `sinal_clinico_principio_ativo`.
    

Nelas, a combinação das duas chaves estrangeiras formará a chave primária composta.

### Relacionamentos 1:N

A chave estrangeira será armazenada na tabela localizada no lado N da relação.

### Relacionamentos N:N sem atributos próprios

Serão convertidos em tabelas associativas contendo:

- uma chave estrangeira para cada entidade;
    
- chave primária composta pelas duas chaves estrangeiras;
    
- nenhuma coluna `id` independente.
    

Cada linha da tabela associativa representa uma única ocorrência da relação.

### Ações referenciais

As chaves estrangeiras utilizarão ações referenciais conforme a natureza dos registros dependentes.

|Chave estrangeira|`ON DELETE`|`ON UPDATE`|
|---|---|---|
|`nome_comercial.fabricante_id`|`RESTRICT`|`CASCADE`|
|`apresentacao_comercial.nome_comercial_id`|`RESTRICT`|`CASCADE`|
|`uso_farmacologico.apresentacao_comercial_id`|`RESTRICT`|`CASCADE`|
|`uso_farmacologico.especie_id`|`RESTRICT`|`CASCADE`|
|`principio_ativo_nome_comercial.principio_ativo_id`|`CASCADE`|`CASCADE`|
|`principio_ativo_nome_comercial.nome_comercial_id`|`CASCADE`|`CASCADE`|
|`sinal_clinico_principio_ativo.sinal_clinico_id`|`CASCADE`|`CASCADE`|
|`sinal_clinico_principio_ativo.principio_ativo_id`|`CASCADE`|`CASCADE`|

`ON DELETE RESTRICT` protegerá entidades e registros com conteúdo próprio contra exclusões enquanto existirem dependências.

`ON DELETE CASCADE` removerá automaticamente apenas os vínculos armazenados nas tabelas associativas puras quando uma das entidades participantes for excluída.

`ON UPDATE CASCADE` manterá todas as chaves estrangeiras sincronizadas caso um identificador referenciado seja excepcionalmente alterado.

## Princípio Ativo

A tabela `principio_ativo` representa as substâncias responsáveis pelos efeitos farmacológicos dos medicamentos cadastrados.

### principio_ativo

| Coluna               | Tipo           | Restrição                                   | Função                                                       |
| -------------------- | -------------- | ------------------------------------------- | ------------------------------------------------------------ |
| `id`                 | `INT`          | `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL` | Identifica unicamente o princípio ativo                      |
| `nome`               | `VARCHAR(100)` | `NOT NULL`, `UNIQUE`                        | Armazena o nome do princípio ativo sem permitir duplicidades |
| `classe_terapeutica` | `VARCHAR(100)` | `NOT NULL`                                  | Armazena o rótulo técnico da classe terapêutica              |
| `descricao`          | `TEXT`         | `NOT NULL`                                  | Armazena a descrição detalhada do princípio ativo            |

Classe Terapêutica permanecerá como atributo textual. Não será criada uma tabela independente para representá-la no escopo atual.

## Sinal Clínico

A tabela `sinal_clinico` representa os sinais clínicos utilizados como ponto inicial de pesquisa no VetBridge.

### sinal_clinico

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`id`|`INT`|`PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`|Identifica unicamente o sinal clínico|
|`nome`|`VARCHAR(100)`|`NOT NULL`, `UNIQUE`|Armazena o nome do sinal clínico sem permitir duplicidades|
|`descricao`|`TEXT`|`NOT NULL`|Armazena a descrição detalhada do sinal clínico|

`VARCHAR(100)` será utilizado em `nome` porque o conteúdo possui tamanho curto e previsível e poderá participar de pesquisas e restrições de unicidade.

`TEXT` será utilizado em `descricao` porque o conteúdo poderá conter explicações extensas provenientes de documentação oficial.

## Espécie

A tabela `especie` representa as categorias de seres vivos atendidas pelo VetBridge.

### especie

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`id`|`INT`|`PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`|Identifica unicamente a espécie|
|`nome`|`VARCHAR(100)`|`NOT NULL`, `UNIQUE`|Armazena o nome da espécie sem permitir duplicidades|

A entidade não receberá atributos adicionais no escopo atual. Seu nome é suficiente para identificá-la e relacioná-la aos registros de uso farmacológico.

## Fabricante 1:N Nome Comercial

Um fabricante pode produzir vários nomes comerciais.

Cada nome comercial pertence obrigatoriamente a um único fabricante.


### fabricante

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`id`|`INT`|`PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`|Identifica unicamente o fabricante|
|`nome`|`VARCHAR(100)`|`NOT NULL`, `UNIQUE`|Armazena o nome do fabricante sem permitir duplicidades|
### nome_comercial

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`id`|`INT`|`PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`|Identifica unicamente o nome comercial|
|`nome`|`VARCHAR(100)`|`NOT NULL`|Armazena o nome comercial sem informações da apresentação|
|`fabricante_id`|`INT`|`FOREIGN KEY`, `NOT NULL`|Identifica o fabricante responsável pelo produto|

Referência:

`nome_comercial.fabricante_id → fabricante.id`

Restrição de unicidade:

`UNIQUE (nome, fabricante_id)`

A combinação impede que o mesmo fabricante cadastre duas vezes o mesmo nome comercial, sem presumir que o nome seja universalmente exclusivo entre fabricantes diferentes.

As informações específicas da apresentação, incluindo composição e concentração, não serão armazenadas em `nome_comercial`. Elas pertencerão textualmente a `apresentacao_comercial`.

## Nome Comercial 1:N Apresentação Comercial

Um nome comercial pode possuir várias apresentações comerciais.

Cada apresentação comercial pertence obrigatoriamente a um único nome comercial.

### apresentacao_comercial

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`id`|`INT`|`PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL`|Identifica unicamente a apresentação comercial|
|`nome_comercial_id`|`INT`|`FOREIGN KEY`, `NOT NULL`|Identifica o nome comercial ao qual a apresentação pertence|
|`composicao`|`TEXT`|`NOT NULL`|Armazena textualmente a composição e a concentração da apresentação comercial|

Referência:

`apresentacao_comercial.nome_comercial_id → nome_comercial.id`

Não será armazenado `fabricante_id` em `apresentacao_comercial`, pois o fabricante já pode ser identificado por meio de `nome_comercial`.

Forma farmacêutica, concentração e quantidade por unidade não receberão colunas estruturadas próprias no escopo atual. Quando relevantes para a consulta, essas informações serão registradas textualmente em `composicao`.

O identificador `id` será a única chave exclusiva de `apresentacao_comercial`.

Não será aplicada uma restrição `UNIQUE` envolvendo `composicao`, pois seu conteúdo textual livre não constitui uma chave natural confiável. A prevenção de registros duplicados será realizada durante a inserção controlada e a revisão dos dados.

## Princípio Ativo N:N Nome Comercial

O relacionamento será representado pela tabela associativa `principio_ativo_nome_comercial`.

### principio_ativo_nome_comercial

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`principio_ativo_id`|`INT`|`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`|Identifica o princípio ativo associado|
|`nome_comercial_id`|`INT`|`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`|Identifica o nome comercial associado|

Chave primária composta:

`PRIMARY KEY (principio_ativo_id, nome_comercial_id)`

Referências:

`principio_ativo_nome_comercial.principio_ativo_id → principio_ativo.id`

`principio_ativo_nome_comercial.nome_comercial_id → nome_comercial.id`

A tabela não possuirá um `id` próprio. A combinação das duas chaves estrangeiras identifica unicamente cada associação e impede a repetição do mesmo vínculo.

## Sinal Clínico N:N Princípio Ativo

O relacionamento será representado pela tabela associativa `sinal_clinico_principio_ativo`.

### sinal_clinico_principio_ativo

|Coluna|Tipo|Restrição|Função|
|---|---|---|---|
|`sinal_clinico_id`|`INT`|`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`|Identifica o sinal clínico associado|
|`principio_ativo_id`|`INT`|`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`|Identifica o princípio ativo associado|

Chave primária composta:

`PRIMARY KEY (sinal_clinico_id, principio_ativo_id)`

Referências:

`sinal_clinico_principio_ativo.sinal_clinico_id → sinal_clinico.id`

`sinal_clinico_principio_ativo.principio_ativo_id → principio_ativo.id`

A tabela não possuirá um `id` próprio. A combinação das duas chaves estrangeiras identifica unicamente cada associação e impede a repetição do mesmo vínculo.

## Apresentação Comercial N:N Espécie

O relacionamento entre Apresentação Comercial e Espécie será representado pela tabela associativa `uso_farmacologico`.

Uso Farmacológico não constitui uma entidade independente do domínio, mas seus registros possuirão identidade técnica própria porque contêm atributos e serão manipulados individualmente pela aplicação.

### uso_farmacologico

| Coluna                      | Tipo            | Restrição                                   | Função                                                                 |
| --------------------------- | --------------- | ------------------------------------------- | ---------------------------------------------------------------------- |
| `id`                        | `INT`           | `PRIMARY KEY`, `AUTO_INCREMENT`, `NOT NULL` | Identifica unicamente o registro de uso farmacológico                  |
| `apresentacao_comercial_id` | `INT`           | `FOREIGN KEY`, `NOT NULL`                   | Identifica a apresentação comercial correspondente                     |
| `especie_id`                | `INT`           | `FOREIGN KEY`, `NOT NULL`                   | Identifica a espécie correspondente                                    |
| `dose_mg_por_kg`            | `DECIMAL(10,4)` | `NOT NULL`, `CHECK (dose_mg_por_kg > 0)`    | Armazena numericamente a dose em mg/kg utilizada pela calculadora      |
| `posologia`                 | `TEXT`          | `NOT NULL`                                  | Armazena as orientações posológicas complementares                     |
| `via_administracao`         | `VARCHAR(100)`  | `NOT NULL`                                  | Armazena a via de administração                                        |
| `intervalo`                 | `VARCHAR(100)`  | `NOT NULL`                                  | Armazena o intervalo ou a frequência de administração                  |
| `indicacoes`                | `TEXT`          | `NOT NULL`                                  | Armazena as indicações farmacológicas                                  |
| `contraindicacoes`          | `TEXT`          | `NOT NULL`                                  | Armazena as contraindicações ou a declaração explícita de sua ausência |
| `advertencias`              | `TEXT`          | aceita `NULL`                               | Armazena advertências de uso, quando disponíveis                       |
| `reacoes_adversas`          | `TEXT`          | aceita `NULL`                               | Armazena reações adversas, quando disponíveis                          |

Referências:

`uso_farmacologico.apresentacao_comercial_id → apresentacao_comercial.id`

`uso_farmacologico.especie_id → especie.id`

Restrição de unicidade:

`UNIQUE (apresentacao_comercial_id, especie_id)`

Cada combinação entre apresentação comercial e espécie poderá possuir apenas um registro de uso farmacológico.

O identificador `id` será a chave primária simples da tabela. A combinação das duas chaves estrangeiras permanecerá única para impedir a duplicação do mesmo uso farmacológico.

A calculadora utilizará:

`dose calculada em mg = peso em kg × uso_farmacologico.dose_mg_por_kg`

## Validação e normalização

O modelo lógico foi validado para o escopo atual do VetBridge.

A Primeira Forma Normal é atendida porque cada coluna armazena um único valor compatível com sua finalidade. `composicao` permanece deliberadamente como uma descrição textual única e não será utilizada em operações estruturadas sobre substâncias, quantidades ou unidades.

A Segunda Forma Normal é atendida porque as tabelas associativas com chaves primárias compostas não possuem atributos dependentes de apenas uma parte da chave.

A Terceira Forma Normal é atendida porque os atributos não chave dependem das respectivas chaves primárias, sem duplicação desnecessária de dados derivados de outras tabelas. O fabricante, por exemplo, é armazenado em `nome_comercial` e não repetido em `apresentacao_comercial`.

As redundâncias textuais entre `composicao`, indicações farmacológicas e os relacionamentos estruturados são deliberadas: os textos preservam informações de consulta provenientes das bulas, enquanto as tabelas associativas sustentam a navegação estruturada entre as entidades.

Alterações futuras deverão ser tratadas como refatorações motivadas por novos requisitos, não como pendências do modelo atual.