class PrincipioAtivo:

    def __init__(self, id, nome, classe_farmacologica, descricao):
        self.id = id
        self.nome = nome
        self.classe_farmacologica = classe_farmacologica
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
