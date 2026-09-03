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

        if uso_farmacologico.apresentacao_comercial is not self:
            uso_farmacologico.apresentacao_comercial = self
