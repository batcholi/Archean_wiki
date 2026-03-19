<p align="center">
  <img src="Computer.png" />
</p>

|Component|`Computer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|10 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|100 x 100 x 50 cm|
#
---
> Um zu erfahren, wie die Programmieroberfläche des Computers verwendet wird, besuchen Sie die Seite XenonCode IDE.

# Description

Der Computer ist eine Komponente, die dafür konzipiert ist, XenonCode-Programme auszuführen, um andere Komponenten zu steuern oder verschiedene Informationen auf seinem Bildschirm anzuzeigen.

Er verfügt über Eigenschaften, die seine Leistung, seinen Speicherplatz und seinen Arbeitsspeicher bestimmen.
Diese Informationen sind im BIOS sichtbar, wie im folgenden Bild gezeigt.

![Bios](bios.png)

### BIOS-Informationen:
- **Processor Type**: Der XPU64-AIO-Prozessor bezieht sich auf diesen All-In-One-Computerkomponententyp.
- **Frequency**: Die Frequenz ist die Geschwindigkeit, mit der der Computer den Code des aktuellen Programms ausführt, und entspricht der `updates_per_second`-Einstellung des Servers (standardmäßig 25 Ticks pro Sekunde).
- **Max IPC**: Dieser Parameter wird durch eine Konfigurationsdatei bestimmt und ist die maximale Anzahl von Anweisungen pro Zyklus, bevor er virtuell "abstürzt".
- **System RAM**: In XenonCode-Programmen können Werte in flüchtigen Variablen gespeichert werden, die beim Neustart des Computers oder beim Neuladen eines Programms zurückgesetzt werden. Dieser Parameter gibt die maximale Anzahl von Werten für alle Variablen des aktuell laufenden Programms an.
- **Storage Capacity**: Ähnlich wie beim System RAM gibt es einen Speichervariablentyp, der Daten dauerhaft auf der Festplatte speichert, bis sie geändert werden. In diesem Fall ist er auf maximal 256 Werte begrenzt.
- **I/O Ports**: Dieser Parameter wird durch die Komponenten bestimmt und gibt einfach die Anzahl der Datenanschlüsse am Computer an.

> Das BIOS ist ein Programm, das standardmäßig auf jedem Computer beim Hochfahren ausgeführt wird.
>
> In diesem Fall besteht seine Aufgabe darin, die Eigenschaften des Computers sowie die Liste der auf der Festplatte verfügbaren Programme anzuzeigen, damit Sie eines zur Ausführung auswählen können.
>
> Es ist möglich, das BIOS anzupassen, indem eine neue Datei namens "main.xc" erstellt wird, um sein Erscheinungsbild zu ändern oder automatisch ein Programm zu laden. Weitere Informationen finden Sie in der XenonCode IDE-Dokumentation.

# Usage
### Programm:
Wenn ein Programm erstellt und gespeichert wurde, erscheint es in der Programmliste des BIOS. Sie können das auszuführende Programm mit der `F`-Taste auswählen.
### Taste:
Der Computer hat zwei physische Tasten: die "Code"-Taste, die die XenonCode IDE zur Entwicklung Ihrer Programme öffnet, und eine "Reboot"-Taste, die den Computer neu startet und das main.xc-Programm (BIOS) erneut ausführt.
### Stromversorgung:
Für den Betrieb benötigt der Computer eine Niederspannungs-Stromversorgung. Er verbraucht 30 Watt im Leerlauf und sein Verbrauch kann je nach Verhältnis zwischen der Anzahl der vom aktuell laufenden Programm ausgeführten Anweisungen und dem auf dem Server konfigurierten MAX IPC auf bis zu 500 Watt ansteigen.
### HDD:
Der Computer verfügt über einen Festplattenschacht. Sie können mehrere HDD im Schacht haben (nur eine gleichzeitig aktiv), HDDs mit anderen Computern tauschen oder sie in Ihrem Inventar aufbewahren. Dies ist nützlich, wenn Sie Ihren Computer an einen anderen Ort verlegen möchten, ohne Ihren Code zu verlieren.

---
>- Die Auflösung des integrierten Bildschirms beträgt 200x160 Pixel.
>- *Der Inhalt von HDDs (Ihr Code) geht nicht verloren, wenn Sie eine Computer-Komponente versehentlich zerstören. Er existiert weiterhin in den Dateien des Servers (oder auf Ihrem eigenen Computer, wenn Sie solo spielen). Sie finden ihn unter (Server Settings)/worlds/(World Name)/ARCHEAN_computer/HDD-... Sie können den Code sogar von dort aus bearbeiten und es wird Ihren Computer live im Spiel neu starten, falls Sie einen externen Editor bevorzugen (für VSCode gibt es tatsächlich eine XenonCode-Erweiterung)*
