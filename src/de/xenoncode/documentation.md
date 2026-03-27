# XenonCode - Dokumentation

**XenonCode** ist eine leichtgewichtige Programmiersprache, die als High-Level-Skriptsprache innerhalb von Spielen für virtuelle Computergeräte entwickelt wurde (z.B. ein programmierbarer Computer innerhalb eines Spiels).

# Fähigkeiten

- Typisierte Variablen
- Konstanten
- Dynamische Arrays
- Vektoren und Matrizen (bis zu 4x4) mit Swizzling
- Standard-Rechenoperationen auf numerischen Werten
- Einfache Textverkettung und Formatierung
- Benutzerdefinierte Funktionen
- Gerätedefinierte Funktionen und Objekte
- Trailing/Member-Funktionen
- Eingebaute Standard-Mathematikfunktionen
- Eingebaute IO-Operationen zwischen virtuellen Geräten
- Eingebaute Key-Value-Objekte
- Synchronisierte Intervallfunktionen (Timer)
- `if`/`elseif`/`else` Bedingungen
- `while` Schleifen
- `foreach` Schleifen für Arrays
- `repeat n` Schleifen
- `for` Schleifen mit erstem und letztem Index

# Beispielcode

```xc
include "my_functions.xc"

; Declare global storage
storage var $myStorageVar : number
storage array $myStorageArray : number

; Declare global variables
var $myVar = 0
var $myVar2 = "Hello World"
var $myVar3 : number
var $myVar4 : text
array $myArray : number
array $myArray2 : text

; Declare a user-defined function that changes the values of $myVar and $myVar2
function @myFunction($arg1 : number, $arg2 : text)
	$myVar = $arg1
	$myVar2 = $arg2

; Declare a user-defined function that returns a value
function @myFunction2($arg1 : number, $arg2 : text) : number
	return $arg1 + size($arg2)

init
	; Call a user-defined function
	@myFunction(1, "Hello")

	; Call a trailing function
	$myVar.@myFunction2("Hey")

	; Add values to an array
	$myArray.append(1)
	$myArray.append(5)
	$myArray.append(0)

	; Sort an array
	$myArray.sort()

	; Iterate over an array
	foreach $myArray ($index, $item)
		$myVar4 &= $index:text & ": " & $item:text & ", "

	; Output to a virtual device (ie: a console at input port 0)
	output.0 ($myVar4)
	output.0 (text("Sum of values in the array: {}", $myArray.sum))
	output.1 ($myArray.0:text)
	output.1 ($myArray.1:text)
	var $index = 2
	output.1 ($myArray.$index:text)
	
	; Repeat a statement three times
	repeat 3 ($i)
		output.1 ($i)

	; for loops
	for 3,8 ($i)
		; value of $i will go from 3 to 8 inclusively
	
```

## Typen von Entwicklern

1. `User`: Die Person, die diese Sprache zum Schreiben eines Skripts verwendet, typischerweise ein Spieler in einem Spiel. 
2. `Device`: Die Implementierung, die die Fähigkeiten und verfügbaren Funktionen definiert, typischerweise ein bestimmter Typ eines programmierbaren virtuellen Geräts in einem bestimmten Spiel. 

# Syntax

XenonCode wurde mit einer sehr einfachen Syntax und einer sehr präzisen Struktur entworfen. 

- Jede Anweisung sollte kurz und leicht lesbar sein
- Sehr wenige Sonderzeichen benötigt
- Weniger kryptisch als die meisten anderen Sprachen
- Einrückungen definieren den Geltungsbereich (nur Tabs, keine Mehrdeutigkeit)
- Eine einzelne Anweisung pro Zeile
- Array-Indizierung ist, wie bei den meisten anderen Programmiersprachen, 0-basiert, verwendet aber die `arr.0` Punkt-Notation anstelle der üblichen `arr[0]` Subscript-Notation
- 100% Groß-/Kleinschreibung wird ignoriert
- Eine Implementierung kann benutzerdefinierte "Device"-Funktionen, -Objekte und -Einstiegspunkte definieren

### Typen

XenonCode ist eine typisierte Sprache, enthält aber nur zwei generische Typen sowie Arrays von beiden und implementierungsdefinierte Objekte.  

Generische Datentypen, die der Benutzer deklarieren kann: 
- `number`
- `text`
- `vecN` (numerischer Vektor fester Größe, z.B. `vec3`)
- `matNxM` (numerische Matrix fester Größe, z.B. `mat4x4`)

Eine `number`-Variable ist intern immer eine 64-Bit-Gleitkommazahl, kann aber auch als Boolean fungieren, wenn ihr Wert entweder 1 oder 0 ist (true oder false), wobei jeder Wert ungleich Null als true ausgewertet wird.  

`text`-Variablen enthalten einfachen Unicode-Text, obwohl ihre maximale Größe von der Implementierung abhängt.  
Ein Text-Literal wird innerhalb von Anführungszeichen `" "` definiert.  
Um Anführungszeichen innerhalb des Texts zu verwenden, kann man sie verdoppeln.  
Es gibt keinen anderen Escape-Sequenz-Mechanismus. Ein Backslash `\` ist einfach Teil des Strings, und die Implementierung kann entscheiden, ihn für Escape-Sequenzen zu verwenden.  
```xc
var $myText = "Say ""Hello"" to this text"
```

Objekttypen sind für die Verwendung durch die Implementierung und sind für den Benutzer undurchsichtig, das heißt ihre Struktur ist nicht unbedingt definiert, jedoch kann die Implementierung dem Benutzer einige Member-Funktionen für diese Objekte zur Verfügung stellen.  

Obwohl dies eine typisierte Sprache ist, muss der Typ nicht angegeben werden, wenn er vom Compiler bei der Initialisierung automatisch abgeleitet werden kann. Der Typ sollte nur angegeben werden, wenn keine Initialisierung erfolgt.  

Alle benutzerdefinierten Wörter müssen mit einem Präfixzeichen beginnen:  
- `$` für Variablen
- `@` für Funktionen

### Kommentare

Kommentare sind Zeilen, die mit `;` beginnen.  
Eine Code-Anweisung kann auch mit einem nachgestellten Kommentar enden.
HINWEIS: `//` ist veraltet und sollte NICHT verwendet werden.  

# Einschränkungen
Diese Sprache ist so konzipiert, dass sie potenziell serverseitig im Kontext eines Multiplayer-Spiels ausgeführt werden kann, daher gibt es aus Sicherheits- und Leistungsgründen Grenzen für das, was Benutzer tun können.

