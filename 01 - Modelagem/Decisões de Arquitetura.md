## Uso Farmacológico

Durante a Modelagem Conceitual, concluiu-se que Uso Farmacológico não representa uma entidade independente do domínio.

Ele corresponde ao relacionamento entre **Apresentação Comercial** e **Espécie**. Na modelagem lógica, existe um único registro de Uso Farmacológico para cada combinação entre apresentação e espécie.

O Uso Farmacológico concentra informações gerais de segurança que variam conforme essa combinação:

- Contraindicações
    
- Advertências
    
- Reações adversas
    

Os dados que podem formar mais de um esquema terapêutico para a mesma apresentação e espécie foram separados em **Regime Posológico**:

- Posologia
    
- Via de administração
    
- Intervalo
    
- Indicação
    
- Dose em mg/kg
    

Essa separação permite manter um único Uso Farmacológico sem limitar cada apresentação e espécie a uma única dose calculável.

## Regime Posológico

Um Uso Farmacológico pode possuir um ou mais Regimes Posológicos.

Cada regime representa uma combinação calculável de indicação, dose em mg/kg, via de administração, intervalo e posologia textual. A calculadora utiliza a dose do regime selecionado:

`dose total (mg) = peso (kg) × dose do regime (mg/kg)`

## Representação orientada a objetos

Na implementação em Python, Uso Farmacológico poderá ser representado por uma classe de associação, pois o relacionamento possui atributos próprios. Os regimes poderão ser representados como objetos relacionados a essa classe.

## Representação lógica

Na Modelagem Lógica, esse relacionamento deverá ser convertido em uma tabela associativa:

`USO_FARMACOLOGICO`

Ela possuirá referências para:

- `APRESENTACAO_COMERCIAL`
    
- `ESPECIE`
    

além dos atributos gerais de segurança do uso farmacológico.

A tabela `REGIME_POSOLOGICO` possuirá uma referência para `USO_FARMACOLOGICO` e armazenará:

- `indicacao`
    
- `dose_mg_por_kg`
    
- `via_administracao`
    
- `intervalo`
    
- `posologia`


## Estratégia de geração de identificadores

As tabelas que representam registros com identidade própria utilizarão chaves primárias numéricas geradas automaticamente:

`id INT AUTO_INCREMENT PRIMARY KEY`

A convenção será aplicada a:

- Fabricante;
    
- Espécie;
    
- Sinal Clínico;
    
- Princípio Ativo;
    
- Nome Comercial;
    
- Apresentação Comercial;
    
- Uso Farmacológico.
    

A geração automática elimina a atribuição manual de identificadores e mantém um padrão único entre as tabelas.

As tabelas associativas `principio_ativo_nome_comercial` e `sinal_clinico_principio_ativo` não possuirão identificador independente. Seus registros serão identificados pela chave primária composta formada pelas respectivas chaves estrangeiras.

## Ações referenciais das chaves estrangeiras

### Exclusão de registros com conteúdo próprio

As chaves estrangeiras que vinculam entidades ou registros com atributos próprios utilizarão:

`ON DELETE RESTRICT`

A regra será aplicada a:

- `nome_comercial.fabricante_id`;
    
- `apresentacao_comercial.nome_comercial_id`;
    
- `uso_farmacologico.apresentacao_comercial_id`;
    
- `uso_farmacologico.especie_id`.
    

A exclusão do registro referenciado será impedida enquanto existirem registros dependentes. Antes de excluir o registro principal, os vínculos deverão ser removidos ou transferidos explicitamente.

Essa política evita a exclusão automática de informações farmacológicas e comerciais com conteúdo próprio.

### Exclusão de associações puras

As chaves estrangeiras das tabelas associativas puras utilizarão:

`ON DELETE CASCADE`

A regra será aplicada a:

- `principio_ativo_nome_comercial`;
    
- `sinal_clinico_principio_ativo`.
    

