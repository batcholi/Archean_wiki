<p align="center">
  <img src="BigTurboPump.png" />
</p>

|Component|`BigTurboPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 150 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Die Big Turbo Pump ist eine Komponente zum Übertragen von hochdichten Fluiden mit bis zu 100 kg pro Sekunde.

# Usage
## Power Supply
Um die Pumpe zu verwenden, muss sie mit Hochspannung versorgt werden. Sie verbraucht bis zu 100 kW bei voller Geschwindigkeit.

## Data
Der Datenport ermöglicht die Steuerung der Pumpengeschwindigkeit durch Senden eines Wertes zwischen `-1` und `1`.
Wenn die Pumpe an einen Computer angeschlossen ist, kann auch die aktuelle Durchflussrate abgerufen werden.

> Beim Senden eines negativen Wertes läuft die Pumpe effektiv rückwärts.
