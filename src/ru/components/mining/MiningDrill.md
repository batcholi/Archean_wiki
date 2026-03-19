<p align="center">
  <img src="MiningDrill.png" />
</p>

|Component|`MiningDrill`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 100 cm|
|**Push/Pull Item**|Initiate Push|
#
---

# Description
Mining Drill — компонент, позволяющий бурить рельеф для извлечения породы, которую можно дробить для получения руды.

# Usage
Для работы он должен быть установлен на постройке, закреплённой на земле с помощью [Ground Anchor](../miscellaneous/GroundAnchor.md).
Необходимо подключить его к [Container](../storage/Container.md) или другому компоненту, принимающему предметы, для сбора добытой породы.

В зависимости от типа энергии он может извлекать породу с различной скоростью.

|Energy|Power required|Speed|Depth|
|---|---|---|---|
|Low Voltage|10 kw|До 10 пород в секунду|0,01 метра в секунду|
|High Voltage|100kw|До 100 пород в секунду|0,1 метра в секунду|

## Получение данных
Mining Drill позволяет получать информацию о составе породы в его позиции в любое время.
Возвращаемое значение представляет собой объект [Key-Value](../../xenoncode/documentation.md#key-value-objects) в следующем формате, например: `.C{0.12}.Fe{0.05}.Si{0.03}.Cu{0.80}`.
Это означает, что в данной позиции содержится 12% углерода, 5% железа, 3% кремния и 80% меди.


## Эффективность и истощение
Зона добычи не бесконечна — она постепенно истощается по мере углубления, и эффективность соответственно снижается.  
Время от времени потребуется перемещать буровую установку.


### List of outputs
|Channel|Function|
|---|---|
|0|Composition|
|1|Depth|
|2|Efficiency|
|3|MiningRate|
|4|DrillingRate|