- Keine Zeiger- oder Referenztypen (außer für implementierungsdefinierte Objekte, die von der Implementierung zur Laufzeit bereinigt werden müssen)
- Die Anzahl der Anweisungen pro Zyklus kann begrenzt sein, wobei ein Überlauf einen virtuellen Absturz für den Benutzer verursachen kann
- Arrays können in der Größe zur Laufzeit begrenzt sein, wobei ein Überlauf einen virtuellen Absturz für den Benutzer auslösen kann
- Rekursiver Stack (rekursiver Funktionsaufruf) ist mit einer speziellen Syntax erlaubt und auf 16 Rekursionen begrenzt
- Funktionen MÜSSEN vollständig VOR ihrer Verwendung definiert werden, daher ist die Reihenfolge der Definition wichtig (dies erzwingt den vorherigen Punkt)

### Einschränkungen pro virtuellem Computer
Diese werden pro Implementierung definiert und können mehrere Varianten enthalten oder vom Benutzer anpassbar sein

- ROM (maximale kompilierte Programmgröße als Anzahl von 32-Bit-Wörtern)
- RAM (maximale Anzahl lokaler, globaler und temporärer Variablen plus alle lokalen und globalen Arrays multipliziert mit ihrer Größe)
- STORAGE (maximale Anzahl von Storage-Variablen plus alle Storage-Arrays multipliziert mit ihrer Größe)
- Frequenz (maximale Frequenz für Timer-Funktionen und Eingabelesen)
- Ports (maximale Anzahl von Eingängen/Ausgängen)
- IPC (maximale Anweisungen pro Zyklus, eine Codezeile kann als mehrere Anweisungen zählen)

### Operationen auf Daten
- Alle Funktionen, einschließlich Timer, werden atomar ausgeführt, was Data-Races verhindert
- Funktionsargumente werden immer als Kopie übergeben, eine Funktion KANN die Variablen in ihrer Argumentliste NICHT ändern
- Trailing-Funktionen ÄNDERN den Wert der führenden Variable
- Variablenzuweisungen kopieren immer den Wert für generische Typen
- Implementierungsdefinierte Objekte werden immer als Referenz übergeben
- Implementierungsdefinierte Objekte können nicht kopiert werden, es sei denn, die Implementierung stellt diese Funktionalität über eine Gerätefunktion bereit
- Divisionen durch Null führen zu einem Laufzeitfehler. Es liegt in der Verantwortung des Benutzers, dies zu berücksichtigen.

### Grundregeln
- Variablen können mit `var` deklariert und optional mit einem Anfangswert versehen werden, andernfalls wird der generische Standardwert verwendet (0 für number und "" für text)
- Objektvariablen müssen bei der Deklaration zugewiesen werden, unter Verwendung eines Konstruktors oder einer Gerätefunktion, die ein Objekt dieses Typs zurückgibt
- Eine Anweisung mit einem Variablennamen (beginnend mit `$`) zu starten bedeutet, dass wir ihren Wert ändern
- Wenn das nächste Wort nach einer Variablenzuweisung `=` ist, wird das Ergebnis des folgenden Ausdrucks als neuer Wert zugewiesen
- Wenn das nächste Wort nach einer Variablenzuweisung ein Punkt und eine Funktion ist, wird dieser Funktionsaufruf als Trailing-Funktion betrachtet
- Der Aufruf einer Trailing-Funktion ÄNDERT den Wert der führenden Variable, die auch als erstes Argument der Funktion verwendet wird und beim Aufruf in der Argumentliste weggelassen werden muss
- Eine Anweisung mit einem Funktionsnamen (beginnend mit `@` für benutzerdefinierte Funktionen) zu starten bedeutet, dass wir diese Funktion aufrufen und ihren Rückgabewert verwerfen
- Der Aufruf einer Funktion wird NIEMALS den Wert eines ihrer generisch typisierten Argumente innerhalb der Klammern ändern, generische Typen werden immer als Kopie übergeben
- Alles in Klammern, dem kein Funktionsname vorausgeht, wird als separater Ausdruck betrachtet; innere, links stehende Ausdrücke werden zuerst berechnet
- Die üblichen Regeln für die mathematische Vorrangigkeit von Operatoren gelten

# Gültige Verwendung

XenonCode ist dafür konzipiert, als ByteCode kompiliert zu werden, der vom Host-Spiel zur Laufzeit sehr schnell geparst werden kann.  

## Jede Zeile muss mit einem der folgenden ersten Wörter beginnen (mit Beispielen):

### Globaler Geltungsbereich
- `include` Importiert den Inhalt einer anderen Datei
- `const` Deklariert eine globale Konstante
- `var` Deklariert eine globale Variable
- `array` Deklariert ein globales Array
- `storage` Deklariert eine Storage-Variable oder ein Array, das über Neustarts hinweg persistent ist
- `init` Definiert den Körper der Init-Funktion, die einmal beim Einschalten des Geräts ausgeführt wird
- `tick` Deklariert den Körper der Tick-Funktion, die bei jedem Taktzyklus ausgeführt wird
- `function` Deklariert eine benutzerdefinierte Funktion
- `recursive function` Deklariert eine benutzerdefinierte Funktion, die sich selbst rekursiv aufrufen kann
- `timer` Definiert den Körper einer Funktion, die wiederholt mit einer bestimmten Frequenz in Hz ausgeführt wird
- `input` Definiert eine Eingabefunktion
- `;` Kommentare
- Ein von der Implementierung definierter Einstiegspunkt
- Ein oder mehrere Tabs, was bedeutet, dass wir uns innerhalb eines Funktionskörpers befinden; dann gelten die folgenden Regeln:

### Funktionskörper / Einstiegspunkt
- `var` Deklariert eine neue Variable im lokalen Geltungsbereich (nicht von außerhalb dieser Funktion zugänglich)
- `array` Deklariert ein neues Array im lokalen Geltungsbereich (nicht von außerhalb dieser Funktion zugänglich)
- `$` Weist einer bestehenden Variable einen neuen Wert zu
- `@` Ruft eine benutzerdefinierte Funktion auf
- `output` Eingebaute Funktion zum Senden von Daten an ein anderes Gerät über einen bestimmten Port
- `foreach` Iteriert über alle Elemente eines Arrays
- `repeat` Wiederholt einen Codeblock n Mal
- `while` Wiederholt solange eine Bedingung als true ausgewertet wird
- `for` Wiederholt einen Codeblock mit einem ersten und letzten Index
- `break` Stoppt eine Schleife, als hätte sie alle Iterationen abgeschlossen
- `continue` Stoppt diese Iteration einer Schleife und führt die nächste Iteration sofort aus
- `if` Führt einen Codeblock aus, wenn eine Bedingung als true ausgewertet wird
- `elseif` Nach einem if, wenn die bisherige Bedingung als false und eine neue Bedingung als true ausgewertet wird
- `else` Nach einem if, wenn alle Bedingungen als false ausgewertet wurden
- `return` Stoppt die Ausführung dieser Funktion hier und gibt einen Wert an den Aufrufer zurück

