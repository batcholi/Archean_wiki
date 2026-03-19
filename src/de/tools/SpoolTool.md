<p align="center">
  <img src="SpoolTool.png" />
</p>

|Item|`SpoolTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
Das Spool Tool wird verwendet, um Kabel und Rohre zu verlegen, die Komponenten miteinander verbinden und die Übertragung von Daten, Energie, Items oder Fluiden zwischen ihnen ermöglichen.

# Spool-Typen
Drücke **C**, um das Spool-Auswahlmenü zu öffnen. Es gibt 5 Spool-Typen:

<p align="center">
  <img src="../consumables/dataspool.png" />
  <img src="../consumables/lowvoltagespool.png" />
  <img src="../consumables/highvoltagespool.png" />
  <img src="../consumables/fluidspool.png" />
  <img src="../consumables/itemconduitspool.png" />
</p>

|Typ|Farbe|Verwendung|
|---|---|---|
|**Data Cable**|Blau|Datenports für Informationsübertragung verbinden|
|**Low Voltage Cable**|Rot|Niederspannungs-Stromports verbinden|
|**High Voltage Cable**|Orange|Hochspannungs-Stromports verbinden|
|**Fluid Pipe**|Grau|Fluid-Ports für Flüssigkeits-/Gasübertragung verbinden|
|**Item Conduit**|Dunkelgrau|Item-Ports für Item-Übertragung verbinden|

Jeder Spool-Typ kann nur kompatible Ports verbinden. Spools können in deinem Inventar gestapelt werden und die verbleibende Länge wird auf jedem Spool-Item angezeigt.

# Usage

## Spool-Typ auswählen
Drücke **C**, um das Spool-Auswahlmenü zu öffnen und den gewünschten Kabeltyp auszuwählen.

## Ein Kabel erstellen (zwei Komponenten verbinden)
1. Ziele auf den Anschluss einer Komponente und **Linksklick**, um das Kabel zu starten
2. Klicke, um Zwischenpunkte hinzuzufügen und den Kabelverlauf zu formen
3. Ziele auf den Zielanschluss und **Linksklick**, um die Verbindung abzuschließen

Während der Kabelerstellung:
- **Rechtsklick** entfernt den zuletzt platzierten Punkt (oder bricht ab, wenn keine Punkte vorhanden sind)
- **Scrollrad** wechselt zwischen alternativen automatischen Wegfindungsrouten
- Halte **Shift**, um Kabel an Komponentenoberflächen einzurasten
- Halte **X**, um das Kabel auf der Innenseite von Blöcken/Komponenten zu platzieren

## Automatische Wegfindung
Das Spool Tool verfügt über eine automatische Wegfindung, die Kabelrouten vorschlägt. Verwende das **Scrollrad** beim Platzieren, um zwischen verschiedenen Routenpermutationen zu wechseln.

## Ein flexibles Kabel erstellen
Um Komponenten auf verschiedenen Bauwerken zu verbinden:
1. Starte das Kabel an einem Bauwerk
2. Beende es an der Komponente eines anderen Bauwerks

Dies erstellt ein **flexibles Kabel**, das:
- Die zwei Bauwerke physisch miteinander verbindet
- Von der Physik-Engine eingeschränkt wird
- Keine Kraftbegrenzung hat (löst sich nicht)
- Von der Schwerkraft beeinflusst wird

Du kannst auch ein flexibles Kabel zwischen zwei Komponenten **desselben Bauwerks** erstellen, indem du **X** gedrückt hältst.

## Ein Kabel löschen
Halte **Rechtsklick** und drücke dann kurz **Linksklick** auf ein bestehendes Kabel, um es zu löschen.

## Kabel bemalen
Verwende das [Paint Tool](PaintTool.md), um das Aussehen von Kabeln anzupassen:
- Normales Bemalen ändert die Kabelfarbe
- Halte **Shift** für einen Streifeneffekt
- Halte **X**, um die Farbe aller passenden Kabel zu ersetzen
- Kombiniere beides für transparente Streifen

---

> **Tipps:**
> - Wenn ein Kabel sich nicht erstellen lässt, hast du möglicherweise nicht genug verbleibende Länge in deinem Spool
> - Kabel haben kein Übertragungslimit und keinen Verlust in Bezug auf die Länge
> - Kabel bestimmen nicht die Übertragungsrichtung
> - Ein Kabel kann nach der Platzierung nicht mehr verändert werden — du musst es löschen und neu erstellen
> - Flexible Kabel beeinflussen die Leistung stärker als normale Kabel — priorisiere normale Kabel, wenn möglich
> - Werkzeuge können Items aus externen Containern verwenden, indem das Werkzeug in diesen Container gelegt wird