Quando uma entidade participante for excluída, suas linhas de associação serão removidas automaticamente. A exclusão ficará restrita aos vínculos dependentes e não excluirá as demais entidades relacionadas.

Essa política é adequada porque as linhas dessas tabelas não possuem existência ou atributos próprios fora da associação representada.

### Exclusão de Regimes Posológicos

A chave estrangeira:

`regime_posologico.uso_farmacologico_id`

utilizará `ON DELETE CASCADE`.

Um Regime Posológico não possui significado independente do Uso Farmacológico ao qual pertence. Portanto, a exclusão de um Uso Farmacológico deverá remover automaticamente todos os seus regimes.

### Atualização de identificadores

Todas as chaves estrangeiras utilizarão:

`ON UPDATE CASCADE`

Caso uma chave primária referenciada seja excepcionalmente alterada, as chaves estrangeiras correspondentes serão atualizadas automaticamente para preservar a integridade dos relacionamentos.

Os identificadores gerados por `AUTO_INCREMENT` não deverão ser alterados durante o uso normal. A ação de atualização funcionará apenas como proteção de integridade para situações excepcionais.


## Classe Terapêutica como atributo

Classe Terapêutica será mantida como atributo de Princípio Ativo, não como entidade independente.

Na modelagem lógica, será representada por:

`principio_ativo.classe_terapeutica VARCHAR(100) NOT NULL`

A decisão considera que:

- a classe funciona como rótulo técnico de contextualização;
    
- o público previsto possui conhecimento profissional sobre seu significado;
    
- o sistema não prevê pesquisa ou navegação por classes terapêuticas;
    
- não há necessidade atual de armazenar descrições próprias das classes;
    
- a criação de uma entidade e de relacionamentos adicionais não atenderia a um requisito vigente.
    

Uma eventual transformação em entidade deverá ser considerada somente se futuras versões exigirem taxonomia controlada, múltiplas classificações ou pesquisa por classe.

## Padronização de nome e descrição

Os atributos denominados `nome` e `descricao` seguirão uma convenção comum na modelagem lógica:

`nome VARCHAR(100) NOT NULL`

`descricao TEXT NOT NULL`

A padronização reduz variações desnecessárias entre entidades com atributos semanticamente equivalentes.

A restrição `UNIQUE` não integra automaticamente essa convenção. Sua aplicação será decidida separadamente para cada entidade, conforme a respectiva regra de negócio.

## Unicidade e separação do Nome Comercial

Nome Comercial será identificado tecnicamente por `id` e possuirá unicidade composta por:

`UNIQUE (nome, fabricante_id)`

A restrição impede a repetição do mesmo nome dentro de um fabricante e permite distinguir produtos pertencentes a fabricantes diferentes.

Informações como forma farmacêutica, concentração ou quantidade por unidade não integrarão o atributo `nome`.

Mesmo quando aparecem junto ao nome na embalagem ou na apresentação visual do produto, essas informações serão armazenadas separadamente em `apresentacao_comercial`, preservando a distinção entre produto comercial e suas diferentes apresentações.


## Calculadora de dose — saída em miligramas

### Decisão

A calculadora do VetBridge receberá como entrada somente o peso do animal em quilogramas e apresentará como saída a dose farmacológica em miligramas.

A espécie e a regra posológica serão obtidas dos dados cadastrados no sistema, conforme o contexto consultado.

Fórmula geral:

dose calculada em mg = peso em kg × dose em mg/kg

### Justificativa

O VetBridge é destinado ao uso e ao aprendizado de seu próprio desenvolvedor, que possui formação em Medicina Veterinária. Portanto, não é necessário converter automaticamente a dose farmacológica para quantidade de comprimidos, volume em mililitros ou outra unidade administrável.

A apresentação comercial permanece relevante para consulta, mas sua concentração não participa do cálculo básico da dose em miligramas.

### Fora do escopo atual

