<p align="center">
  <img src="Turbojet.png" />
</p>

|Component|`Turbojet`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|400 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Il Turbojet è un turbogetto che genera spinta bruciando carburante liquido con l'aria ambiente.
Può produrre fino a **60 kN** di spinta al livello del mare, da una portata di 1,4 kg/s di dodecano (C12H26).

# Usage

## Installazione
Il motore richiede:
- Una pompa che spinga il carburante nella sua porta fluido (non aspira da solo da un serbatoio).
- Un'alimentazione ad alta tensione in grado di fornire **125 kW** durante l'avviamento.
- Tre canali dati: il motorino di avviamento, gli accenditori e la valvola del carburante.

Non ha regolazione interna: la valvola del carburante è direttamente il comando di spinta.

## Avviamento
1. Motorino a 1: l'albero sale fino a circa il 24 % di N1. Il motorino assorbe 125 kW finché gira.
2. Accenditori a 1 (400 watt) e valvola moderatamente aperta: la combustione parte appena il carburante arriva in camera.
3. Una volta che il motore è in moto, motorino e accenditori possono essere spenti: la fiamma da sola mantiene la rotazione.

Il carburante iniettato senza scintilla si accumula in camera e si accende tutto insieme alla prima scintilla.

> Il pannello di ispezione mostra lo stato dei tre comandi e il motivo per cui il motore non gira (motorino senza alimentazione, valvola chiusa, niente carburante, niente scintilla, niente ossigeno).

## Pilotaggio
La spinta nominale si ottiene verso il 77 % della valvola; tutta aperta, lascia passare il 30 % in più della portata nominale e la temperatura dei gas supera il limite delle palette.

La fiamma regge solo entro un intervallo di ricchezza:
- Un'apertura brusca della valvola rende la miscela troppo ricca: il compressore va in pompaggio (`Surge`) per un secondo e il motore subisce danni.
- Una chiusura quasi completa sopra il 45 % di N1 rende la miscela troppo povera: la fiamma si spegne.

Dopo uno spegnimento, gli accenditori riaccendono la fiamma solo quando l'albero è sceso sotto il 55 % di N1. Una camera ancora calda (oltre 750 K) riaccende il carburante da sola, senza accenditori.

Valvola a 0, la fiamma si spegne e l'albero impiega circa due minuti a fermarsi.

La spinta diminuisce con l'altitudine. In volo, la velocità comprime l'aria alla presa ma riduce la spinta a pari potenza.

## Limiti
- Temperatura dei gas (EGT) sopra **1250 K**: usura rapida delle palette.
- N1 sopra il **105 %**: distruzione rapida del rotore.
- Ingestione d'acqua sopra il 30 % di N1: le palette si rompono.
- Carburante contaminato (acqua, idrocarburi pesanti) oltre il 5 %: usura. Il petrolio greggio usura il motore.

## Stati
|Stato|Significato|
|---|---|
|Off|Motore fermo.|
|Cranking|Il motorino trascina l'albero.|
|Running|Combustione in corso.|
|Surge|Pompaggio del compressore, miscela troppo ricca.|
|Destroyed|Motore distrutto.|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Starter|0 or 1|
|1|Igniters|0 or 1|
|2|Throttle|0.0 to 1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|N1|%|
|1|Thrust|Newtons|
|2|EGT|Kelvin|
|3|Running|0 or 1|
|4|Burned fuel flow|kg/s|
|5|Unburned fuel flow|kg/s|
|6|State|"Off", "Cranking", "Running", "Surge", "Destroyed"|
