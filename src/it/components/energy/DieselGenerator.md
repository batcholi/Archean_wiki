<p align="center">
  <img src="DieselGenerator.png" />
</p>

|Component|`DieselGenerator`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push/Pull|
#
---

# Description
Il Diesel Generator è un gruppo elettrogeno che brucia carburante liquido per produrre energia ad alta tensione.
Può erogare fino a **150 kW** e il suo carburante di riferimento è il dodecano (C12H26).

# Usage
Collega una sorgente di carburante alla sua porta fluido, la bassa tensione per il motorino di avviamento, e invia 1 alla sua porta dati per accenderlo.

Il motorino di avviamento assorbe 1000 watt di bassa tensione solo durante l'avviamento. Con carburante disponibile, il motore parte in meno di un secondo.

L'energia prodotta viene erogata sull'uscita ad alta tensione. Il consumo di carburante segue il carico: circa 10 g/s a piena potenza e il 27 % di tale valore al minimo.

Il motore aspira aria ambiente dalla sua presa d'aria ed espelle i gas di scarico dalla sua uscita. Le porte aria e scarico permettono di collegare tubi al loro posto; una presa d'aria collegata sostituisce l'aria ambiente. La potenza disponibile diminuisce con la quantità di ossigeno nell'aria.

Il motore si spegne se manca l'ossigeno, se lo scarico è bloccato o se il carburante manca per più di un secondo. Dopo uno stallo, invia 0 e poi 1 alla porta dati per riavviarlo.

Tollera fino al 55 % di contaminazione del carburante (acqua, idrocarburi pesanti) senza usura. Oltre, si usura.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Run|0 or 1|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Load|0.0 to 1.0|
|1|RPM|rpm|
|2|Fuel flow|kg/s|
|3|Running|0 or 1|
|4|State|"Off", "Starting", "Running", "Stalled", "Destroyed"|