- conversão da dose para número de comprimidos;
- conversão da dose para volume em mililitros;
- escolha automática de apresentação;
- arredondamento para frações administráveis;
- recomendação de ajuste prático da dose.

Essas funcionalidades somente serão consideradas como refatorações futuras caso surja uma necessidade concreta.


## Armazenamento e validação da dose

### Decisão

A dose em mg/kg será armazenada na tabela `regime_posologico`, por meio da coluna:

`dose_mg_por_kg DECIMAL(10,4) NOT NULL`

Cada Regime Posológico possuirá sua própria dose calculável.

A coluna utilizará a restrição:

`CHECK (dose_mg_por_kg > 0)`

### Justificativa

Uma mesma apresentação comercial pode possuir mais de um esquema terapêutico para a mesma espécie, conforme indicação, dose, via, intervalo ou outras condições de uso.

Manter a dose em `uso_farmacologico` limitaria cada combinação entre apresentação comercial e espécie a um único valor. Separá-la em Regime Posológico permite conservar todas as doses calculáveis sem duplicar as informações gerais de segurança.

A restrição `NOT NULL` garante a presença da dose, enquanto `CHECK (dose_mg_por_kg > 0)` impede o armazenamento de zero ou valores negativos.

### Fórmula da calculadora

`dose calculada em mg = peso em kg × regime_posologico.dose_mg_por_kg`

O peso do animal será informado durante a execução da calculadora e não será armazenado no banco.

## Obrigatoriedade dos dados

### Uso Farmacológico

Serão obrigatórios:

- `id`;
    
- `apresentacao_comercial_id`;
    
- `especie_id`.
    

Poderão receber `NULL`:

- `contraindicacoes`;
    
- `advertencias`;
    
- `reacoes_adversas`.
    

Os campos de segurança poderão permanecer nulos quando a informação não estiver disponível ou não for apresentada separadamente pela fonte consultada.

### Regime Posológico

Serão obrigatórios:

- `id`;
    
- `uso_farmacologico_id`;
    
- `indicacao`;
    
- `dose_mg_por_kg`;
    
- `via_administracao`;
    
- `intervalo`;
    
- `posologia`.
    

Um Regime Posológico deve conter todas as informações necessárias para identificar o esquema terapêutico e realizar o cálculo da dose.

## Tipos de dados

### uso_farmacologico

|Coluna|Tipo|
|---|---|
|`id`|`INT`|
|`apresentacao_comercial_id`|`INT`|
|`especie_id`|`INT`|
|`contraindicacoes`|`TEXT`|
|`advertencias`|`TEXT`|
|`reacoes_adversas`|`TEXT`|

### regime_posologico

|Coluna|Tipo|
|---|---|
|`id`|`INT`|
|`uso_farmacologico_id`|`INT`|
|`indicacao`|`VARCHAR(255)`|
|`dose_mg_por_kg`|`DECIMAL(10,4)`|
|`via_administracao`|`VARCHAR(100)`|
|`intervalo`|`VARCHAR(100)`|
|`posologia`|`TEXT`|

Os identificadores utilizam `INT` para manter compatibilidade entre as chaves. A dose utiliza `DECIMAL(10,4)` para preservar valores fracionários, enquanto os demais tipos refletem a extensão esperada de cada informação textual.

## Composição da apresentação comercial

### Decisão

A composição e a concentração de uma apresentação comercial serão armazenadas textualmente na coluna:

`apresentacao_comercial.composicao TEXT NOT NULL`

Não será criada uma tabela associativa específica para representar numericamente a composição de cada apresentação.

A relação estruturada entre princípios ativos e nomes comerciais continuará sendo registrada pela tabela associativa `principio_ativo_nome_comercial`.

### Justificativa

O objetivo atual do VetBridge é consolidar o aprendizado de ferramentas e conceitos de ADS, especialmente modelagem de dados e SQL.

