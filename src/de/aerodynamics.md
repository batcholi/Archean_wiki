# Aerodynamik

Archean simuliert realistische, flugsimulationswürdige aerodynamische Kräfte auf jedes Fahrzeug, das sich durch ein Fluid bewegt -- Luft oder Wasser. Die Engine erzeugt **Auftrieb**, **Luftwiderstand**, **Stabilität**, **Steuerwirksamkeit**, **Schwimmkraft** und sogar **Wiedereintrittserhitzung**, und das alles aus der tatsächlichen **Form** deiner Konstruktion. Es gibt keine speziellen „Tragflächen-Blöcke" und keine versteckten Werte: Wenn es wie eine Tragfläche aussieht und wie eine Tragfläche platziert ist, fliegt es auch wie eine Tragfläche.

## Funktionsweise

### Das Formfeld (Querschnittsmodell)

Wenn du die Bearbeitung einer Konstruktion abschließt, erstellt die Engine eine **Momentaufnahme ihrer äußeren Form**, indem sie sie aus den sechs Achsenrichtungen abtastet (wie eine Cubemap) und das Ergebnis in eine Reihe kleiner Oberflächenflicken umwandelt. Jeder Flicken kennt seine Position, die Richtung, in die er zeigt, seine Fläche und -- entscheidend -- **wie tief der Körper dahinter ist** (seinen Querschnitt).

Diese Momentaufnahme wird **zwischengespeichert** und nur dann neu erstellt, wenn sich die Konstruktion ändert (du fügst Blöcke hinzu oder entfernst sie, eine Steuerfläche bewegt sich oder die Konstruktion nimmt Schaden). Die Flugphysik pro Frame liest lediglich die zwischengespeicherten Flicken aus, sodass der Aufwand **begrenzt bleibt, ganz gleich wie komplex dein Fahrzeug ist** -- ein 300 Meter langes Verkehrsflugzeug mit Hunderten von Kollidern ist genauso günstig zu fliegen wie ein kleines Jagdflugzeug. Die Abtastauflösung skaliert automatisch mit der Größe des Fahrzeugs.

Daraus folgen drei Versprechen — und die Engine hält sie **exakt** ein, nicht näherungsweise:

- **Wie du eine Form baust, ändert nie, wie sie fliegt — nur die endgültige Form zählt.** Eine 10 × 10 × 1 große Tragfläche aus einem großen Block oder aus hundert kleinen liefert ein **bit-für-bit identisches** Ergebnis: dieselben Kräfte und dieselben Momente, bis zur letzten Stelle. Unterteilung, Blockanzahl und wie die Geometrie aufgeteilt oder zusammengeführt wird, sind für die Strömung völlig unsichtbar — nur die äußere Silhouette und der Querschnitt zählen.
- **Luft und Wasser sind dieselbe Physik — es gibt keinen separaten „Wasserpfad".** Das Modell tastet die **Fluiddichte an jeder Oberfläche** ab und setzt sie in *dieselben* Auftriebs- und Widerstandsgleichungen ein. Luft, Wasserlinie und tiefes Wasser sind nur Punkte auf einer einzigen, durchgehenden Dichteskala, sodass eine Tragfläche beim Eintauchen fließend zum Hydrofoil wird — nichts schaltet um.
- **Das Material ist für den Flug unsichtbar.** Stahl, Aluminium, Composite — eine flache Platte ist eine flache Platte. **Das Material beeinflusst nur Masse und Schwimmkraft, niemals Auftrieb oder Widerstand** — es verändert die *Balance* des Flugzeugs, nicht sein *Flugverhalten*.

> Nur die **äußere Schale** wird abgetastet. Innere Blöcke sind dem Luftstrom niemals ausgesetzt, sodass sie **null** aerodynamischen Widerstand oder Aufwand hinzufügen -- und da das Modell die **massive Dicke** hinter einer Oberfläche ausliest (ein abgeschlossener Hohlraum gilt als massiver Körper), fliegt eine **hohle Form genauso wie ihre massive Version**. Fülle deine Innenräume frei aus oder höhle sie aus; es ändert niemals, wie das Fahrzeug fliegt.

