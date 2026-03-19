<p align="center">
  <img src="ItemJunction.png" />
</p>

|Component|`ItemJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Item**|Accept Push/Pull -> Forwards action to other side|
#
---
# Description
Die Item Junction ist eine Komponente, die die Verteilung oder Zusammenführung von Items ermöglicht.
Sie beeinflusst das Stapeln nicht.

# Usage
Die Item Junction überträgt Items nach der Logik, die im folgenden Beispielbild dargestellt ist. Die Ports auf der Seite mit 4 Ports kommunizieren nur mit dem Port auf der Seite, die nur einen enthält.

Wenn Items durch den unteren Port dieser Komponente eintreten, wird die Round-Robin-Logik zur Verteilung verwendet.


<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
