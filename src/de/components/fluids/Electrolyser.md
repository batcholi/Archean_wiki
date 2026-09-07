<p align="center">
  <img src="Electrolyser.png" />
</p>

|Component|`Electrolyser`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Der Electrolyser ist eine Komponente, die die Aufspaltung von Wasser in Wasserstoff und Sauerstoff ermöglicht.

# Usage
Der Electrolyser benötigt Hochspannungsenergie und verbraucht bis zu 16 MW während des Betriebs. Er produziert linear proportional zur verfügbaren Leistung, bis zu maximal 1 kg Wasser pro Sekunde bei 16 MW, also etwa 40 kWh pro kg Wasserstoff. Er benötigt mindestens 1 kW, um zu laufen: unterhalb dieser Schwelle tut er nichts.

Um den Elektrolyseprozess zu starten, verbinden Sie einfach eine Wasserquelle mit seinem blauen Eingangsport. Diese Quelle kann zum Beispiel von einem [Fluid Port](../fluids/FluidPort.md) stammen, der in Wasser eingetaucht ist, um direkt Wasser aus dem Meer zu entnehmen, oder von einem Tank, der Wasser enthält.

Der produzierte Wasserstoff und Sauerstoff können dann jeweils vom gelben (H2) und cyan (O2) Ausgangsport entnommen werden.

### Production
Der Electrolyser kann bis zu 1 kg Wasser pro Sekunde verarbeiten und liefert ungefähr [0,9 kg Sauerstoff und 0,1 kg Wasserstoff](# "O2:0.88kg / H2:0.11kg") pro Sekunde.

Sind beide Ausgangstanks voll, geht der Electrolyser mit 50 W in den Ruhezustand und startet von selbst wieder, sobald einer von ihnen wieder Gas aufnimmt.

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Leistungsvorgabe, Anteil der 16 MW Nennleistung (0 = aus, 1 = alles, was die Quelle liefert)|0.0 bis 1.0|

### List of outputs
|Channel|Function|
|---|---|
|0|Aufgenommene Leistung (Watt)|
|1|Verarbeitetes Wasser (kg/s)|
|2|Erzeugter Wasserstoff (kg/s)|
|3|Erzeugter Sauerstoff (kg/s)|