A composição precisa ser consultada e exibida para leitura veterinária, mas não será utilizada em:

- cálculos;
- comparações numéricas;
- filtros por concentração;
- ordenações por quantidade de princípio ativo.

Estruturar individualmente cada substância, quantidade e unidade acrescentaria complexidade sem atender a uma necessidade atual do projeto.

### Consequências

- produtos com um ou vários princípios ativos poderão ter sua composição descrita livremente;
- a calculadora não utilizará a concentração da apresentação;
- o banco não realizará operações matemáticas sobre a composição;
- consultas estruturadas por concentração não farão parte do escopo atual.

Uma composição numericamente estruturada somente será considerada como refatoração futura caso surja uma necessidade concreta.

## Identificação e unicidade da apresentação comercial

### Decisão

A tabela `apresentacao_comercial` utilizará somente:

`id INT AUTO_INCREMENT PRIMARY KEY`

como identificador exclusivo de cada apresentação.

Não será criada uma restrição `UNIQUE` adicional envolvendo `nome_comercial_id` e `composicao`.

### Justificativa

A coluna `composicao` será armazenada como `TEXT` livre e poderá conter diferenças legítimas ou meramente textuais de escrita, pontuação e formatação.

Por esse motivo, seu conteúdo não constitui uma chave natural confiável para determinar se duas apresentações são iguais.

Utilizar um campo textual extenso em uma restrição de unicidade acrescentaria complexidade técnica sem garantir uma prevenção consistente de duplicidades.

No escopo atual, a base será pequena e mantida de forma controlada. A prevenção de apresentações duplicadas será realizada durante a inserção e a revisão dos dados.

Uma chave natural ou outra forma automatizada de deduplicação somente será considerada se surgir uma necessidade concreta em versões futuras.
## Finalidade didática e limite funcional do VetBridge

### Decisão

O VetBridge é um projeto didático destinado à aplicação prática de ferramentas e conceitos de Análise e Desenvolvimento de Sistemas.

Ele não pretende substituir plataformas veterinárias existentes, reproduzir integralmente uma rotina clínica nem oferecer um catálogo farmacológico comercial completo.

Seu núcleo funcional permanece:

sinal clínico ↔ princípio ativo ↔ nome comercial

O sistema deve permitir atingir facilmente qualquer um desses elementos a partir dos demais.

### Critério para inclusão de estruturas

Uma tabela, coluna ou funcionalidade somente será adicionada quando atender diretamente a pelo menos um dos seguintes objetivos:

1. sustentar a relação central entre sinal clínico, princípio ativo e nome comercial;
2. viabilizar a calculadora simples de dose em miligramas;
3. permitir a aplicação deliberada de um conceito ou ferramenta presente no roadmap de aprendizagem.

Informações que não atendam a esses critérios não deverão ampliar o modelo apenas porque existem em plataformas veterinárias profissionais.

### Referências externas

Plataformas como o VetSmart poderão ser consultadas como referências funcionais para:

- compreender possibilidades de organização;
- identificar lacunas relevantes;
- observar comportamentos de interface;
- esclarecer necessidades específicas.

Essas referências não constituem requisitos do VetBridge e não deverão gerar automaticamente novas funcionalidades ou estruturas.

### Fora do escopo

Permanecem fora do escopo atual:

- reprodução completa de catálogos farmacológicos;
- embalagens e quantidades comercializadas;
- controle de estoque;
- conversão automática para comprimidos ou mililitros;
- rotinas completas de prescrição;
- detalhamento clínico sem utilidade didática concreta;
- requisitos próprios de um sistema destinado à produção ou ao mercado.

### Apresentação comercial

A tabela `apresentacao_comercial` será mantida de forma mínima, contendo:

- `id`;
- `nome_comercial_id`;
- `composicao`.

Não serão adicionadas colunas específicas para embalagem, quantidade de unidades ou outros detalhes comerciais no escopo atual.