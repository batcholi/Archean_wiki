<p align="center">
  <img src="Crusher.png" />
</p>

|Component|`Crusher`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Item**|Accept Push, Initiate Push|
#
---

# Description
Der Crusher ist eine Komponente, die das schnelle Zerkleinern von Gestein ermöglicht, um Erze zu gewinnen.

Er kann auch verwendet werden, um **jedes herstellbare Item zu recyceln** und in seine Rohmaterialien zurückzuverwandeln. Der Recyclingprozess gibt **100% der primären Ressourcen** zurück, die zur Herstellung des Items verwendet wurden, indem das Herstellungsrezept rekursiv zerlegt wird.

> **Hinweis:** [Batteries](../energy/battery/LowVoltageBattery.md) haben ein spezielles Recyclingrezept, das nur ungefähr **50%** der Herstellungskosten zurückgibt. Dies verhindert die Ausnutzung des Recyclingsystems, um kostenlose Aufladungen zu erhalten, indem entladene Batterien zerkleinert und neu hergestellt werden.

# Usage
Der Crusher benötigt Hochspannung und verbraucht 10 kW.

Um den Crusher zu verwenden, senden Sie einfach Gestein zum Zerkleinern durch seinen Item-Eingangsport. Er zieht nicht von seinem Eingang, ist aber in der Lage, die gewonnenen Erze in jeden Container zu schieben, der Items akzeptiert.

Der Crusher kann 400 kg Gestein pro Sekunde verarbeiten, was der Ausgangsleistung von 4 [Mining Drills](MiningDrill.md) bei voller Leistung entspricht.

> Wenn die Zusammensetzung des Gesteins eine niedrige Konzentration bestimmter Erze enthält, sammelt der Crusher die Erze mit niedriger Konzentration an, bis es möglich ist, mindestens eine Einheit des Erzes zu produzieren.
