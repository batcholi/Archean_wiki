<p align="center">
  <img src="FluidJunction.png" />
</p>

|Component|`FluidJunction`|
|---|---|
|**Module**|`ARCHEAN_junction`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
Die Fluid Junction ist eine Komponente, die das Trennen oder Zusammenführen von Fluiden ermöglicht.

# Usage
Die Fluid Junction überträgt Fluide nach der Logik, die im folgenden Beispielbild dargestellt ist. Die Ports auf der Seite mit 4 Ports kommunizieren nur mit dem Port auf der Seite, die nur einen enthält.

Wenn Fluid durch den einzelnen unteren Port eintritt, wird es auf die vier oberen Ports verteilt, basierend auf der Aufnahmekapazität der angeschlossenen Komponenten. Wenn alle Ports offen sind, wird das Fluid gleichmäßig aufgeteilt. Wenn jedoch ein oder mehrere Ports geschlossen sind (z.B. durch ein [Fluid Valve](./FluidValve.md)), wird die gesamte Fluidmenge nur auf die verbleibenden Ports umverteilt, die den Fluss noch aufnehmen können.

<p align="center">
  <img src="diagrFluidJunction.png" />
</p>
