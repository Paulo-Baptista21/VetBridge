from vetbridge.domain.fabricante import Fabricante
from vetbridge.domain.nome_comercial import NomeComercial
from vetbridge.domain.apresentacao_comercial import ApresentacaoComercial
from vetbridge.domain.especie import Especie
from vetbridge.domain.uso_farmacologico import UsoFarmacologico
from vetbridge.domain.regime_posologico import RegimePosologico
fabricante = Fabricante(
    1,
    "Zoetis"
)

nome_comercial = NomeComercial(
    1,
    "Cerenia", 
    fabricante
)

apresentacao = ApresentacaoComercial(
    1,
    "Solução injetável 10 mg/mL",
    nome_comercial
)

especie = Especie(
    1,
    "Canino"
)

uso = UsoFarmacologico(
    1,
    apresentacao,
    especie,
    "Não incluídas nesta verificação",
    "Não incluídas nesta verificação",
    "Não incluídas nesta verificação"
)

regime = RegimePosologico(
    1,
    uso,
    "Prevenção e tratamento do vômito agudo",
    1.0,
    "Subcutânea",
    "Uma vez ao dia",
    "Por até 5 dias"
)
assert uso.apresentacao_comercial is apresentacao, (
    "O uso não aponta para a apresentação"
)

assert uso.especie is especie, (
    "O uso não aponta para a espécie"
)

assert regime.uso_farmacologico is uso, (
    "O regime não aponta para o uso"
)

assert uso in apresentacao.usos_farmacologicos, (
    "A apresentação não guarda o uso"
)

assert uso in especie.usos_farmacologicos, (
    "A espécie não guarda o uso"
)

assert regime in uso.regimes_posologicos, (
    "O uso não guarda o regime"
)
apresentacao.adicionar_uso_farmacologico(uso)
especie.adicionar_uso_farmacologico(uso)
uso.adicionar_regime_posologico(regime)

assert len(apresentacao.usos_farmacologicos) == 1, (
    "O uso foi duplicado na apresentação"
)

assert len(especie.usos_farmacologicos) == 1, (
    "O uso foi duplicado na espécie"
)

assert len(uso.regimes_posologicos) == 1, (
    "O regime foi duplicado no uso"
)

print("Verificações do modelo concluídas.")
