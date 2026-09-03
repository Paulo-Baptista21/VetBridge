
Check-points da construção do projeto.
## Fase 1 — Fundação do Projeto  
- [x] Definição do objetivo  
- [x] Levantamento de requisitos  
- [x] Definição do escopo  
- [x] Regras de negócio  
- [x] Fluxo geral do sistema  
- [x] Estrutura inicial do GitHub  
  
---  
  
## Fase 2 — Modelagem Conceitual _(Concluída no escopo atual)_

- [x]  Identificação das entidades;
    
- [x]  Definição dos atributos;
    
- [x]  Definição dos relacionamentos;
    
- [x]  Construção das primeiras versões do MER;
    
- [x]  Inclusão de Apresentação Comercial;
    
- [x]  Revisão do relacionamento entre Apresentação Comercial e Espécie;
    
- [x]  Construção do DER V5;
    
- [x]  Validação final da modelagem conceitual conforme o escopo vigente.
    

---

## Fase 3 — Modelagem Lógica _(Concluída no escopo atual)_

- [x]  Conversão do modelo conceitual em tabelas;
    
- [x]  Definição das colunas e dos tipos de dados;
    
- [x]  Definição das chaves primárias;
    
- [x]  Definição das chaves estrangeiras;
    
- [x]  Definição de nulabilidade e unicidade;
    
- [x]  Definição das ações referenciais;
    
- [x]  Definição da validação numérica da dose;
    
- [x]  Normalização;
    
- [x]  Validação final para implementação inicial em MySQL.
      

---

## **Fase 4 — Modelagem Orientada a Objetos** _(Em andamento)_


- [x] Implementação inicial das primeiras classes
- [x] Implementação inicial dos métodos de relacionamento
- [x] Implementação da classe Fabricante
- [x] Implementação da classe NomeComercial
- [x] Implementação da classe ApresentacaoComercial
- [x] Implementação da classe Especie
- [x] Implementação da classe UsoFarmacologico
- [x] Implementação da classe RegimePosologico
- [x] Sincronização entre Uso Farmacológico e Regime Posológico
- [x] Implementação dos relacionamentos bidirecionais
- [x] Verificações de criação, associação e prevenção de duplicações
- [ ] Validação de dados no modelo orientado a objetos

---

## Fase 5 — Banco de Dados _(Concluída no escopo atual)_


- [x] Criação do banco `vetbridge`
- [x] Adequação das tabelas preliminares ao modelo lógico vigente
- [x] Implementação das tabelas previstas no modelo atual
- [x] Inserção dos primeiros registros relacionados
- [x] Testes de integridade e restrições
- [x] Aplicação das consultas estudadas ao VetBridge
- [x] Implementação do cálculo de dose por peso
- [x] Integração do MySQL com o VS Code
- [x] Exportação da estrutura vigente para `schema.sql`

---

## Fase 6 — Desenvolvimento da Aplicação

- [ ]  Menu inicial
- [ ]  Sistema de busca
- [ ]  Navegação entre entidades
- [ ]  Exibição das informações farmacológicas
- [ ]  Calculadora de doses
- [ ]  Persistência dos dados

---

## Fase 7 — Refinamento

- [ ]  Interface
- [ ]  Testes
- [ ]  Documentação final

## Padronização do repositório

- [ ] Normalizar o idioma, os nomes e a organização dos arquivos para apresentação do VetBridge como portfólio.
