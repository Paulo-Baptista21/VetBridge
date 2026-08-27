
Representação em Python das [[Entidades]] e o qual [[Relacionamentos]] elas devem ter.

## Sinal Clínico:

class SinalClinico:

    def __init__(self, id, nome, descricao):
        self.id = id
        self.nome = nome
        self.descricao = descricao

        self.principios_ativos = []

    def associar_principio_ativo(self, principio_ativo):
        if principio_ativo not in self.principios_ativos:
            self.principios_ativos.append(principio_ativo)

        if self not in principio_ativo.sinais_clinicos:
            principio_ativo.sinais_clinicos.append(self)

## Princípio Ativo:

class PrincipioAtivo:


    def __init__(self, id, nome, classe_terapeutica, descricao):
        self.id = id
        self.nome = nome
        self.classe_terapeutica = classe_terapeutica
        self.descricao = descricao

        self.sinais_clinicos = []
        self.nomes_comerciais = []

    def associar_sinal_clinico(self, sinal_clinico):
        if sinal_clinico not in self.sinais_clinicos:
            self.sinais_clinicos.append(sinal_clinico)

        if self not in sinal_clinico.principios_ativos:
            sinal_clinico.principios_ativos.append(self)

    def associar_nome_comercial(self, nome_comercial):
        if nome_comercial not in self.nomes_comerciais:
            self.nomes_comerciais.append(nome_comercial)

        if self not in nome_comercial.principios_ativos:
            nome_comercial.principios_ativos.append(self)


## Fabricante:

class Fabricante:

    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

        self.nomes_comerciais = []

    def associar_nome_comercial(self, nome_comercial):
        if nome_comercial not in self.nomes_comerciais:
            self.nomes_comerciais.append(nome_comercial)

        if nome_comercial.fabricante is not self:
            nome_comercial.fabricante = self


## Nome Comercial:

class NomeComercial:

    def __init__(self, id, nome, fabricante):
        self.id = id
        self.nome = nome
        self.fabricante = fabricante

        self.principios_ativos = []
        self.apresentacoes = []

        fabricante.associar_nome_comercial(self)

    def associar_principio_ativo(self, principio_ativo):
        if principio_ativo not in self.principios_ativos:
            self.principios_ativos.append(principio_ativo)

        if self not in principio_ativo.nomes_comerciais:
            principio_ativo.nomes_comerciais.append(self)

    def adicionar_apresentacao(self, apresentacao):
        if apresentacao not in self.apresentacoes:
            self.apresentacoes.append(apresentacao)

        if apresentacao.nome_comercial is not self:
            apresentacao.nome_comercial = self


## Apresentação Comercial:

class ApresentacaoComercial:

    def __init__(self, id, composicao, nome_comercial):
        self.id = id
        self.composicao = composicao
        self.nome_comercial = nome_comercial

        self.usos_farmacologicos = []

        nome_comercial.adicionar_apresentacao(self)

    def adicionar_uso_farmacologico(self, uso_farmacologico):
        if uso_farmacologico not in self.usos_farmacologicos:
            self.usos_farmacologicos.append(uso_farmacologico)


## Espécie:

class Especie:

    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

        self.usos_farmacologicos = []

    def adicionar_uso_farmacologico(self, uso_farmacologico):
        if uso_farmacologico not in self.usos_farmacologicos:
            self.usos_farmacologicos.append(uso_farmacologico)


## Uso Farmacológico:

class UsoFarmacologico:

    def __init__(self, id, apresentacao_comercial, especie, dose_mg_por_kg, posologia, via_administracao, intervalo, indicacoes, contraindicacoes, advertencias, reacoes_adversas):
        self.id = id
        self.apresentacao_comercial = apresentacao_comercial
        self.especie = especie
        self.dose_mg_por_kg = dose_mg_por_kg
        self.posologia = posologia
        self.via_administracao = via_administracao
        self.intervalo = intervalo
        self.indicacoes = indicacoes
        self.contraindicacoes = contraindicacoes
        self.advertencias = advertencias
        self.reacoes_adversas = reacoes_adversas

        apresentacao_comercial.adicionar_uso_farmacologico(self)
        especie.adicionar_uso_farmacologico(self)