<p align="center">
  <img src="GeothermalExchanger.png" />
</p>

|Component|GeothermalExchanger|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
Der Geothermal Exchanger ist eine Komponente, die die natürliche Wärme des tiefen Untergrunds nutzt, um ein Fluid zu erwärmen.

# Usage
Der Geothermal Exchanger ist ausschließlich für stationäre Builds vorgesehen. Sobald er auf einem Build platziert und mit Niederspannung versorgt wird (kontinuierlicher Verbrauch von 1000 Watt), verankert er sich automatisch am Boden und verhindert jegliche Bewegung der Struktur.

> #### Warnung:
> - Der Geothermal Exchanger fixiert den Build an Ort und Stelle. Um die Mobilität wiederherzustellen, muss er zuerst zerstört werden.
> - Wenn die Struktur nach dem Zerstören des Geothermal Exchangers statisch bleibt, platzieren Sie einfach vorübergehend einen [Ground Anchor](../miscellaneous/GroundAnchor.md), um den Zustand zu aktualisieren und die Struktur wieder aktivieren zu können.

Der Geothermal Exchanger muss sehr nah am Boden platziert werden. Wenn seine Basis mehr als 0,5 Meter über dem Boden liegt, bleibt er inaktiv.

Sobald er in Betrieb ist:
- Bohrt er sich langsam bis zu einer maximalen Tiefe von 1000 Metern.
- Je tiefer er geht, desto heißer wird das zirkulierende Fluid (bis maximal 650K).
- Er beginnt das Fluid zu pumpen, sobald es 373K erreicht.

Er wird hauptsächlich zur Energieerzeugung verwendet, indem das Fluid durch eine Steam Turbine geleitet wird.

### Additional Information
- Der Geothermal Exchanger arbeitet ausschließlich mit Wasser (H₂O).
- Maximale Durchflussrate: 0,1 kg/s.

> Eine Small Steam Turbine kann in der Regel effektiv von bis zu 10 Geothermal Exchangern versorgt werden, was eine theoretische maximale Ausgangsleistung von etwa 270 kW ermöglicht.

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Depth|meters|
|1|Temperature|Kelvin|
