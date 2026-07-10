p = float(input("Peso: "))

while p <= 0:
    print("Peso Inválido")
    p = float(input("Peso: "))

d = float(input("Dosagem (mg/kg): "))

while d <=0:
    print("Dosagem Inválida")
    d = float(input("Dosagem (mg/kg): "))

c = float(input("Concentração (mg/ml): "))

while c <= 0:
    print("Concentração Inválida")
    c = float(input("Concentração (mg/ml): "))

def calculo_dosagem(p, c, d):
    dose_total = p * d
    volume_ml = dose_total / c
    return dose_total, volume_ml

dose_total, volume_ml = calculo_dosagem(p, c, d)

print("Dose total:", dose_total, "mg")
print("Volume:", f"{volume_ml:.2f}", "ml")
