<p align="center">
  <img src="Hitch.png" />
</p>

|Component|`Hitch`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|50 x 50 x 50 cm|
#
---

# Description  
Die Hitch-Komponente verbindet zwei Builds an einem festen Punkt miteinander und ermöglicht dabei volle Rotationsfreiheit um das Gelenk. Einmal verbunden, bleiben die Fahrzeuge in ihrer Position fixiert, können sich aber relativ zueinander um die Hitch drehen.

# Usage  

Die Hitch hat einen **Datenanschluss**, der ihren Zustand steuert.  
Wenn zwei Hitch-Komponenten aktiviert (scharf geschaltet) sind und in unmittelbare Nähe kommen, verbinden sie sich automatisch.
Die Verbindung kann jederzeit getrennt werden, indem eine der Komponenten deaktiviert wird.

> - Aus Leistungsgründen werden Kollisionen zwischen verbundenen Builds nicht verarbeitet. Das Spiel verwendet serverseitige Physik, und die ständige Überprüfung von Kollisionen zwischen Fahrzeugen in unmittelbarer Nähe wäre zu aufwendig. Ein zukünftiges Update könnte es Spielern ermöglichen, Beschränkungen über alle Hitch-Achsen zu definieren, um physikalische Grenzen zu simulieren, beispielsweise um zu verhindern, dass ein Anhänger über einen bestimmten Winkel hinaus rotiert, um ein Eindringen in die Zugmaschine zu vermeiden.

### List of inputs
|Channel|Function|value|
|---|---|---|
|0|Arm/Disarm Docking|0 or 1|

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Is Docked|0 or 1|

