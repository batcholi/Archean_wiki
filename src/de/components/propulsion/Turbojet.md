<p align="center">
  <img src="Turbojet.png" />
</p>

|Component|`Turbojet`|
|---|---|
|**Module**|`ARCHEAN_combustion`|
|**Mass**|1000 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|400 x 100 x 100 cm|
|**Push/Pull Fluid**|Accept Push|
#
---

# Description
Der Turbojet ist ein Strahltriebwerk, das Schub erzeugt, indem es flüssigen Kraftstoff mit Umgebungsluft verbrennt.
Er liefert bis zu **60 kN** Schub auf Meereshöhe aus einem Durchfluss von 1,4 kg/s Dodecan (C12H26).

# Usage

## Aufbau
Das Triebwerk benötigt:
- Eine Pumpe, die Kraftstoff in seinen Fluid-Port drückt (es zieht nicht selbst aus einem Tank).
- Eine Hochspannungsversorgung, die beim Start **125 kW** liefern kann.
- Drei Datenkanäle: Anlasser, Zünder und Kraftstoffventil.

Es hat keine interne Regelung: Das Kraftstoffventil ist unmittelbar die Schubsteuerung.

## Start
1. Anlasser auf 1: Die Welle läuft auf etwa 24 % N1 hoch. Der Anlasser zieht 125 kW, solange er läuft.
2. Zünder auf 1 (400 Watt) und Ventil mäßig geöffnet: Die Verbrennung beginnt, sobald Kraftstoff in die Brennkammer gelangt.
3. Läuft das Triebwerk, können Anlasser und Zünder abgeschaltet werden: Die Flamme allein hält die Welle in Drehung.

Ohne Funken eingespritzter Kraftstoff sammelt sich in der Kammer und entzündet sich beim ersten Funken auf einmal.

> Das Inspektionspanel zeigt den Zustand der drei Steuerungen und den Grund, warum das Triebwerk nicht läuft (Anlasser ohne Strom, Ventil geschlossen, kein Kraftstoff, kein Funke, kein Sauerstoff).

## Betrieb
Der Nennschub wird bei etwa 77 % des Ventils erreicht; ganz geöffnet lässt es 30 % mehr als den Nenndurchfluss durch und die Gastemperatur überschreitet die Schaufelgrenze.

Die Flamme hält nur in einem Gemischbereich:
- Ein abruptes Öffnen des Ventils macht das Gemisch zu fett: Der Verdichter pumpt (`Surge`) eine Sekunde lang und das Triebwerk nimmt Schaden.
- Ein fast vollständiges Schließen über 45 % N1 macht das Gemisch zu mager: Die Flamme erlischt.

Nach einem Flammabriss zünden die Zünder die Flamme erst wieder, wenn die Welle unter 55 % N1 gefallen ist. Eine noch heiße Kammer (über 750 K) entzündet den Kraftstoff von selbst, ohne Zünder.

Ventil auf 0: Die Flamme erlischt und die Welle braucht etwa zwei Minuten bis zum Stillstand.

Der Schub nimmt mit der Höhe ab. Im Flug verdichtet die Geschwindigkeit die Luft am Einlass, verringert aber den Schub bei gleicher Leistung.

## Grenzen
- Gastemperatur (EGT) über **1250 K**: schneller Schaufelverschleiß.
- N1 über **105 %**: schnelle Zerstörung des Rotors.
- Wasseraufnahme über 30 % N1: Die Schaufeln brechen.
- Verunreinigter Kraftstoff (Wasser, schwere Kohlenwasserstoffe) über 5 %: Verschleiß. Rohöl verschleißt das Triebwerk.

## Zustände
|Zustand|Bedeutung|
|---|---|
|Off|Triebwerk gestoppt.|
|Cranking|Der Anlasser treibt die Welle an.|
|Running|Verbrennung läuft.|
|Surge|Verdichterpumpen, Gemisch zu fett.|
|Destroyed|Triebwerk zerstört.|

### List of inputs
|Channel|Function|Range|
|---|---|---|
|0|Starter|0 or 1|
|1|Igniters|0 or 1|
|2|Throttle|0.0 to 1.0|

### List of outputs
|Channel|Function|Value|
|---|---|---|
|0|N1|%|
|1|Thrust|Newtons|
|2|EGT|Kelvin|
|3|Running|0 or 1|
|4|Burned fuel flow|kg/s|
|5|Unburned fuel flow|kg/s|
|6|State|"Off", "Cranking", "Running", "Surge", "Destroyed"|
