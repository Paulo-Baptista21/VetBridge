class Especie:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome
        self.usos_farmacologicos = []

    def adicionar_uso_farmacologico(self, uso_farmacologico):
        if uso_farmacologico not in self.usos_farmacologicos:
            self.usos_farmacologicos.append(uso_farmacologico)

        if uso_farmacologico.especie is not self:
            uso_farmacologico.especie = self
