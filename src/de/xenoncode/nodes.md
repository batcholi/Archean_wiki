# Visueller Node-Editor
Der Node-Editor der XenonCode IDE bietet eine breite Palette an Nodes, um dir beim Erstellen von Skripten und Programmen zu helfen.

Er ist umfassend genug, um komplexe Aufgaben zu bewältigen, und ist zudem für Anfänger leichter zu erfassen. Für noch weitergehende Möglichkeiten kannst du auch [XenonCode](documentation.md) im Textmodus (Code) verwenden.

---
## Code-Generierung

Das Visual-Nodes-System generiert immer automatisch Code im Hintergrund, wenn du Änderungen vornimmst.  
Der Code wird generiert, wenn ein `output`-, `print`- oder `execute`-Endpunkt-Node hinzugefügt wird, und er wird über die Eingabeabhängigkeiten zurückpropagiert.  
Das bedeutet, dass das Hinzufügen eines Input-Nodes keinen Code generiert, aber das Hinzufügen eines Output-Nodes den Code für beide Nodes generiert, wenn du sie miteinander verbindest.  

---
## Liste der Nodes

Hier ist eine Liste der verschiedenen Node-Typen, die im Editor verfügbar sind, zusammen mit ihren Beschreibungen falls nötig:

`Constant Number` Definiert einen konstanten numerischen Wert.

`Constant Text` Definiert einen konstanten Textwert.

`Variable Number` Definiert einen variablen numerischen Wert, der von einem anderen Node definiert und zurückgesetzt werden kann.

`Variable Text` Definiert einen variablen Textwert, der von einem anderen Node definiert und zurückgesetzt werden kann.

`Comment` Ermöglicht die Anzeige eines Kommentarblocks in deinem Skript.

---
### Input
`By Alias` Verwende einen Output-Node einer Komponente unter Verwendung ihres Alias bei der Kommunikation über einen Router.

`0,1,2,3...` Verwende einen Output-Node einer Komponente, die aktuell mit einem Port des Computers verbunden ist. Wenn du eine Komponente mit einem Port verbindest, wird sie automatisch vom Computer erkannt.

---
### Output
`Print (Console log)` Zeigt eine Zahl/einen Text in der Computerkonsole an.

`By Alias` Verwende einen Input-Node einer Komponente unter Verwendung ihres Alias bei der Kommunikation über einen Router.

`0,1,2,3...` Verwende einen Input-Node einer Komponente, die aktuell mit einem Port des Computers verbunden ist. Wenn du eine Komponente mit einem Port verbindest, wird sie automatisch vom Computer erkannt.

---
### Mathematik
Mathematik-Nodes können mehr als zwei Eingänge haben, sodass du mehrere Werte in einer einzelnen Operation verketten kannst.

`Add` Gibt die Addition von zwei oder mehr Werten zurück.

`Subtract` Gibt die Subtraktion von zwei oder mehr Werten zurück.

`Multiply` Gibt das Produkt von zwei oder mehr Werten zurück.

`Divide` Gibt die Division von zwei oder mehr Werten zurück.

`Absolute` Gibt den Absolutwert einer Zahl zurück.

`Negative` Gibt den negativen Wert einer Zahl zurück.

`Modulo` Gibt den Rest der Division zweier Zahlen zurück.

`Floor` Gibt den auf die nächste ganze Zahl abgerundeten Wert zurück.

`Ceil` Gibt den auf die nächste ganze Zahl aufgerundeten Wert zurück.

`Round` Gibt den auf die nächste ganze Zahl gerundeten Wert zurück.

`Fract` Gibt den Dezimalteil einer Zahl zurück.

`Sign` Gibt das Vorzeichen einer Zahl zurück.

`Pow` Gibt die Potenz zweier Zahlen zurück.

`Log` Gibt den Logarithmus einer Zahl zurück.

`Sqrt` Gibt die Quadratwurzel einer Zahl zurück.

`Clamp` Gibt den Wert einer Zahl begrenzt zwischen einem Minimum und Maximum zurück.

`Step` Gibt 0 zurück, wenn der Wert kleiner als ein Schwellenwert ist, und 1, wenn er größer ist.

`Smoothstep` Gibt eine begrenzte glatte Interpolation zwischen zwei Werten basierend auf einem Verhältnis zurück.

`Lerp` Gibt eine lineare Interpolation zwischen zwei Werten basierend auf einem Verhältnis zurück.

