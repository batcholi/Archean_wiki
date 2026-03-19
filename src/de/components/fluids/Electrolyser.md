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
Der Electrolyser benötigt Hochspannungsenergie und verbraucht bis zu 10 kW während des Betriebs. Er produziert linear proportional zur verfügbaren Leistung, bis zu maximal 1 kg Wasser pro Sekunde bei 10 kW Leistung.

Um den Elektrolyseprozess zu starten, verbinden Sie einfach eine Wasserquelle mit seinem blauen Eingangsport. Diese Quelle kann zum Beispiel von einem [Fluid Port](../fluids/FluidPort.md) stammen, der in Wasser eingetaucht ist, um direkt Wasser aus dem Meer zu entnehmen, oder von einem Tank, der Wasser enthält.

Der produzierte Wasserstoff und Sauerstoff können dann jeweils vom gelben (H2) und cyan (O2) Ausgangsport entnommen werden.

### Production
Der Electrolyser kann bis zu 1 kg Wasser pro Sekunde verarbeiten und liefert ungefähr [0,9 kg Sauerstoff und 0,1 kg Wasserstoff](# "O2:0.88kg / H2:0.11kg") pro Sekunde.