## Reservierte Schlüsselwörter
Da alle benutzerdefinierten Wörter entweder mit `$` oder `@` beginnen müssen, sind keine reservierten Wörter nötig.  
Die Implementierung/das Gerät muss darauf achten, nur Funktionsnamen und Objekttypen zu definieren, die nicht mit eingebauten Schlüsselwörtern der verwendeten XenonCode-Version in Konflikt stehen.  

## Eine Konstante deklarieren
Konstanten sind benannte Werte, die sich während der Ausführung eines Programms niemals ändern sollten. Sie sind zur Compile-Zeit festgelegte Werte.  
Ihre zugewiesenen Werte müssen explizit angegeben werden und müssen Ausdrücke sein, deren Ergebnis zur Compile-Zeit bestimmt werden kann.  

`const $stuff = 5` Deklariert eine Konstante namens $stuff mit der Zahl 5 als Wert
`const $stuff = "hello"` Deklariert eine Konstante namens $stuff mit dem Text "hello" als Wert

## Eine Variable deklarieren
Variablen sind benannte Werte, die sich während der Ausführung eines Programms ändern können.  
Wir können ihnen einen Anfangswert zuweisen oder auch nicht.  
Wenn wir keinen Anfangswert zuweisen, wird der generische Standardwert verwendet und wir müssen einen Typ angeben.  
Eine Variable ist nur innerhalb des Geltungsbereichs zugänglich, in dem sie deklariert wurde. Wenn wir zum Beispiel eine Variable am Anfang einer Funktion deklarieren, ist sie in der gesamten Funktion verfügbar. Wenn wir eine Variable innerhalb eines if-Blocks deklarieren, ist sie nur innerhalb dieses Blocks verfügbar, bis zum entsprechenden `else`, `elseif` oder bis zur Rückkehr zum übergeordneten Geltungsbereich.  
Eine im globalen Geltungsbereich deklarierte Variable ist von überall zugänglich.  
Für Variablen, die im globalen Geltungsbereich deklariert werden: Wenn wir einen Anfangswert zuweisen, muss der angegebene Ausdruck zur Compile-Zeit bestimmbar sein.  
Variablennamen müssen mit einem Buchstaben oder Unterstrich (`a`-`z` oder `_`) beginnen und dürfen dann nur alphanumerische Zeichen und Unterstriche enthalten.  

`var $stuff = 5` Deklariert eine Zahlenvariable mit einem Anfangswert von 5 beim Programmstart  
`var $stuff = "hello"` Deklariert eine Textvariable mit einem Anfangswert von "hello" beim Programmstart  
`var $stuff:number` Deklariert eine Zahlenvariable mit einem Anfangswert von 0 beim Programmstart  
`var $stuff:text` Deklariert eine Textvariable mit einem Anfangswert von "" beim Programmstart  
`var $stuff = position()` Deklariert eine Instanz eines implementierungsdefinierten Objekts vom Typ `position` (dies ist ein Beispiel)  

Implementierungsdefinierte Objekte können nicht ohne Initialisierung deklariert werden, da sie keinen Standardwert haben.  

## Einer Variable einen neuen Wert zuweisen
Um einer Variable einen neuen Wert zuzuweisen, können wir einfach eine Anweisung mit dem Variablennamen beginnen, gefolgt von einem `=` und einem Ausdruck, dessen Ergebnis der neue Wert sein wird.  
Wir können auch eine Trailing-Funktion verwenden, die den Wert der genannten Variable inherent ändert.  

`$stuff = 5` Weist der Variable namens $stuff den Wert 5 zu  
`$stuff = $other + 5` Weist das Ergebnis des Ausdrucks ($other + 5) der Variable namens $stuff zu  
`$stuff.round()` Ruft eine Trailing-Funktion auf, die den Wert der Variable rundet  

## Ein Array deklarieren
Ein Array ist eine dynamische Liste von Werten eines bestimmten Typs. Wir können Werte anhängen oder löschen, auf einen bestimmten Wert in der Liste zugreifen oder alle Werte durchlaufen.  
Bei der Deklaration eines Arrays können wir keinen Anfangswert angeben und müssen einen Typ bereitstellen.  
Arrays werden mit der Größe Null initialisiert, wenn das Programm startet; Werte können während der Programmausführung hinzugefügt/gelöscht/geändert werden.  

`array $stuff:number` Deklariert ein Array von Zahlen  
`array $stuff:text` Deklariert ein Array von Texten  

Arrays können keine implementierungsdefinierten Objekte enthalten, nur generische Typen.  

## Vektoren und Matrizen

Vektoren und Matrizen sind Container fester Größe für 64-Bit-Gleitkommazahlen, nützlich für Positionen, Transformationen und lineare Algebra. Alle Elemente werden mit Null initialisiert.

### Deklaration

Verwenden Sie `vecN` für Vektoren (1D) und `matNxM` für 2D-Matrizen, mit Dimensionen bis zu 4.

```xc
var $position : vec3       ; 3-Element-Vektor (vec2, vec3, vec4 verfügbar)
var $transform : mat4x4    ; 4x4-Matrix
var $rotation : mat3       ; Kurzform für mat3x3
```

| Typ | Kurzform | Beschreibung |
|-----|----------|--------------|
| `vec2`, `vec3`, `vec4` | -- | Vektoren mit 2, 3 oder 4 Elementen |
| `matNxM` | -- | 2D-Matrix mit N Zeilen und M Spalten (z.B. `mat3x4`) |
| `matN` | `matNxN` | Kurzform für quadratische Matrix (z.B. `mat3` = `mat3x3`) |

### Komponentenzugriff

Greifen Sie auf Elemente mit `.x`, `.y`, `.z`, `.w` oder gleichwertig `.0`, `.1`, `.2`, `.3` zu.

**Vektoren** -- jeder Accessor bezieht sich auf ein einzelnes Element:
```xc
var $v : vec3
$v.x = 1       ; Element 0
$v.y = 2       ; Element 1
$v.z = 3       ; Element 2
$v.0 = 1       ; identisch mit .x
```

**2D-Matrizen** -- der erste Accessor wählt eine Zeile, der zweite eine Spalte innerhalb dieser Zeile:
```xc
var $m : mat4x4
$m.0.x = 1     ; Zeile 0, Spalte 0
$m.1.y = 1     ; Zeile 1, Spalte 1
$m.w.w = 1     ; Zeile 3, Spalte 3 (identisch mit $m.3.3)
```

### Swizzling

