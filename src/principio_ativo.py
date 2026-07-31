class PrincipioAtivo:

    def __init__(self, id, nome, classe_farmacologica, descricao):

        self.id = id
        self.nome = nome
        self.classe_farmacologica = classe_farmacologica
        self.descricao = descricao

        self.nomes_comerciais = []

        self.sinais_clinicos = []

    def associar_nome_comercial(self, nome_comercial):

        self.nomes_comerciais.append(nome_comercial)

    def associar_sinal_clinico(self, sinal_clinico):

        self.sinais_clinicos.append(sinal_clinico)