`Sin` Gibt den Sinus eines Winkels zurück (angegeben in Radiant).

`Cos` Gibt den Kosinus eines Winkels zurück (angegeben in Radiant).

`Tan` Gibt den Tangens eines Winkels zurück (angegeben in Radiant).

`Asin` Gibt den Arkussinus-Winkel in Radiant einer Zahl zurück.

`Acos` Gibt den Arkuskosinus-Winkel in Radiant einer Zahl zurück.

`Atan` Gibt den Arkustangens-Winkel in Radiant einer Zahl zurück.

---
### Boolean
Boolesche Werte werden als numerische Werte dargestellt. 0 bedeutet False, alles andere bedeutet True.
Boolesche Nodes können mehr als zwei Eingänge haben, sodass du mehrere Bedingungen in einer einzelnen Operation verketten kannst.

`And` Gibt 1 zurück, wenn alle Werte als True ausgewertet werden.

`Or` Gibt 1 zurück, wenn einer der Werte als True ausgewertet wird.

`Xor` Gibt 1 zurück, wenn eine ungerade Anzahl der Werte als True ausgewertet wird.

`Not` Gibt das Gegenteil eines gegebenen booleschen Werts zurück.

---
### Vergleich
`Equal` Vergleicht, ob zwei Werte gleich sind, und gibt einen Boolean (0 oder 1) zurück.

`Greater` Vergleicht, ob ein Wert größer als ein anderer ist, und gibt einen Boolean (0 oder 1) zurück.

`Lesser` Vergleicht, ob ein Wert kleiner als ein anderer ist, und gibt einen Boolean (0 oder 1) zurück.

---
### Funktionen
`Expression` Ermöglicht das Schreiben eines fortgeschritteneren mathematischen Ausdrucks unter Verwendung von XenonCode-Funktionen und/oder Algebra.

`Switch` Gibt verschiedene Werte abhängig vom Eingabewert zurück.

`Counter` Gibt einen Zähler zurück, der bei jedem Aufruf inkrementiert wird. Der Anfangswert, Minimum und Maximum können definiert werden.

`Pulse` Gibt 1 zurück, wenn sich der Eingabewert geändert hat.

`PulseToggle` Gibt einen Boolean zurück, der bei jeder Änderung des Eingabewerts zwischen True/False umschaltet.

`Text` Ermöglicht das Schreiben eines fortgeschritteneren Textausdrucks.

`PID Controller` Gibt einen PID-Regelwert basierend auf dem Fehler, dem Integral des Fehlers und der Ableitung des Fehlers zurück.

`Unit Converter` Konvertiert einen Wert zwischen gängigen physikalischen Einheiten derselben Kategorie. Unterstützte Kategorien: Angle (Radians, Degrees), Rotation (RPS, RPM), Speed (m/s, km/h, mph, ft/s, knots), Temperature (Kelvin, Celsius, Fahrenheit), Pressure (Pascal, bar, psi, atm), Force (Newton, lbf, kgf).

---
### Ausführung
`Statement` Ermöglicht das Schreiben einer reinen XenonCode-Anweisung wie eines Funktionsaufrufs. Muss zu einem Conditional- oder Execute-Node ausgegeben werden.

`Conditional` Berücksichtigt die gegebene Anweisung nur, wenn die gegebene Bedingung als True ausgewertet wird. Kann mit anderen Conditionals verkettet werden.

`Execute` Führt die verbundenen Anweisungen in Reihenfolge von oben nach unten aus.

`Include` Bindet ein anderes XenonCode-Skript in das aktuelle Skript ein. Stelle sicher, dass deine Variablen- und Konstanten-Nodes eindeutige Namen haben.

---
### Timing

`Time` Gibt den aktuellen Unix-Zeitstempel in Sekunden zurück, mit Dezimalstellen mit Mikrosekunden-Präzision.

`Delay` Gibt einen Boolean 1 nach einer gegebenen Verzögerung in Sekunden zurück, nachdem der Set-Eingang eine Änderung von 1 auf 0 empfangen hat.

`Blinker` Gibt einen alternierenden Boolean zwischen 0 und 1 zurück, der sich bei jedem definierten Zeitintervall in Sekunden ändert.

`Smooth` Gibt einen Wert zurück, der vom vorherigen Ziel (oder 0) zum aktuellen Zielwert mit einer gegebenen Dauer in Sekunden interpoliert, nachdem der Start-Eingang eine Änderung von 1 auf 0 empfangen hat.
