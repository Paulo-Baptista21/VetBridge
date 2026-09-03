class RegimePosologico:

    def __init__(
        self,
        id,
        uso_farmacologico,
        indicacao,
        dose_mg_por_kg,
        via_administracao,
        intervalo,
        posologia
    ):
        self.id = id
        self.uso_farmacologico = uso_farmacologico
        self.indicacao = indicacao
        self.dose_mg_por_kg = dose_mg_por_kg
        self.via_administracao = via_administracao
        self.intervalo = intervalo
        self.posologia = posologia

        uso_farmacologico.adicionar_regime_posologico(self)