Kombinieren Sie 2-4 Komponentennamen aus `xyzw`, um mehrere Elemente gleichzeitig in einen neuen Vektor zu extrahieren:
```xc
var $v : vec3
$v.x = 10
$v.y = 20
$v.z = 30
var $a : vec2
$a = $v.xy         ; vec2 mit (10, 20)
var $b : vec2
$b = $v.zx         ; vec2 mit (30, 10)
```
Swizzling erzeugt immer eine **Kopie** -- das Ändern des Ergebnisses beeinflusst nicht das Original.

### Arithmetik

**Elementweise** Operationen zwischen Vektoren/Matrizen gleicher Größe:
```xc
var $a : vec3
var $b : vec3
var $c : vec3
$c = $a + $b       ; elementweise Addition
$c = $a - $b       ; elementweise Subtraktion
```

**Skalare** Multiplikation und Division skalieren jedes Element:
```xc
$c = $a * 2        ; alle Elemente mit 2 multiplizieren
$c = $a / 2        ; alle Elemente durch 2 teilen
```

**Matrixmultiplikation** mit `*` wenn die Dimensionen kompatibel sind:
```xc
var $m : mat3x3
var $v : vec3
var $result : vec3
$result = $m * $v  ; 3x3-Matrix mal 3x1-Vektor = 3x1-Vektor
```

**Zusammengesetzte Zuweisungsoperatoren** funktionieren ebenfalls: `+=`, `-=`, `*=`, `/=`

### Trailing-Funktionen (vor Ort)

Diese modifizieren den Vektor oder die Matrix direkt und geben keinen Wert zurück.

| Funktion | Gilt für | Beschreibung |
|----------|----------|--------------|
| `.normalize()` | Vektoren | Auf Einheitslänge skalieren |
| `.cross($other)` | vec3 | Kreuzprodukt von sich und `$other` in sich speichern |
| `.transpose()` | quadratische Matrizen | Vor Ort transponieren |
| `.inverse()` | quadratische Matrizen | Vor Ort invertieren |
| `.identity()` | quadratische Matrizen | Auf Einheitsmatrix setzen |
| `.lerp($other, $t)` | Vektoren / Matrizen | In Richtung `$other` um Faktor `$t` interpolieren |

```xc
var $dir : vec3
$dir.x = 3
$dir.y = 4
$dir.normalize()   ; $dir ist jetzt ein Einheitsvektor
```

### Standardfunktionen (geben einen neuen Wert zurück)

Diese modifizieren ihre Argumente nicht. Funktionen, die eine einzelne Zahl zurückgeben, sind als *Skalar* gekennzeichnet.

| Funktion | Gibt zurück | Beschreibung |
|----------|-------------|--------------|
| `length($v)` | Skalar | Betrag eines Vektors |
| `distance($a, $b)` | Skalar | Euklidischer Abstand zwischen zwei Vektoren |
| `dot($a, $b)` | Skalar | Skalarprodukt zweier Vektoren |
| `angle($a, $b)` | Skalar | Winkel zwischen zwei Vektoren in Radiant |
| `cross($a, $b)` | vec3 | Kreuzprodukt zweier vec3-Vektoren |
| `determinant($m)` | Skalar | Determinante einer quadratischen Matrix |
| `normalize($v)` | gleicher Typ | Normalisierte Kopie eines Vektors |
| `transpose($m)` | gleicher Typ | Transponierte Kopie einer quadratischen Matrix |
| `inverse($m)` | gleicher Typ | Invertierte Kopie einer quadratischen Matrix |
| `lerp($a, $b, $t)` | gleicher Typ | Interpolierte Kopie zwischen `$a` und `$b` um Faktor `$t` |

### Übergabe an Funktionen

Vektoren und Matrizen können als Funktionsargument- und Rückgabetypen verwendet werden:
```xc
function @scale($v : vec3, $factor : number) : vec3
	return $v * $factor

var $result : vec3
$result = @scale($myVec, 2.5)
```

## Storage deklarieren
Storage wird verwendet, um einige Daten über Neustarts und sogar über eine Neukompilierung hinweg persistent zu halten.  
Wir können Storage-Variablen und -Arrays sowohl für number als auch text deklarieren.  
Storage sollte NUR im globalen Geltungsbereich deklariert werden.  
```xc
storage var $stuff:number
storage var $stuff:text
storage array $stuff:number
storage array $stuff:text
```

## Zugriff/Zuweisung des n-ten Elements in einem Array
Um den Wert eines bestimmten Elements in einem Array zuzugreifen oder zu ändern, müssen wir den Trail-Operator `.` verwenden, gefolgt vom 0-basierten Index des Elements oder einer Variable, die diesen Index enthält.  
`$stuff.0 = 5` Weist dem ersten Element des Arrays den Wert 5 zu  
`$stuff.$index = 5` Weist dem Element mit einem durch den Wert von $index definierten Index den Wert 5 zu  
`$value = $stuff.1` Weist den Wert des zweiten Elements des Arrays der Variable $value zu  

## Zugriff/Zuweisung des n-ten Zeichens in einer Textvariable
Textvariablen funktionieren sehr ähnlich wie Arrays. Wir können den Trail-Operator `.` verwenden, um auf bestimmte Zeichen innerhalb eines Texts zuzugreifen oder deren Wert zu ändern.  
`$myText.0 = "a"` Setzt "a" als erstes Zeichen von $myText  

### Key-Value-Objekte

XenonCode unterstützt einen eigenen Key-Value-Typ, der immer als Text gespeichert wird.  
Deklariere einfach eine Textvariable und weise Mitglieder über ihren Schlüssel als Trailing-Mitglied zu/lese sie aus.
```xc
var $myObject = ".a{5}.b{8}" ; you can use the serialization format like so, but you don't have to, you may simply start with an empty text and assign the members one by one
print($myObject.a) ; will print 5
$myObject.b += 2 ; adds 2 to b which was 8 and will now be 10
```

## Die Init-Funktion
Der Körper der Init-Funktion wird jedes Mal zuerst ausgeführt, wenn der virtuelle Computer eingeschaltet wird.  
Die Init-Funktion kann nicht vom Benutzer aufgerufen werden. Sie kann nur definiert werden, und das Gerät ruft sie automatisch beim virtuellen Start auf.  
```xc
init
    $stuff = 5
    @func1()
    ;...
```

## Tick-Funktion
Die Tick-Funktion wird am Anfang jedes Taktzyklus dieses virtuellen Computers ausgeführt.  
Die Tick-Funktion kann nicht vom Benutzer aufgerufen werden. Sie kann nur definiert werden, und das Gerät ruft sie automatisch bei jedem Zyklus auf.  
```xc
tick
    ; This body is executed once per clock cycle at the virtual computer's frequency
```

