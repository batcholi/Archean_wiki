<p align="center">
  <img src="LowVoltageBattery.png" />
</p>

|Component|`LowVoltageBattery`|
|---|---|
|**Module**|`ARCHEAN_battery`|
|**Mass**|10 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|50 x 50 x 50 cm|
#
---

# Description
- Spannung: 44 bis 52 Volt je nach aktuellem Ladezustand
- Strom: 1000 Ampere pro Anschluss
- Gesamtkapazität: 10 kWh
- Elektrische Anschlüsse: 4
- Datenanschluss: 1 Anschluss zur Überwachung des Batteriestatus

> **Recycling:** Beim Zerkleinern gibt diese Batterie ungefähr **50%** ihrer Herstellungskosten in Roherzen zurück.

# Usage
Da die Batterie 1000 Ampere pro Anschluss liefert, können Sie bis zu 52 kW an jedem Anschluss erhalten, um Komponenten mit Strom zu versorgen.

### List of outputs
|Channel|Function|
|---|---|
|0|Voltage|
|1|Max Capacity (Wh)|
|2|State of charge|
|3|Throughputs (watts)|
