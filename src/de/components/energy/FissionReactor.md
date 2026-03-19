<p align="center">
  <img src="FissionReactor.png" />
</p>

|Component|`FissionReactor`|
|---|---|
|**Module**|`ARCHEAN_nuclear`|
|**Mass**|1000 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|300 x 300 x 275 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
Der Fission Reactor ist eine Komponente, die durch Kernspaltung von Uranstäben Wärme erzeugt.

---

# Usage

## Allgemeiner Betrieb
Der Reaktor erhitzt Wasser (H₂O) mit der durch Kernspaltung erzeugten Energie.

Wasser hat eine doppelte Funktion:
- Kühlung des Reaktorkerns.
- Erzeugung von Dampf für Turbinen.

---

## Benötigte Ressourcen
Der Reaktor benötigt:
- Eine kontinuierliche Niederspannungs-Stromversorgung von **1000 W**.
- Eine Zufuhr von kaltem Wasser.
- Uranstäbe, die in allen 4 internen Zonen des Reaktors platziert sind.

> Es wird dringend empfohlen, mindestens einen Uranstab pro Zone zu haben.  
> Ein Reaktor mit leeren Zonen wird sehr schlecht oder gar nicht funktionieren.

---

## Inventar und Zonen
Der Reaktor verfügt über **40 Slots**, aufgeteilt in **4 unabhängige Zonen**.

Jede Zone beeinflusst ihre lokale Leistung und Temperatur basierend auf der Anzahl und dem Typ der platzierten Uranstäbe.

---

## Control Rods
Jede Zone hat einen einstellbaren *Control Rod*:
- 0% ausgefahren (vollständig eingeführt) → Reaktion gestoppt.
- 100% ausgefahren → Maximale Reaktion.

---

## Reaktionsstart
Eine manuelle Neutroneninjektion über den Datenanschluss ist erforderlich.

Bis zu **1000 Neutronen** pro Sekunde können während des Starts gesendet werden
(bis zu **250 Neutronen** pro Sekunde pro Zone).

> - Auch bei Uran mit 100% U235 ist eine anfängliche Neutronenzufuhr notwendig.
> - Bei niedrig angereichertem Uran (10% U235) kann der Start einige Minuten kontinuierlicher Neutroneninjektion erfordern.

---

## Kettenreaktionsverhalten

Obwohl jede Zone des Reaktors ihre eigenen Uranstäbe, Temperatur und Neutronenpopulation hat, ist der Reaktor so konzipiert, dass er eine realistische Kettenreaktion über den gesamten Kern simuliert.

- Zonen sind nicht vollständig isoliert.
- In einer Zone erzeugte Neutronen können sich teilweise auf benachbarte Zonen ausbreiten.
- Dieses Verhalten verbessert die Stabilität der Reaktion und hilft schwächeren Zonen, die Spaltung aufrechtzuerhalten.

> Eine hochaktive Zone kann eine weniger aktive unterstützen, aber eine ordnungsgemäße Bestückung aller Zonen bleibt für maximale Effizienz wesentlich.

---

## Kühlung und Dampferzeugung
Bei Verwendung mit [Steam Turbines](SteamTurbine.md) beträgt die ideale Wasserausgangstemperatur **650 K**.

- Darunter → Reduzierte Energieerzeugung.
- Darüber → Effizienzverlust (kein zusätzlicher Gewinn).

> Ein übermäßig hoher Wasserfluss kann den Reaktor überkühlen und die Leistungsabgabe begrenzen.

---

## Reaktorzustände

|State|Meaning|
|---|---|
|IDLE|Reaktor ist ausgeschaltet.|
|STARTING|Start wird durchgeführt (Neutroneninjektion).|
|ACTIVE|Aktive Kernreaktion (Neutronen werden erzeugt).|
|COOLDOWN|Abkühlung läuft (keine Neutronen werden erzeugt).|
|HOT|Reaktor ist heiß, bitte erhöhen Sie den Fluidfluss.|
|SCRAM|Notabschaltung ausgelöst (Control Rods auf 0% ausgefahren verriegelt).|
|CRITICAL|Der Reaktorkern überhitzt stark, Kernschmelze steht bevor.|
|MELTDOWN|Kernschmelze. Reaktor ohne manuellen Reset nicht verwendbar.|