## Timer-Funktionen
Timer-Funktionen werden in einem bestimmten Intervall oder einer bestimmten Frequenz ausgeführt, aber höchstens einmal pro Taktzyklus.  
Wir können entweder ein `interval` (alle N Sekunden) oder eine `frequency` (N Mal pro Sekunde) angeben.  
Timer-Funktionen können nicht vom Benutzer aufgerufen werden. Sie können nur definiert werden, und das Gerät ruft sie automatisch zum entsprechenden Zeitpunkt auf.  
```xc
timer frequency 4
    ; stuff here runs 4 times per second
timer interval 2
    ; stuff here runs once every 2 seconds
```
Hinweis: Wenn die Taktgeschwindigkeit des virtuellen Computers langsamer als das angegebene Intervall oder die Frequenz ist, wird diese Timer-Funktion nicht korrekt im angegebenen Intervall oder der Frequenz laufen und kann stattdessen bei jedem Taktzyklus ausgeführt werden.  

## Input
Input-Einstiegspunkte sind eine Möglichkeit, auf Informationen zuzugreifen, die wir von einem anderen Gerät empfangen haben.  
Sie können beliebig oft pro Taktzyklus ausgeführt werden, abhängig davon, wie viele Daten seit dem letzten Taktzyklus empfangen wurden. Die Implementierung kann entscheiden, sie nur einmal pro Zyklus mit den zuletzt empfangenen Daten auszuführen.  
Geräte können eine Obergrenze im Empfangspuffer haben, die die maximale Anzahl definiert, wie oft die Input-Funktion pro Taktzyklus aufgerufen werden kann.  
Wenn diese Grenze erreicht wurde, werden nur die letzten N Werte im Puffer behalten.  
Input-Einstiegspunkte sind wie benutzerdefinierte Funktionen mit Argumenten, aber ohne Rückgabewert, und wir müssen einen Port-Index angeben.  
Der Port-Index muss nach dem input-Schlüsselwort und einem Trail-Operator `.` angegeben werden.  
Der Port-Index kann auch über eine Konstante angegeben werden (muss zur Compile-Zeit bekannt sein).  
Funktionsargumente müssen in Klammern stehen und ihre Typen müssen angegeben werden.  
Einstiegspunkte können nicht direkt vom Benutzer aufgerufen werden. Sie können nur definiert werden, dann ruft das Gerät sie automatisch auf, wenn Daten empfangen wurden, am Ende eines Taktzyklus.  
```xc
input.0 ($arg1:number, $arg2:text)
    $stuff = $arg1
input.$myPortIndex ($arg1:number, $arg2:text)
    $stuff = $arg1
```

## Output
Die Output-Funktion ist die Art, wie wir Daten an ein anderes Gerät senden. Diese Funktion soll als Anweisung aufgerufen werden und kann nicht im globalen Geltungsbereich wie die Input-Funktionen verwendet werden.  
Wir müssen auch den Port-Index übergeben, wie bei der Input-Funktion, und er kann ebenfalls über eine zur Compile-Zeit bekannte Konstante angegeben werden.  
Wir müssen eine Liste von Argumenten in Klammern übergeben (oder leere Klammern).  
`output.0 ($stuff, $moreStuff)`

## If Elseif Else
Wie bei den meisten Programmiersprachen können wir Bedingungen verwenden.  
```xc
if $stuff == 5
    ; then run this
elseif $stuff == 6
    ; then run that instead
else
    ; all previous conditions evaluate to false, then run this instead
```

## Foreach-Schleifen
Diese iterieren über alle Elemente eines Arrays.  
Der Codeblock unter dieser Schleifenanweisung wird für jedes Element im Array nacheinander ausgeführt.  
```xc
foreach $stuff ($index, $item)
    ; we loop through the array $stuff, and we define $index which contains the 0-based index of this item and $item for the current item's value
    ; note that $item is a copy of its value, so modifying the value of $item will not affect the original array $stuff
    ; if we want to persist the modified $item value into the original array, we can use $index to index the element from the array like so:
    $stuff.$index = $item
    ; CAUTION: $index is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Du kannst die foreach-Schleife auch mit Key-Value-Objekten verwenden
```xc
foreach $obj ($key, $value)
    print($key)
    print($value)
```

## Repeat-Schleifen
Diese Schleife wiederholt die Ausführung des folgenden Blocks eine bestimmte Anzahl von Malen.  
```xc
repeat 5 ($i)
    ; this block will be repeated 5 times, and $i is the 0-based index of this iteration (first time will be 0, last will be 4)
    ; CAUTION: $i is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Die Anzahl der Wiederholungen (oben als 5 angegeben) kann auch über eine Variable oder eine Konstante angegeben werden, aber nicht über einen Ausdruck.

## For-Schleifen
Diese Schleife ist ähnlich wie repeat, nimmt aber einen ersten und letzten Index anstelle einer Anzahl von Wiederholungen.
```xc
for 3,8 ($i)
	; $i will start at 3, and end with 8, inclusively, for a total of 6
```

## While-Schleifen
Diese Schleife führt den folgenden Block aus, solange die gegebene Bedingung als true ausgewertet wird.  
```xc
while $stuff < 5
    $stuff++
```

## Break
Dieses Schlüsselwort wird verwendet, um eine Schleife zu stoppen, als hätte sie alle Iterationen abgeschlossen.  
```xc
while $stuff < 5
    $stuff++
    if $stuff == 3
        break
```

## Continue
Dieses Schlüsselwort wird verwendet, um diese Iteration einer Schleife hier zu stoppen und die nächste Iteration sofort auszuführen.  
```xc
while $stuff < 5
    $stuff++
    if $stuff == 2
        continue
```

## Mathematische Operatoren
- `+` Addition
- `-` Subtraktion
- `*` Multiplikation
- `/` Division
- `%` Modulus
- `^` Potenz

## Trailing-Operatoren
- `++` Erhöht den Wert der Variable
- `--` Verringert den Wert der Variable
- `!!` Kehrt den Wert der Variable um (wenn der Wert `0` ist, wird er auf `1` gesetzt, andernfalls auf `0`)

## Zuweisungsoperatoren
- `=` Weist den folgenden Wert direkt zu

Die folgenden Operatoren berechnen die entsprechende mathematische Operation zwischen der führenden Variable und dem folgenden Ausdruck und weisen das Ergebnis der führenden Variable wieder zu.  
- `+=` Addition
- `-=` Subtraktion
- `*=` Multiplikation
- `/=` Division
- `%=` Modulus
- `^=` Potenz
- `&=` Text verketten

