<p align="center">
  <img src="dataspool.png" />
  <img src="lowvoltagespool.png" />
  <img src="highvoltagespool.png" />
  <img src="fluidspool.png" />
  <img src="itemconduitspool.png" />
</p>

|Item|`Spool`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Länge**|100 m|

# Description
Die verschiedenen Spools ermöglichen das Verbinden von Komponenten, um Daten, Energie, Items oder Fluide zu übertragen.

# Usage
## Ein Kabel erstellen (zwei Komponenten verbinden)
Die Erstellung eines Kabels beginnt und endet an einem Komponentenanschluss.

Die Platzierung von Kabeln ist völlig frei und ermöglicht das Hinzufügen beliebig vieler Punkte (solange die verbleibende Länge deines Spools reicht), um die Form anzupassen. Während der Erstellung eines Kabels, wenn du mehrere Punkte platziert hast, kannst du Punkte mit dem `Rechtsklick` entfernen, um die Platzierung zu verfeinern, oder die Erstellung des Kabels vollständig abbrechen, wenn keine Punkte mehr vorhanden sind.

- Kabel können auf bestehende Kabel und Komponenten gestapelt werden. (Um es an der Oberfläche einer Komponente einzurasten, musst du die `Shift`-Taste gedrückt halten).
- Du kannst das Kabel auf der Innenseite des Blocks/der Komponente platzieren, indem du die `X`-Taste gedrückt hältst.

## Ein flexibles Kabel erstellen
Du möchtest vielleicht Komponenten verschiedener Bauwerke temporär verbinden oder einfach zwei Bauwerke miteinander verbinden.  
Dies erstellt effektiv ein flexibles Kabel.  
Die zwei Bauwerke werden effektiv miteinander verbunden und in der Physik-Engine eingeschränkt.  
Es gibt keine Kraftbegrenzung, die Kabel werden sich nicht lösen.  
Du kannst auch ein flexibles Kabel zwischen zwei Komponenten desselben Bauwerks erstellen, indem du `X` gedrückt hältst, um ein gerades (vielleicht leicht gebogenes) Kabel zu erhalten, das von der Schwerkraft beeinflusst wird.

## Ein Kabel löschen
Du kannst ein Kabel mit einem `Rechtsklick` löschen, solange das Werkzeug in deiner Hand der entsprechende Kabel-Spool ist.

## Kabel bemalen
Du kannst Kabel mit dem [Paint Tool](../tools/PaintTool.md) bemalen, genau wie bei Blöcken.
Kabel bieten zwei zusätzliche Anpassungsoptionen:
- `Shift` zum Bemalen eines Kabels und es transparent machen
- `X` zum normalen Bemalen eines Kabels mit einem Streifeneffekt
  
Du kannst auch beide Effekte kombinieren, indem du beide Tasten gedrückt hältst.

---
>- *Wenn dein Kabel bei der Erstellung nicht erstellt werden will, hast du wahrscheinlich nicht genug verfügbare Länge in deinem aktuellen Spool.*
>- *Kabel haben kein Übertragungslimit und keinen Verlust in Bezug auf die Länge.*
>- *Kabel bestimmen nicht die Richtung dessen, was sie transportieren.*
>- *Ein Kabel kann nach der Platzierung nicht mehr verändert werden, du musst es löschen.*
>- *Flexible Kabel beeinflussen die Leistung erheblich, während normale Kabel die Leistung überhaupt nicht beeinflussen, selbst wenn du Tausende davon in einem Bauwerk hast. Versuche, normale Kabel zu priorisieren, wo du kannst.*
