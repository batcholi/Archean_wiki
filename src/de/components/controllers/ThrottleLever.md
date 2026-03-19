<p align="center">
  <img src="ThrottleLever.png" />
</p>

|Component|`ThrottleLever`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|1 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|25 x 25 x 50 cm|
#
---

# Description
Der Throttle Lever ist eine Steuerung, die kontinuierlich einen analogen Wert abhängig von der Position des Hebels sendet. Der Ausgabewert wird auf einen konfigurierbaren Bereich abgebildet (Standard `-1.0` bis `+1.0`).

# Usage
Der Hebel wird mit der Maus gesteuert, indem die `F`-Taste gedrückt gehalten und die `Maus hoch/runter` bewegt wird.

> - In der Mitte des Hebels gibt es einen Widerstand, um die exakte Mittelposition leichter zu finden.
> - Es ist möglich, die **Min**- und **Max**-Werte des Hebels sowie die **Einrastfunktion in der Mitte** über das Konfigurationsmenü zu konfigurieren, das mit der `V`-Taste zugänglich ist.
> - Der Throttle Lever kann von einer anderen Komponente über seinen Datenanschluss gesteuert werden, indem der Modus "Allow IO Input" im Konfigurationsmenü aktiviert wird.