## Vergleichsoperatoren
- `==` Gleich
- `<>` oder `!=` Ungleich
- `>` Größer als
- `<` Kleiner als
- `<=` Kleiner oder gleich
- `>=` Größer oder gleich
- `&&` oder `and` Logisches UND
- `||` oder `or` Logisches ODER
- `xor` Ist ebenfalls verfügbar, äquivalent zu (!!a != !!b)

## Andere Operatoren
- `.` (Trail-Operator) Verweist auf ein Unterelement eines Arrays oder Texts oder ruft eine Trailing-Funktion auf der führenden Variable auf, oder ein Mitglied eines Objekts
- `:` (Typecast-Operator) Wandelt in einen anderen Typ um
- `&` (Verkettungsoperator) Verkettet Texte
- `!` (Nicht-Operator) Kehrt einen booleschen Wert oder Ausdruck um (Zahlen ungleich Null werden zu 0, und 0 wird zu 1)

## Casting (Variablen als anderen Typ interpretieren)

Um eine bestehende Variable als anderen Typ zu interpretieren, füge einfach einen Doppelpunkt und den Typ hinzu: 
```xc
$someTextValue = $someNumberValue:text
```
Dies funktioniert nur mit generischen Typen `number` und `text`, nicht mit Arrays oder Objekten.  

## Textverkettung

Um Texte zu verketten, trenne einfach alle Textwerte/Variablen mit dem Verkettungsoperator `&` in derselben Zuweisung (vergiss nicht, bei Bedarf in Text umzuwandeln).  
```xc
$someTextVar = "Hello, " & $someName & "!, My age is " & $age:text & " and I have all my teeth"
```

## Include
Du möchtest dein Projekt möglicherweise in mehrere Quelldateien aufteilen.  
Dazu kannst du Code in eine andere `.xc`-Datei auslagern und das `include`-Schlüsselwort in der übergeordneten Datei verwenden. 
```xc
include "test.xc"
```
Dies ist effektiv dasselbe wie alle Zeilen aus `test.xc` zu nehmen und sie an der Stelle des `include` in die aktuelle Datei einzufügen.  
Dies kann auf mehreren Ebenen geschehen; stelle nur sicher, dass eine Datei sich nicht selbst einschließt, direkt oder indirekt, da sonst die Definitionen darin in Konflikt geraten und zu einem Compile-Fehler führen.

# Benutzerdefinierte Funktionen

Funktionen definieren eine Gruppe von Operationen, die wir ein- oder mehrmals während der Programmausführung aufrufen können. 

Die in einer Funktion auszuführenden Operationen erscheinen in ihrem Körper. 

Funktionen können Argumente haben, die innerhalb des Körpers verwendet werden können, sodass die Operationen je nach Wert einiger Variablen variieren können. 

Funktionsargumente werden nach dem Funktionsnamen innerhalb von Klammern definiert und können vom Typ `number`, `text` oder einem implementierungsdefinierten Objekt sein. 

Funktionsnamen haben dieselben Regeln wie Variablennamen.  

HINWEIS: Funktionen MÜSSEN vollständig vor ihrer Verwendung definiert werden. Das bedeutet, dass die Reihenfolge der Funktionsdeklaration wichtig ist und wir nur eine Funktion aufrufen können, die ÜBER dem Aufrufer deklariert wurde, und eine Funktion kann sich NICHT selbst aufrufen. Dies erzwingt die "Keine-Stack-Rekursion"-Regel.  

### Deklaration

Hier sind einige Beispiele für Funktionsdeklarationen  

Diese Funktion nimmt ein einzelnes Zahlenargument:
```xc
function @func0 ($var1:number)
```

Diese Funktion nimmt zwei Zahlenargumente:
```xc
function @func1 ($var1:number, $var2:number)
```

Diese Funktion nimmt ein Zahlenargument und ein Textargument:
```xc
function @func2 ($var1:number, $var2:text)
```

Diese Funktion nimmt ein implementierungsdefiniertes Objekt vom Typ `position` als Argument:
```xc
function @func3 ($var1:position)
```

Diese Funktion nimmt ein Zahlenargument und ein Textargument und gibt einen Zahlenwert zurück:
```xc
function @func2 ($var1:number, $var2:text) : number
```

### Körper
Der Körper einer Funktion (die beim Aufruf auszuführenden Operationen) muss in den folgenden Zeilen nach der Deklaration stehen, eingerückt mit einem Tab.  
Leere Zeilen innerhalb eines Körpers sind erlaubt und werden vom Compiler ignoriert.  
Funktionskörper können eine `return`-Anweisung haben, optional gefolgt von einem Ausdruck, der verwendet wird, um einer führenden Variable in der Aufruferanweisung einen Wert zuzuweisen.  
Bei der Rückgabe eines Werts muss der Rückgabetyp am Ende der Argumente, nach der schließenden Klammer und einem Doppelpunkt, angegeben werden.  

```xc
function @func1 ($var1:number, $var2:number) : number
    return $var1 + $var2
```

### Aufruf

Der Aufruf einer Funktion führt die Operationen in ihrem Körper aus. 
Um eine Funktion aufzurufen, schreibe einfach den Namen der Funktion (beginnend mit `@` für benutzerdefinierte Funktionen), dann ihre Argumente innerhalb von Klammern, getrennt durch Kommas:  
```xc
@func1(4, 6)
```
Hier haben wir zwei Zahlenargumente übergeben, somit führt dieser Aufruf den Körper der obigen Deklaration aus.  
Es ist natürlich auch möglich, Variablen oder sogar komplexe Ausdrücke anstelle von einfachen Literalzahlen als Funktionsargumente zu verwenden.  

#### HINWEIS:
Ausgelassene Argumente sind zulässig.  
Ihr Wert nimmt zunächst den leeren Standard ("" oder 0) an und bleibt dann mit dem, was übergeben oder ihnen zugewiesen wurde, für die folgenden Aufrufe dieser Funktion bestehen.  
Das Ändern des Werts eines Arguments innerhalb dieser Funktion ist ebenfalls persistent für den nächsten Aufruf dieser Funktion, wenn dieses Argument ausgelassen wird. 
Wenn also ein Konzept eines Standardargumentwerts benötigt wird, können sie dem Argument im Körper dieser Funktion nach ihrer Verwendung zugewiesen werden.  
Dieses Konzept ausgelassener Argumente kann auch als ein Konzept ähnlich statischer lokaler Variablen in C++ gedacht werden.  

### Rückgabewert

Funktionen können einen Wert mit dem `return`-Schlüsselwort zurückgeben.  
Dieser zurückgegebene Wert kann einer Variable zugewiesen werden: 
```xc
$value = @func1(4, 6)
```

