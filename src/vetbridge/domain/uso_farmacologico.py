class UsoFarmacologico:

    def __init__(
        self,
        id,
        apresentacao_comercial,
        especie,
        contraindicacoes,
        advertencias,
        reacoes_adversas
    ):
        self.id = id
        self.apresentacao_comercial = apresentacao_comercial
        self.especie = especie
        self.contraindicacoes = contraindicacoes
        self.advertencias = advertencias
        self.reacoes_adversas = reacoes_adversas
        self.regimes_posologicos = []

        apresentacao_comercial.adicionar_uso_farmacologico(self)
        especie.adicionar_uso_farmacologico(self)

    def adicionar_regime_posologico(self, regime_posologico):
        if regime_posologico not in self.regimes_posologicos:
            self.regimes_posologicos.append(regime_posologico)

        if regime_posologico.uso_farmacologico is not self:
            regime_posologico.uso_farmacologico = self
