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