---

## Sicherheit und Kernschmelze
- Über **1200 K** → Eintritt in den *CRITICAL*-Zustand - Kernschmelze steht bevor.

Im *MELTDOWN*-Zustand:
- Dampffluss stoppt - keine Energie kann erzeugt werden.
- Der Reaktor wird unbrauchbar, bis er manuell zurückgesetzt wird.

### Reset Meltdown
Über den Reset-Button in der Reaktor-Oberfläche (Taste `V`).

> - Im Kreativmodus ist dieser Button immer verfügbar.  
> - Im Abenteuermodus ist er nur verfügbar, wenn der Reaktor eine Kernschmelze erlitten hat.

---

# Verschleiß der Uranstäbe

Uranstäbe verschleißen langsam im Laufe der Zeit, während sie an der Kernreaktion teilnehmen.

### Isotopenverbrauch
- **U235** wird allmählich verbraucht, um die Spaltung aufrechtzuerhalten.
- **U238** kann sich auch teilweise in Plutonium umwandeln.

### Spaltprodukte
Während des Betriebs sammeln die Stäbe automatisch Spaltprodukte an:
- **Xenon (Xe)**
- **Plutonium (Pu)**

Diese Elemente erscheinen direkt in der Zusammensetzung des Stabs, während er altert.
> Es ist wichtig zu beachten, dass diese Spaltprodukte derzeit keine Verwendung im Spiel haben. Um Plutonium für die Herstellung des RTG zu erhalten, müssen Sie den auf der RTG-Seite beschriebenen Plutonium-Herstellungsprozess verwenden [RTG](./RTG.md#how-to-produce-plutonium).

### Abgebrannter Stab
Wenn die **U235**-Konzentration eines Uranstabs unter **4,45%** fällt, gilt er als *abgebrannt*.

> Ein abgebrannter Stab kann keine Kettenreaktion mehr aufrechterhalten, auch nicht mit externer Neutronenzufuhr.

### Verschleißfaktoren
Die Lebensdauer von Uranstäben hängt vollständig ab von:
- Ihrem anfänglichen U235-Anreicherungsgrad.
- Der tatsächlich vom Reaktor erzeugten Leistung (und damit dem Neutronenfluss).

> → Je niedriger die Anreicherung und je höher die Leistungsentnahme, desto schneller verschleißt der Stab.  
> → Umgekehrt kann ein hoch angereicherter Uranstab bei moderater Leistung extrem lange halten.

### List of inputs

|Channel|Function|Value|
|---|---|---|
|0|Control Rod Zone 1|0.0 to 1.0|
|1|Control Rod Zone 2|0.0 to 1.0|
|2|Control Rod Zone 3|0.0 to 1.0|
|3|Control Rod Zone 4|0.0 to 1.0|
|4|Neutrons Injection|0 to 1000|
|5|SCRAM (Emergency Shutdown)|0 or 1|

---

### List of outputs

|Channel|Function|Value|
|---|---|---|
|0|Zone 1 Temperature (Kelvin)|Number|
|1|Zone 2 Temperature (Kelvin)|Number|
|2|Zone 3 Temperature (Kelvin)|Number|
|3|Zone 4 Temperature (Kelvin)|Number|
|4|Control Rod Position Zone 1|0.0 to 1.0|
|5|Control Rod Position Zone 2|0.0 to 1.0|
|6|Control Rod Position Zone 3|0.0 to 1.0|
|7|Control Rod Position Zone 4|0.0 to 1.0|
|8|Neutron Flux Zone 1|Number|
|9|Neutron Flux Zone 2|Number|
|10|Neutron Flux Zone 3|Number|
|11|Neutron Flux Zone 4|Number|
|12|Input Water Temperature (Kelvin)|Number|
|13|Output Water Temperature (Kelvin)|Number|
|14|Water Flow Rate (kg/s)|Number|
|15|Reactor Status|"IDLE", "STARTING", "ACTIVE", "COOLDOWN", "HOT", "SCRAM", "CRITICAL", "MELTDOWN"|
|16|Lifetime|Estimated remaining time in seconds|

---

# Herstellung von Uranstäben

---

## Low Enriched Uranium (LEU)

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher (Uranium Powder)|Uranium Ore : 1000 g|Uranium powder (U235 : 10%, U238 : 90%) : 1000 g|-|
|ChemicalFurnace (Yellow Cake (U₃O₈))|Uranium powder : 0.714 g, Oxygen (O₂) : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace (Uranium Dioxide (UO₂))|Yellow Cake (U₃O₈) : 0.842 g, Hydrogen (H₂) : 0.004 g|Uranium dioxide (UO₂) : 0.810 g, Water (H₂O) : 0.036 g|850K - 1050K|
|Crafter (Uranium Rod LEU (UO₂))|Uranium dioxide (UO₂) : 1000 g|Uranium rod LEU (UO₂, U235 : 10%, U238 : 90%) : 1|-|

---

## Highly Enriched Uranium (HEU)

### UF₆ (Gas) Production

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher (Fluorite powder (F₂))|Fluorite Ore: 1000 g|Fluorite powder (F₂) : 1000 g|-|
|ChemicalFurnace (Hydrogen Fluoride (HF)) <font color="orange">*</font>|Fluorite powder (F₂) : 0.038 g, Hydrogen (H₂) : 0.002 g|Hydrogen fluoride (HF) : 0.040 g|300K - 400K|
|ChemicalFurnace (Uranium Tetrafluoride (UF₄))|Hydrogen fluoride (HF) : 0.080 g, Uranium dioxide (UO₂) : 0.270 g|Uranium tetrafluoride (UF₄) : 0.314 g, Water (H₂O) : 0.036 g|750K - 950K|
|ChemicalFurnace (Uranium Hexafluoride (UF₆))|Uranium tetrafluoride (UF₄) : 0.314 g, Fluorite powder (F₂) : 0.038 g|Uranium hexafluoride (UF₆) : 0.352 g|550K - 750K|

<font color="orange">*</font> Die Herstellung von Hydrogen Fluoride (HF) löst eine stark exotherme Reaktion aus. In diesem speziellen Fall beeinflusst die resultierende Temperatur, auch wenn der Chemical Furnace Werte um 3000K anzeigt, die chemische Reaktion nicht. In nachfolgenden Prozessen müssen Sie jedoch das HF abkühlen, bevor es verwendet werden kann, typischerweise mit einem [Active Radiator](../fluids/radiator/ActiveRadiator.md) oder einem ähnlichen Kühlgerät.




---

### Enrichment Centrifuge Usage

|Characteristic|Value|
|---|---|
|Power consumption|1000 W|
|Input flow|0.1 kg/s|
|Internal capacity|10 kg|

Betrieb:
- Die erste Zentrifuge empfängt Uranium Hexafluoride (UF₆) von oben.
- Der schwere Ausgang (unten) kann verworfen werden, da er nur U238 enthält.
- Der leichtere Ausgang kann zur weiteren Verarbeitung an eine andere Zentrifuge gesendet werden.

> Typischerweise erfordert das Erreichen einer hohen U235-Konzentration eine Kette von 8 bis 10 Zentrifugen.

---

### Rückführung in den festen Zustand und Uranium Rod HEU-Montage

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|ChemicalFurnace (Uranyl Fluoride (UO₂F₂))|Uranium hexafluoride (UF₆) : 0.352 g, Water (H₂O) : 0.036 g|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen fluoride (HF) : 0.080 g|300K - 350K|
|ChemicalFurnace (Uranium Dioxide (UO₂))|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen (H₂) : 0.002 g|Uranium dioxide (UO₂) : 0.270 g, Hydrogen fluoride (HF) : 0.040 g|750K - 850K|
|Crafter (Uranium Rod HEU (UO₂))|Enriched uranium dioxide (UO₂) : 1000 g|Uranium rod HEU (UO₂, U235 content depends on enrichment) : 1|-|
