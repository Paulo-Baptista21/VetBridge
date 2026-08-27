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