### Auftrieb

Eine Oberfläche erzeugt **Auftrieb** (wirkt wie eine Tragfläche), wenn ihr **Querschnitt dünn ist** -- die **massive** Tiefe von vorn nach hinten an dieser Oberfläche ist im Vergleich zur Größe des Fahrzeugs gering. Eine Tragfläche ist von oben nach unten dünn, aber breit in Spannweite und Flügeltiefe, also erzeugt sie Auftrieb. Ein Rumpf ist in jeder Richtung tief, also erzeugt er nur Widerstand.

- Der Auftrieb folgt einer **realistischen Auftriebskurve**: Er steigt mit dem Anstellwinkel an, gerät dann jenseits von etwa **15°** in den **Strömungsabriss**, woraufhin der Auftrieb abfällt und der Widerstand stark ansteigt -- genau wie bei einem echten Tragflächenprofil.
- Der Auftrieb ist **zweiseitig**: Eine Tragfläche, die auf beiden Seiten der Luft ausgesetzt ist, erzeugt vollen Auftrieb; eine Tragfläche, deren Unterseite am Rumpf vergraben ist, erzeugt weiterhin Auftrieb, jedoch mit verringerter Stärke.
- **Getrennte Oberflächen erzeugen jeweils für sich Auftrieb.** Ein Doppelleitwerk, übereinander gestapelte (Doppeldecker-)Tragflächen oder eine Flosse, die hinter einer anderen entlang derselben Achse ausgerichtet ist, werden als die eigenständigen dünnen Oberflächen erkannt, die sie sind -- der Luftspalt zwischen ihnen wird *nicht* als massiver Körper gezählt, sodass jede einzelne von ihnen funktioniert.
- Der Auftrieb wird **am Ort jeder Oberfläche** berechnet, sodass er auf natürliche Weise die richtigen **Nick-, Roll- und Giermomente** um deinen Massenmittelpunkt erzeugt.

> **Um eine Tragfläche zu bauen, mache sie geometrisch dünn.** Eine breite, flache Grundfläche von nur ein oder zwei Blöcken Dicke erzeugt Auftrieb. Eine klobige, tiefe Tragfläche erzeugt überwiegend Widerstand. Wie sie unterteilt ist oder woraus sie besteht, spielt keine Rolle -- nur der Querschnitt zählt.

### Luftwiderstand

Luftwiderstand entsteht aus mehreren physikalischen Quellen, die automatisch kombiniert werden:

| Quelle | Was es ist |
|--------|-----------|
| **Form- (Druck-)Widerstand** | Der Druck der Luft auf Oberflächen, die der Strömung zugewandt sind. Wächst mit dem **Quadrat der Geschwindigkeit**. |
| **Oberflächenreibung** | Das Reiben der Luft entlang von Oberflächen parallel zur Strömung (auf Basis der Reynolds-Zahl). Dominant bei großen, langsamen Körpern. |
| **Induzierter Widerstand** | Der unvermeidliche Widerstand, der *mit* dem Auftrieb einhergeht -- mehr Auftrieb bedeutet mehr induzierten Widerstand. |

Das wichtige neue Verhalten ist die **schlankheitsbasierte Stromlinienformung**. Die Engine misst, wie **schlank** jede Oberfläche ist -- wie weit sich der Körper *entlang* der Strömung erstreckt im Vergleich dazu, wie dünn er *quer* dazu ist:

- Eine **schlanke** Form (eine spitze Nase, die scharfe Vorderkante einer Tragfläche, ein langer dünner Rumpf, der sich vorwärts bewegt) hält den Luftstrom anliegend und hat **sehr geringen** Formwiderstand.
- Eine **stumpfe** Form (ein Würfel, eine flache Platte, die wie eine Luftbremse breitseits gehalten wird, eine stumpfe Nase) hat **vollen** Formwiderstand.

Das ist rein geometrisch -- es liest den tatsächlichen Querschnitt deiner Konstruktion aus, sodass es sich wirklich auszahlt, deine Nase und Kanten stromlinienförmig zu gestalten.

