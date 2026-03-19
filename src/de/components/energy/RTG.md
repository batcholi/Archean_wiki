<p align="center">
  <img src="RTG.png" />
</p>

|Component|`RTG`|
|---|---|
|**Module**|`ARCHEAN_rtg`|
|**Mass**|50 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|50 x 50 x 100 cm|
#
---

# Description
Der Radioisotopengenerator (RTG) erzeugt Niederspannungsenergie. Er kann eine kontinuierliche Leistung liefern, die von der Kühlkapazität der Umgebung abhängt.

# Usage
Verbinden Sie den RTG mit der Komponente, die Niederspannungsenergie zum Betrieb benötigt.

Der RTG hat zwei elektrische Anschlüsse, sodass Sie zwei Komponenten gleichzeitig anschließen oder mehrere RTGs verketten können, um die Gesamtleistung zu erhöhen.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> - Der RTG kann bis zu **12 kW** Leistung erzeugen. Seine tatsächliche Ausgangsleistung hängt von der Kühlkapazität der Umgebung ab (im Vakuum des Weltraums auf ~6 kW reduziert). Er hat keine schädlichen Auswirkungen auf den Spieler oder die Umgebung.
>
> - Wenn Sie den RTG zur Versorgung von zwei Komponenten verwenden, darf die über die beiden Anschlüsse verteilte Gesamtleistung die verfügbare Ausgangsleistung des RTG nicht überschreiten.
>
> - Wenn eine der beiden Komponenten die gesamte verfügbare Leistung des RTG verbrauchen möchte, kann dies die andere Komponente daran hindern, überhaupt Strom zu nutzen. In diesem Fall ist es besser, Power Junctions zu verwenden, um sicherzustellen, dass alle Komponenten gleichmäßig mit Strom versorgt werden.


# How to produce Plutonium

## Plutonium Production Process

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher|Uranium Ore: 1000 g|Uranium Powder (U) : 1000 g (U235 : 10%, U238 : 90%)|-|
|ChemicalFurnace (Yellow Cake - U₃O₈)|Uranium Powder (U) : 0.714 g, O₂ : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace (Uranium Dioxide - UO₂)|Yellow Cake (U₃O₈) : 0.842 g, H₂ : 0.004 g|Uranium Dioxide (UO₂) : 0.810 g, H₂O : 0.036 g|850K - 1050K|
|Crafter|Uranium Dioxide (UO₂) : 1000 g|Uranium Rod (U235 : 10%, U238 : 90%) : 1|-|
|Crusher|Uranium Rod|Plutonium Dioxide (PuO₂) : 1 g (Pu : 100%)|-|
|Crafter|Plutonium Dioxide (PuO₂) : 5000 g|Plutonium Pellet : 1|-|

> Es wird empfohlen, niedrig angereichertes Uran (LEU) für die Plutoniumproduktion zu verwenden. Der Anreicherungsgrad hat keinen Einfluss auf die gewonnene Plutoniummenge.

---

# Additional Information
<font color="orange">
In der Realität ist die Aufbereitung von Plutonium aus abgebrannten Kernbrennstäben ein äußerst komplexer und anspruchsvoller industrieller Vorgang, der eine fortschrittliche Infrastruktur und spezialisierte Einrichtungen erfordert. Aus diesem Grund werden Plutoniumrückgewinnung und -wiederaufbereitung derzeit in Archean nicht unterstützt.

Stattdessen verwenden RTGs eine vereinfachte Form von Plutonium, die speziell für die Energieerzeugung hergestellt wird. Obwohl diese Alternative einfacher zu handhaben bleibt als echtes Plutonium, ist ihre Herstellung absichtlich anspruchsvoller als in früheren Versionen des Spiels, wodurch RTGs weniger trivial zu erhalten sind, aber für fortgeschrittene Spieler weiterhin zugänglich bleiben.
</font>
