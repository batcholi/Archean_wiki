<p align="center">
  <img src="TemperatureProbe.png" />
</p>

|Component|`TemperatureProbe`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|250 g|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|10 x 10 x 1 cm|
#
---

# Description
Der Temperature Probe ist eine Komponente, die die Temperatur des Blocks oder Panels misst, an dem er befestigt ist.

# Usage
Sobald er an Ihrem Build befestigt ist, kann er mit einem Computer verbunden werden, um die Temperatur des Materials am Kontaktpunkt seiner Spitze abzurufen. Die Temperatur wird in Kelvin angegeben und alle 0,2 s aktualisiert. Er zeigt 0 an, wenn er keinen Block und kein Panel berührt.

Über 1350 K wird die Sonde beschädigt. Eine vollständig beschädigte Sonde zeigt 0 an und kann repariert werden.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Temperature|Kelvin|