> Verwende Schrägen, Ecken und Fasen, um Nasen sowie Vorder- und Hinterkanten zu verjüngen. Eine stromlinienförmige Form kann **ein Zehntel** des Formwiderstands einer stumpfen Form bei gleicher Stirnfläche haben.

### Kompressibilität (hohe Geschwindigkeit)

Das Modell ist bereichsbewusst. Wenn du dich der **Schallgeschwindigkeit** näherst und sie überschreitest (welche von der Lufttemperatur abhängt), steigt der Druck auf nach vorn gerichtete Oberflächen über den transsonischen und Überschallbereich an, und der **Tragflächenauftrieb verschwindet bei Überschall** (du verlässt dich stärker auf den Rumpfauftrieb und den Ausschlag der Steuerflächen). Das lässt den Flug bei hoher Mach-Zahl deutlich schwerfälliger und weniger reaktionsfreudig wirken, wie es sein sollte.

### Stabilität -- emergent, nicht skriptgesteuert

Es gibt **keine künstliche „halte es nach vorn gerichtet"-Dämpfung**. Stabilität ist ein echtes, emergentes Ergebnis davon, wo deine Oberflächen liegen:

- Ein **Höhenleitwerk**, das hinter dem Massenmittelpunkt angebracht ist, trifft den Luftstrom in einem Winkel, sobald die Nase nach oben oder unten nickt, und erzeugt eine **Rückstellkraft**, die die Nase zurückdrückt. Das ist automatische **Nickstabilität**.
- Ein **Seitenleitwerk** (Heckflosse) tut dasselbe für das **Gieren**, sobald das Fahrzeug seitlich rutscht.
- **Rotationsdämpfung** (Widerstand gegen Taumeln) entsteht ebenfalls auf natürliche Weise -- Oberflächen weit entfernt vom Massenmittelpunkt bewegen sich schnell durch die Luft, wenn sich das Fahrzeug dreht, und die daraus resultierenden Kräfte wirken der Drehung entgegen.