# Rekursive Funktionen
Eine rekursive Funktion ist eine Funktion, die sich selbst aufruft.
Um eine rekursive Funktion zu definieren, verwende `recursive function` und `recurse`, um die Funktion selbst aufzurufen.
```xc
recursive function @recursiveFunc($myVar:number)
    if $myVar < 15
        recurse($myVar++)
```
Dieses Beispiel einer rekursiven Funktion ruft sich selbst auf, solange der Wert von $myVar kleiner als 15 ist.
Rekursive Funktionen sind auf 16 rekursive Aufrufe begrenzt.

Hinweis: Das `recurse`-Schlüsselwort ist nur innerhalb rekursiver Funktionen verfügbar und wird verwendet, um die Funktion selbst aufzurufen. Die Argumentliste muss mit der Funktionsdefinition übereinstimmen.

# Trailing-Funktionen
Jede Funktion kann als Trailing-Funktion aufgerufen werden, auch benutzerdefinierte Funktionen.  
Sie funktionieren so, dass die führende Variable intern als erstes Argument an die Funktion übergeben wird und dann der Rückgabewert zugewiesen wird.  
Beim Aufruf einer Trailing-Funktion muss das erste Argument weggelassen werden, da es automatisch die führende Variable als erstes Argument intern sendet.  
Wenn die Funktionsdefinition keine Argumente hat, ist dies dennoch gültig; wir kümmern uns einfach nicht um den aktuellen Wert der führenden Variable, weisen ihr aber einen neuen Wert zu.  
Die Funktionsdefinition MUSS einen Rückgabetyp haben, der dem der führenden Variable entspricht, wenn es ein generischer Typ ist.  
Eine Trailing-Funktion kann auf implementierungsdefinierten Objekten aufgerufen werden; in diesem Fall muss das erste Argument von diesem Objekttyp sein, es gibt keinen Rückgabetyp in der Funktion und sie darf KEINEN Wert zurückgeben.  
Da wir Arrays nicht als Funktionsargumente übergeben können, können Arrays nur ihre eigenen speziell definierten Trailing-Funktionen verwenden.  
```xc
$myVariable.round()
```
```xc
$myVariable.@func1(6)
```
```xc
$myArray.clear()
```

# Eingebaute Funktionen

### Mathematik
Diese Funktionen sind in der Basissprache definiert und nehmen ein oder mehrere Argumente.  
Trailing-Mathematikfunktionen verwenden die führende Variable als erstes Argument und ändern diese Variable, indem sie ihr den Rückgabewert zuweisen.  
- `floor`(number)
- `ceil`(number)
- `round`(number)
- `sin`(number) in Radiant
- `cos`(number) in Radiant
- `tan`(number) in Radiant
- `asin`(number) in Radiant
- `acos`(number) in Radiant
- `atan`(number) oder (number, number) in Radiant
- `abs`(number)
- `fract`(number)
- `log`(number, base)
- `sqrt`(number)
- `sign`(number [, default])
- `pow`(number, exponent)
- `clamp`(number, minimum, maximum)
- `step`(edge1, edge2, number) oder (edge, number)
- `smoothstep`(edge1, edge2, number)
- `lerp`(a, b, number)
- `mod`(number, divisor) der Modulus-Operator
- `min`(number, number)
- `max`(number, number)
- `avg`(number, number)
- `add`(number, number)
- `sub`(number, number)
- `mul`(number, number)
- `div`(number, number)

### Textfunktionen
- `text`(inputTextWithFormatting, vars ...) Siehe den Abschnitt unten für weitere Details
- `substring`($myText, start, length) Gibt einen neuen String zurück
- `replace`($myText, searchText, replaceText [, count]) Gibt einen neuen String zurück, bei dem alle Vorkommen von `searchText` durch `replaceText` ersetzt wurden, oder bis zu `count` Vorkommen, falls angegeben
- `size`($myText) Gibt die Anzahl der Zeichen in $myText zurück
- `last`($myText) Gibt das letzte Zeichen in $myText zurück
- `lower`($myText) Gibt die Kleinbuchstaben-Version von $myText zurück
- `upper`($myText) Gibt die Großbuchstaben-Version von $myText zurück

#### Formatierung
Die `text`-Funktion nimmt ein Format als erstes Argument.  
Das Format ist im Grunde ein Text, der einschließende geschweifte Klammern enthalten kann, die durch den Wert einiger Variablen oder Ausdrücke ersetzt werden.  
Beispiel: 
```xc
$formattedText = text("My name is {} and I am {} years old.", $name, $age)
```
Leere geschweifte Klammern oben werden durch die entsprechenden Variablen in den folgenden Argumenten in derselben Reihenfolge ersetzt.  
Es ist auch möglich, Zahlenvariablen auf eine bestimmte Weise zu formatieren, indem Pseudo-Werte innerhalb der geschweiften Klammern angegeben werden:  
- `{}` Zeigt automatisch nur die notwendigen Ziffern basierend auf dem Wert an (z.B. `3` oder `123.456`)
- `{0}` Rundet auf den nächsten ganzzahligen Wert (z.B. `3` oder `123`)
- `{00}` Rundet auf den nächsten ganzzahligen Wert, zeigt aber mindestens zwei Ziffern an (z.B. `03` oder `123`)
- `{0e}` Zeigt den gerundeten ganzzahligen Wert in wissenschaftlicher Notation an (z.B. `3e+00` oder `1e+02`)
- `{0e.00}` Zeigt den Wert in wissenschaftlicher Notation mit zwei Nachkommastellen an (z.B. `3.00e+00` oder `1.23e+02`)
- `{0.0}` Rundet auf eine Nachkommastelle (z.B. `3.0` oder `123.5`)
- `{0000.00}` Zeigt mindestens 4 ganzzahlige Stellen an und rundet auf zwei Nachkommastellen (z.B. `0003.00` oder `0123.46`)

### Trailing-Funktionen für Arrays
Diese Funktionen MÜSSEN als Trailing-Funktionen aufgerufen werden und geben nichts zurück; stattdessen ändern sie das Array
- $myArray.`clear`() Leert ein Array
- $myArray.`sort`() Sortiert ein Array in aufsteigender Reihenfolge
- $myArray.`sortd`() Sortiert ein Array in absteigender Reihenfolge
- $myArray.`append`(value1, value2, ...) Hängt einen oder mehrere Werte ans Ende eines Arrays an
- $myArray.`pop`() Löscht den letzten Wert in einem Array und reduziert seine Größe um eins
- $myArray.`insert`(index, value) Fügt einen neuen Wert an einer bestimmten Position in ein Array ein und verschiebt alle folgenden Werte um eins
- $myArray.`erase`(index) Löscht ein Element aus einem Array an einem bestimmten Index und zieht alle folgenden Werte um eins nach vorn
- $myArray.`fill`(qty, value) Ändert die Größe und füllt ein Array mit einer gegebenen Größe und dem angegebenen Wert für alle Elemente (löscht alle zuvor im Array vorhandenen Werte)
- $myArray.`from`(other [, separator]) Setzt den Inhalt des Arrays auf ein anderes Array oder Text. Separator dient zum Aufteilen mit einem bestimmten String (nur gültig wenn other ein Text ist). Diese Funktion funktioniert auch umgekehrt, wenn sie auf einem Text mit einem Array und einem Separator ausgeführt wird.

