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