Da es sich um echte Physik handelt, **hängt die statische Stabilität von deinem Massenmittelpunkt ab**. Ein Flugzeug ist stabil, wenn sein **Massenmittelpunkt am oder leicht vor dem Auftriebszentrum der Tragfläche** liegt, und instabil, wenn die Masse zu weit hinten liegt -- genau wie bei einem echten Flugzeug (und einem echten RC-Modell). Siehe [Gut fliegen](#flying-well) weiter unten.

> Die alte künstliche Winkelstabilisierung bei hoher Geschwindigkeit ist für Konstruktionen, die dieses Modell verwenden, **verschwunden**. Wenn sich dein Flugzeug nervös anfühlt oder sich nicht beruhigt, ist es ein **Balance**-Problem und nicht die Engine, die gegen dich arbeitet -- verlagere Masse nach vorn oder füge Leitwerksfläche hinzu.

### Steuerflächen & Steuerwirksamkeit

Steuerflächen ([Ailerons](components/miscellaneous/Aileron.md), die als Querruder, Höhenruder oder Seitenruder verwendet werden) sind an Scharnieren angebracht und **schlagen in Echtzeit aus**. Die Engine berechnet die Aerodynamik einer ausgeschlagenen Oberfläche **in jedem Frame bei ihrem aktuellen Winkel** neu, sodass:

- Ein ausgeschlagenes Höhenruder sofort den Luftstrom über dem Leitwerk verändert und das Flugzeug nicken lässt.
- Die Steuerwirksamkeit mit der **Fläche** der Oberfläche, ihrer **Entfernung vom Massenmittelpunkt** (Hebelarm) und **Luftdichte × Geschwindigkeit²** skaliert.

> **Für starke Steuerung:** Mache Steuerflächen **groß** und bringe sie **weit entfernt vom Massenmittelpunkt** an. Ein Höhenruder ganz am Heck hat weit mehr Nickwirksamkeit als eines in der Nähe der Tragfläche. Schnellere, dichtere Luft gibt mehr Wirksamkeit -- bei niedriger Geschwindigkeit und großer Höhe werden die Steuerflächen weich.

### Schadensbewusste Aerodynamik

Kampfschäden verändern, wie eine Oberfläche fliegt. Während eine Platte verformt oder durchlöchert wird (und zunehmend, während sie zerstört wird):

- Sie **verliert Auftrieb** -- eine zerstörte Tragfläche hört auf zu fliegen.
- Sie **verliert Stromlinienformung und Druckrückgewinnung** und erzeugt **mehr Widerstand** (sie wirft eine turbulente Nachlaufströmung ab).

Da Auftrieb und Luftwiderstand pro Oberfläche berechnet werden, hat **asymmetrischer Schaden** die richtige Wirkung: Eine auf einer Seite zerschossene Tragfläche lässt das Flugzeug sowohl **rollen** (Auftriebsverlust auf dieser Seite) als auch **gieren** (zusätzlicher Widerstand auf dieser Seite). Symmetrische, redundante Konstruktionen überstehen den Kampf besser.

### Schwimmkraft

Schwimmkraft ist die nach oben gerichtete Kraft auf eingetauchte Blöcke, die pro Kollider aus dem Volumen des von jedem Block verdrängten Fluids berechnet wird.

**F<sub>Schwimmkraft</sub> = V<sub>verdrängt</sub> × ρ<sub>Fluid</sub> × g**

- Das verdrängte Volumen jedes Blocks = sein Volumen × das **Volumenverdrängungsverhältnis** seines Materials (siehe [Materialien](#materials)).
- Beschädigte Blöcke verlieren fast ihre gesamte Schwimmkraft.
- Schwimmkraft wird dort angewandt, wo sich die Blöcke tatsächlich befinden, sodass ungleichmäßiges Eintauchen das Schiff kippen lässt -- ein selbstaufrichtender Effekt bei gut geformten Rümpfen.

### Wasser

Wasser ist **kein Sonderfall**. Das Modell tastet die **Fluiddichte an jeder Oberfläche** ab — Luft oberhalb der Wasserlinie, Wasser darunter, mit fließendem Übergang — sodass *dasselbe* Auftriebs- und Widerstandsmodell unter Wasser einfach viel größere Kräfte erzeugt, wo das Fluid **~800× dichter** ist als Luft. Nichts ist fest darauf verdrahtet, „im Wasser zu sein":

- Ein Flügel wird zum **Hydrofoil** (Unterwasser-Tragfläche): Er erzeugt unter Wasser Auftrieb und Widerstand genau wie in der Luft, nur weitaus stärker. **Steuerflächen funktionieren unter Wasser weiter**, sodass ein U-Boot mit denselben Rudern und Querrudern gesteuert wird wie ein Flugzeug.
- **Der Widerstand ist enorm** und wächst mit dem Quadrat der Geschwindigkeit, sodass ein ins Wasser eintretender Körper stark abgebremst und ein schwimmfähiger Rumpf auf natürliche Weise zurückgehalten wird, statt aus dem Wasser zu schießen — ganz ohne künstliche Dämpfung.
- **Die Rotationsdämpfung** stammt direkt aus demselben Modell: Oberflächen weit vom Massenschwerpunkt bewegen sich schnell durch das dichte Fluid, wenn das Fahrzeug dreht oder taumelt, sodass sich Boote und U-Boote auf natürliche Weise stabilisieren.

> Da die Kräfte mit der Dichte wachsen, ist **ein Aufprall auf das Wasser bei hoher Geschwindigkeit ein echter Einschlag**. Ein schneller Bauchklatscher belastet die gesamte Kontaktfläche weit über das hinaus, was die Struktur aushält, und **staucht oder zerstört** sie — genau wie ein Aufprall auf festen Boden. Tauche daher flach und mit zuvor reduzierter Geschwindigkeit ein.

### Wiedereintrittserhitzung

Schnelle Bewegung durch die Luft erhitzt nach vorn gerichtete Oberflächen in Richtung der **Staupunkttemperatur (Recovery-Temperatur)**, die mit dem Quadrat der Geschwindigkeit ansteigt. Sie ist bei Überschallgeschwindigkeit sanft, aber **explosiv bei Wiedereintrittsgeschwindigkeiten**, und jedes Material verbrennt jenseits seiner eigenen thermischen Grenze -- daher sind ein Hitzeschild, ein steiler, aber überlebbarer Wiedereintrittswinkel und das Abbauen der Geschwindigkeit in großer Höhe allesamt von Bedeutung.

## Blöcke und Materialien

### Materialien

Die Materialwahl beeinflusst **Masse** und **Schwimmkraft** -- und damit die **Balance** -- aber **nicht Auftrieb oder Luftwiderstand**:

| Material | Masse (pro Blockeinheit) | Volumenverdrängung (Schwimmkraft) |
|----------|----------------------|--------------------------------|
| **Composite** | 0,25 | 0,20 × Belegung |
| **Concrete** | 10,0 | 0,25 × Belegung |
| **Steel** | 1,0 | 0,01 × Belegung |
| **Aluminium** | 0,5 | 0,01 × Belegung |
| **Glass** | 1,0 | 0,02 × Belegung |
| **Lead** | 150,0 | 1,00 × Belegung |
| **Titanium** | 0,6 | 0,01 × Belegung |

- **Lead** ist dicht und vollständig verdrängend -- ideal als **Nasenballast**, um deinen Massenmittelpunkt nach vorn zu verlagern (oder als Kielgewicht in einem Boot), aber es sinkt.
- **Composite** ist leicht mit moderater Verdrängung -- der beste Allzweck-Schwimmer.
- **Steel/Aluminium/Titanium** verdrängen kaum Fluid -- stabil und leicht, tragen aber fast keine Schwimmkraft bei.

> Da das Material die Aerodynamik nicht verändert, wählst du Materialien nach **Festigkeit, Gewicht, Hitzebeständigkeit und Balance** -- nicht nach Flugleistung.

### Blockformen

Schrägen, Ecken und Pyramiden nehmen einen halben Würfel ein und sind leichter. Aerodynamisch sind sie von Bedeutung, weil sie es dir ermöglichen, Oberflächen zu **verjüngen** -- eine stumpfe, widerstandsstarke Fläche in eine schlanke, stromlinienförmige zu verwandeln. Verwende sie an Nasen und Tragflächenkanten.

### Frame Beams

Frame Beams (die Strukturbalken an den Kanten von Rahmen) sind **aerodynamisch unsichtbar** -- kein Auftrieb, kein Widerstand, keine Schwimmkraft. Verwende sie frei für die innere Struktur.

## Aerodynamische Komponenten

### Aileron

Das [Aileron](components/miscellaneous/Aileron.md) ist eine an einem Scharnier angebrachte Steuerfläche, die als Querruder, Höhenruder oder Seitenruder verwendet wird. Der Eingang ist ein Wert von `-1.0` bis `+1.0` (Drehung −45° bis +45°) über seinen Datenanschluss.

- Es berechnet seine **eigene** Steuerkraft und ist **vom Haupt-Formfeld ausgeschlossen**, sodass es niemals doppelt gezählt wird und stets volle Wirksamkeit liefert, selbst wenn es von Struktur umgeben ist.
- Du kannst den festen Teil einer Tragfläche oder eines Leitwerks aus Blöcken bauen (die das Feld behandelt) und **Ailerons an der Hinterkante** zur Steuerung anbringen.

### Propeller

Der [Propeller](components/propulsion/Propeller.md) erzeugt Schub in Luft oder Wasser und ist vom Formfeld ausgeschlossen (er hat sein eigenes Modell). Wichtige Verhaltensweisen: Der Schub skaliert mit Fluiddichte und Scheibenfläche; der **Bodeneffekt** erhöht den Schub um bis zu **+50%** nahe am Terrain; rotierende Blätter erzeugen **gyroskopischen** Widerstand gegen Neuausrichtung; der Schub ist auf **100.000 N** begrenzt.

### Thruster & RCS

Chemische [Thruster](components/propulsion/thruster/SmallThruster.md) werden nicht von der Aerodynamik beeinflusst und funktionieren in Atmosphäre und Vakuum gleich. [RCS](components/propulsion/RCS.md)-Triebwerke verlieren in dichten Fluiden nahezu ihre gesamte Wirksamkeit (Abschwächung ≈ e<sup>−ρ×4</sup>) -- sie sind für den Weltraum gedacht.

## Gut fliegen

### Tragflächen bauen

- Mache die Tragfläche **geometrisch dünn** -- eine breite, flache Grundfläche von ein oder zwei Blöcken Dicke. Dünnerer Querschnitt = saubererer Auftrieb.
- Gib ihr **Spannweite und Flügeltiefe**; eine lange, breite Tragfläche erzeugt mehr Auftrieb und gerät sanfter in den Strömungsabriss.
- **Material und Blockanzahl spielen keine Rolle** für den Auftrieb -- baue auf Festigkeit und Gewicht.
- Verjünge die **Vorder- und Hinterkanten** mit Schrägen, um den Widerstand zu senken.

### Auf stabilen Flug auswuchten

Das ist das mit Abstand Wichtigste für ein Flugzeug, das gut fliegt:

- Halte den **Massenmittelpunkt am oder leicht vor den Tragflächen**. Füge dichte Masse (z. B. **Lead** oder schwere Komponenten) in Richtung der **Nase** hinzu, um ihn nach vorn zu ziehen -- echte Flugzeuge tragen ihren Motor genau aus diesem Grund vorn.
- Ein **hecklastiges** Flugzeug (Masse zu weit hinten) ist instabil: Es nickt und giert divergent und ist anstrengend zu fliegen.
- Bringe **Höhenleitwerke** deutlich hinter dem Massenmittelpunkt an, um Nickstabilität zu erreichen, und eine **Seitenflosse** für Gierstabilität. Mehr Leitwerksfläche und ein längerer Leitwerksträger = mehr Stabilität.
- Wenn sich eine Konstruktion nicht beruhigen will, **verlagere Masse nach vorn** oder **füge Leitwerksfläche hinzu**, bevor du die Steuerung verantwortlich machst.

### Steuerwirksamkeit

- Größere Steuerflächen, die **weiter entfernt vom Massenmittelpunkt** angebracht sind, geben mehr Wirksamkeit.
- Bringe **Höhenruder am äußersten Heck** für das Nicken an, **Seitenruder an der Flosse** für das Gieren, **Querruder an den Tragflächenenden** für das Rollen.
- Die Wirksamkeit sinkt bei **niedriger Geschwindigkeit** und in **großer Höhe** (dünne Luft) -- halte im Anflug die Geschwindigkeit hoch.

### Widerstand reduzieren

- **Gestalte** Nasen und Kanten mit Schrägen **stromlinienförmig** -- schlanke Formen haben dramatisch weniger Widerstand.
- Halte das Fahrzeug **kompakt**; ausgebreitete Strukturen bieten mehr Stirnfläche.
- **Innere Blöcke sind kostenlos** -- nur die äußere Schale wird abgetastet, sodass die innere Anordnung niemals Widerstand hinzufügt.

### Wasserfahrzeuge

- Verwende **Composite** für den Rumpf (bestes Schwimmkraft-zu-Gewicht-Verhältnis); verwende **Lead tief im Kiel** für Stabilität.
- **Breite, flache Rümpfe** sind am stabilsten -- die Wasserdämpfung erledigt den Rest.
- **Steel/Aluminium** schwimmen kaum; verwende sie oberhalb der Wasserlinie.

### Den Kampf überstehen

- **Symmetrie und Redundanz:** Asymmetrischer Tragflächenschaden lässt dich *sowohl* rollen *als auch* gieren, also dupliziere kritische Auftriebs- und Steuerflächen auf beiden Seiten.
- Rechne damit, dass eine beschädigte Tragfläche **Auftrieb verliert und mehr Widerstand erzeugt** -- halte Geschwindigkeit und Höhe in Reserve.

### Leistung

Das Formfeld wird zwischengespeichert und nur dann neu erstellt, wenn sich die Konstruktion ändert oder Schaden nimmt, und sein Aufwand ist unabhängig von Größe oder Blockanzahl begrenzt. Du zahlst niemals einen Aufpreis pro Frame für Details oder innere Füllung -- also baue so groß und so detailliert, wie du möchtest.
