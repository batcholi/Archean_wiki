<p align="center">
  <img src="TemperatureProbe.png" />
</p>

|Component|`TemperatureProbe`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|250 g|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|10 x 10 x 1 cm|
#
---

# Description
Temperature Probe — компонент, измеряющий температуру блока или панели, к которым он прикреплён.

# Usage
После прикрепления к вашему build его можно подключить к Computer, чтобы получить температуру материала в точке контакта его наконечника. Температура указывается в Кельвинах и обновляется каждые 0,2 с. Он показывает 0, когда не касается ни одного блока или панели.

Выше 1350 K датчик повреждается. Полностью повреждённый датчик показывает 0 и может быть отремонтирован.

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|Temperature|Kelvin|