### Trailing-Mitglieder für Arrays
Mit dem Trail-Operator `.` können wir auch bestimmte Informationen über bestimmte Variablentypen zurückgeben.  
- $myArray.`size` Gibt die Anzahl der Elemente in $myArray zurück
- $myArray.`min` Gibt den Minimalwert innerhalb eines Zahlen-Arrays zurück
- $myArray.`max` Gibt den Maximalwert innerhalb eines Zahlen-Arrays zurück
- $myArray.`avg` Gibt den Durchschnittswert innerhalb eines Zahlen-Arrays zurück
- $myArray.`med` Gibt den Medianwert innerhalb eines Zahlen-Arrays zurück
- $myArray.`sum` Gibt die Summe aller Werte innerhalb eines Zahlen-Arrays zurück
- $myArray.`last` Gibt den Wert des letzten Elements in einem Array zurück; ermöglicht auch die Änderung dieses Werts durch Zuweisung eines Ausdrucks

### Andere nützliche Hilfsfunktionen
- `contains`($myText, "str") Gibt 1 zurück, wenn $myText "str" enthält, andernfalls 0
- `find`($myText, "str") Gibt den Index des ersten Zeichens des ersten Vorkommens von "str" in $myText zurück, andernfalls -1 wenn nicht gefunden
Diese funktionieren auch mit Arrays.  
- `isnumeric`($myText) Gibt 1 zurück, wenn $myText eine Zahl ist, andernfalls 0

### Ternärer Operator
Der ternäre Operator ist ein verkürzter bedingter Ausdruck, der je nach Auswertung einer Bedingung einen Wert zurückgibt.
```xc
$myVar = if($cond, $valTrue, $valFalse)
```

### Gerätefunktionen
Eine Implementierung sollte anwendungsspezifische Gerätefunktionen definieren.  
Hier sind Beispiele grundlegender Gerätefunktionen, die definiert sein KÖNNEN oder auch NICHT:  
- `delta`() Gibt die Zeitdifferenz in Sekunden seit der letzten Ausführung dieser `delta`-Funktion zurück  
Gerätefunktionen, die keine Argumente benötigen, können ohne Klammern verwendet werden, wenn sie innerhalb eines Ausdrucks aufgerufen werden.  

# Compiler-Spezifikationen
Dieser Abschnitt ist für Spieleentwickler gedacht, die dies in ihrem Spiel verwenden möchten.  

XenonCode kommt mit einer eigenen Parser/Compiler/Interpreter-Bibliothek und einem sehr einfachen CLI-Tool.  

## Editor
Es wird empfohlen, dass der Code-Editor bei jedem Tastendruck den folgenden Parse auf der aktuellen Zeile ausführt: 
- Führende Sequenzen von Leerzeichen durch genau einen Tab mehr als die vorherige nicht-leere Zeile ersetzen, wenn sie weiter eingerückt beginnt
- Wörter beim Drücken der Leertaste automatisch vervollständigen, wenn das Wort kein bestehendes Symbol ist
    - Die minimalen verbleibenden Zeichen (gemeinsamer Nenner) der Symbole schreiben, die mit den geschriebenen Zeichen beginnen
        - Wenn dies das führende Wort ist: Nur mit Anweisungswörtern des globalen Geltungsbereichs automatisch vervollständigen
        - Wenn Tabs vorangestellt sind: Nur mit Anweisungswörtern des Funktionskörpers automatisch vervollständigen
        - Wenn das erste Zeichen im aktuellen Wort ein `$` ist: Mit einer Benutzervariable automatisch vervollständigen
        - Wenn das erste Zeichen im aktuellen Wort ein `@` ist: Mit einer Benutzerfunktion automatisch vervollständigen
        - Andernfalls: Mit einem der folgenden automatisch vervollständigen:
            - Aktuelle Funktions-/foreach-/repeat-Argumente
            - Eingebaute Funktionen
            - Operatoren

## Laufzeit

Beim Einschalten des virtuellen Computers:
- Den Körper der init()-Funktion ausführen  

Ein Taktzyklus, 'frequency' Mal pro Sekunde ausgeführt:
- Alle Input-Funktionen ausführen, die seit dem letzten Zyklus Daten empfangen haben (einmal pro Zyklus)
- Benutzerdefinierte Events / Einstiegspunkte ausführen
- Die Tick-Funktion ausführen
- Alle Timer-Funktionen sequenziell ausführen, wenn ihre Zeit fällig ist
- Für Elapsed-1/Frequency Sekunden schlafen

# XenonCode testen
Du möchtest vielleicht XenonCode testen oder deine Programmierfähigkeiten üben.  
Es gibt ein Online-Fiddle-Tool unter <a href="https://xenoncode.com/">XenonCode.com</a>  

Alternativ kannst du es direkt auf deinem Computer ausführen.  
Dazu hat XenonCode ein CLI mit einem `-run`-Befehl zum Testen einiger Skripte in der Konsole.  
Dieses Repository enthält das CLI-Tool unter `build/xenoncode`  
So kannst du XenonCode herunterladen und ausführen:
```shell
# Clone this github repository
git clone https://github.com/batcholi/XenonCode.git
cd XenonCode
# Compile & Run the XC program located in test/
build/xenoncode -compile test -run test
```
Du kannst die .xc-Quelldateien in `test/` bearbeiten und dann die letzte Zeile erneut ausführen, um zu kompilieren und auszuführen.  
Das Verzeichnis `test/storage/` wird erstellt und enthält die Storage-Daten (Variablen mit dem `storage`-Präfix).  
Beachte, dass dieser `-run`-Befehl dafür gedacht ist, die Sprache schnell zu testen, und nur die `init`-Funktion ausführt.  
Stelle außerdem sicher, dass dein Editor so konfiguriert ist, dass er Tabs und keine Leerzeichen verwendet, um die Einrückung korrekt zu parsen.  

Wenn du XenonCode in dein C++-Projekt integrieren möchtest, kannst du `XenonCode.hpp` einbinden.  
Weitere Dokumentation wird demnächst verfügbar sein; in der Zwischenzeit kannst du `main.cpp` als Beispiel verwenden, aber die Verwendung kann sich noch ändern.  
