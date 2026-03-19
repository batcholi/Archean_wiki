<p align="center">
  <img src="FluidPump.png" />
</p>

|Component|`FluidPump`|
|---|---|
|**Module**|`ARCHEAN_thruster`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Die Fluid Pump ist eine Komponente zum Übertragen von Fluid mit bis zu 1 kg pro Sekunde. Im Gegensatz zu Turbo Pumps arbeitet sie mit Niederspannung und reagiert sofort auf Steuerungseingaben, was eine sehr reaktionsschnelle Fluidverwaltung ermöglicht.

# Usage
## Power Supply
Um die Pumpe zu verwenden, muss sie mit Niederspannung versorgt werden. Sie verbraucht bis zu 1 kW bei voller Geschwindigkeit.

## Data
Der Datenport ermöglicht die Steuerung der Pumpengeschwindigkeit durch Senden eines Wertes zwischen `-1` und `1`.  
Wenn die Pumpe an einen Computer angeschlossen ist, kann auch die aktuelle Durchflussrate abgerufen werden.

> Beim Senden eines negativen Wertes läuft die Pumpe effektiv rückwärts.
