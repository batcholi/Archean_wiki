<p align="center">
  <img src="Volume.png" />
</p>

|Component|`Volume`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
Die Volume-Komponente berechnet und definiert automatisch das Volumen, das sie einnimmt, wenn sie einem Build hinzugefügt wird. Diese Funktion kann verwendet werden, um:
- Individuell geformte Treibstofftanks zu gestalten.  
- Die Kabinendruckbeaufschlagung für bestimmte Umgebungen sicherzustellen (z.B. U-Boote, Raketen).  
- Luftschiffe zu bauen...
- ...  

> <font color="green"><strong> Diese Komponente steht im Zusammenhang mit der Druckbeaufschlagung von Builds. Weitere Informationen finden Sie auf der Seite [Pressurization](../../pressurization.md).</strong></font>

# Usage
Die Volume-Komponente ist einfach zu verwenden und erfordert keine besondere Konfiguration. Fügen Sie sie einfach einem Build hinzu und klicken Sie auf die Schaltfläche `Scan`, um automatisch das Volumen des abgedichteten Abteils zu erkennen, in dem sie sich befindet. Beachten Sie, dass sie nur das Volumen berechnet, in dem sie sich befindet, nicht den gesamten Build. Sie müssen für jedes Abteil, das Sie druckbeaufschlagen möchten, eine separate Volume-Komponente hinzufügen.

Diese Komponente kann zwei Zustände anzeigen:
- `Airtight`: Der Zustand wird grün, wenn das Abteil vollständig abgedichtet ist.
- `Leak`: Der Zustand wird rot, wenn das Abteil nicht luftdicht ist.

Der Volume-Bildschirm zeigt nur das Volumen des abgedichteten Abteils in Kubikmetern (m³) an. Für detailliertere Informationen können Sie das Informationsfenster durch Drücken der `V`-Taste aufrufen. Die verfügbaren Daten umfassen:
- `Volume capacity (m³)`: Die Gesamtkapazität des abgedichteten Volumens.
- `Contents Mass (kg)`: Die Gesamtmasse des im Volumen enthaltenen Inhalts.
- `Pressure (kPa)`: Der Druck im abgedichteten Abteil.
- `Liquid Level (%)`: Der prozentuale Flüssigkeitsfüllstand.
- `Composition`: Die Verteilung der verschiedenen Fluide als normalisierte Prozentsätze.

Im Creative-Modus erscheinen zusätzliche Schaltflächen zum Füllen oder Entleeren des Volumens.


### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Level|0 to 1|
|1|Volume (m³)|number|
|2|State|text|
