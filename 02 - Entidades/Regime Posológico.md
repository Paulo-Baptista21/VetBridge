
## Definição

Conjunto de informações que descreve um esquema terapêutico calculável dentro de um [[Uso Farmacológico]].

A separação em regimes permite que uma mesma apresentação comercial possua mais de uma dose para a mesma espécie, conforme a indicação e as demais condições de uso.

## Atributos

- Indicação
    
- Dose em mg/kg
    
- Via de administração
    
- Intervalo
    
- Posologia textual
    

## Relacionamentos

- Pertence a um [[Uso Farmacológico]]
    

## Representação lógica

A tabela `regime_posologico` possui:

- `id`
    
- `uso_farmacologico_id`
    
- `indicacao`
    
- `dose_mg_por_kg`
    
- `via_administracao`
    
- `intervalo`
    
- `posologia`
    

Cada regime possui sua própria `dose_mg_por_kg`, armazenada como `DECIMAL(10,4)` para utilização pela calculadora.

## Calculadora

Após a seleção do regime, a dose total é calculada por:

`dose total (mg) = peso (kg) × dose_mg_por_kg`
