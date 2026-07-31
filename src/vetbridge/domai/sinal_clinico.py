class SinalClinico:

    def __init__(self, id, nome, descricao):

        self.id = id
        self.nome = nome
        self.descricao = descricao

        self.principios_ativos = []

    def associar_principio_ativo(self, principio_ativo):

        self.principios_ativos.append(principio_ativo)
