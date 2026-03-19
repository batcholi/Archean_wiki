# Push & Pull

In Archean bewegen sich Gegenstände und Fluide nicht von selbst. Jeder Transfer zwischen zwei Komponenten folgt einem **Push/Pull**-Modell: Eine Seite muss die Aktion aktiv einleiten und die andere Seite muss sie annehmen.

Das Verständnis dieses Systems ist essentiell für den Bau funktionaler Aufbauten. Die Wiki-Seite jeder Komponente gibt ihren Push/Pull-Modus in der Info-Tabelle oben an.

## Die drei Rollen

### Initiate
Eine Komponente, die eine Aktion **einleitet**, startet den Transfer aktiv. Sie pusht Gegenstände/Fluide zu dem, was mit ihrem Ausgang verbunden ist, oder pullt von dem, was mit ihrem Eingang verbunden ist.

### Accept
Eine Komponente, die eine Aktion **annimmt**, ist passiv. Sie kann einen Push empfangen oder auf einen Pull antworten, wird aber niemals selbst einen Transfer starten.

### Forward
Eine Komponente, die eine Aktion **weiterleitet**, gibt sie an die andere Seite weiter. Sie speichert nichts -- sie leitet die Push- oder Pull-Aktion einfach von einem Anschluss zum anderen weiter.

> Forwarder sind transparent: Wenn etwas in eine Seite einer Bridge gepusht wird, pusht die Bridge in das, was auf der anderen Seite ist. Das Gleiche gilt für Pulls.

## Funktionsweise

- **Push**: Die Quelle sendet Gegenstände/Fluide zum Ziel. Die Quelle entscheidet, *was* und *wann* gesendet wird.
- **Pull**: Das Ziel fordert Gegenstände/Fluide von der Quelle an. Das Ziel entscheidet, *was* und *wann* abgerufen wird.

Eine Verbindung funktioniert nur, wenn eine Seite **einleitet** und die andere Seite **annimmt** (oder an etwas weiterleitet, das annimmt). Zwei passive Komponenten, die miteinander verbunden sind, werden niemals etwas übertragen.

---

## Ein häufiger Fehler

Betrachte diesen Aufbau: **Mining Drill → Container → Crusher**

Der Drill **leitet Push ein**, sodass Steine im Container ankommen. Aber der Container **nimmt nur an** -- er wird niemals selbst etwas hinausschieben. Und der Crusher **nimmt nur Push an** -- er wird auch nicht vom Container pullen. Ergebnis: Steine stapeln sich im Container und nichts erreicht den Crusher.

### Lösungen

**Mining Drill → Crusher → Container**
Der Drill pusht Steine zum Crusher, der sie annimmt, verarbeitet und die resultierenden Erze zum Container pusht.

**Mining Drill → Container → Item Conveyor → Crusher → Container**
Der [Item Conveyor](components/items/ItemConveyor.md) ist ein **Initiator** -- er pullt aktiv vom ersten Container und pusht zum Crusher. Dies ist nützlich, wenn du Steine puffern oder die Durchflussrate steuern möchtest.

---

## Komponentenseiten lesen

Jede Komponentenseite zeigt ihren Push/Pull-Modus in der Info-Tabelle:

| Modus | Bedeutung |
|---|---|
| `Initiate Push` | Pusht aktiv zu seinem Ausgang |
| `Initiate Pull` | Pullt aktiv von seinem Eingang |
| `Initiate Push/Pull` | Macht aktiv beides |
| `Accept Push` | Empfängt passiv Pushes |
| `Accept Pull` | Reagiert passiv auf Pulls |
| `Accept Push/Pull` | Macht passiv beides |
| `Accept Push/Pull -> Forwards action to other side` | Leitet Aktionen weiter |

Einige Komponenten kombinieren Rollen -- zum Beispiel **nimmt** der Crusher an seinem Eingang **Push an** (Steine rein) und **leitet Push ein** an seinem Ausgang (Erze raus).
