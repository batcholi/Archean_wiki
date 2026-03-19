<p align="center">
  <img src="ownerpad.webp" />
</p>

|Component|`OwnerPad`|
|---|---|
|**Module**|`ARCHEAN_ownership`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
Das OwnerPad ist ein vielseitiges Sicherheitsgerät, das den Schutz von Builds gegen potenzielle böswillige Aktionen gewährleistet.

Neben seiner Sicherheitsfunktion ermöglicht es das Speichern des Zustands eines Builds oder Fahrzeugs (Position, Geschwindigkeit, Batteriestand, Schalter...).  
Mit dieser Funktion wird es möglich, mit einem einzigen Klick sofort zu diesem Zustand zurückzukehren.

# Usage
### SAVE & RESET Button
Der `SAVE`-Button speichert die Position eines Builds sowie den Zustand seiner Komponenten, während der `RESET`-Button den Build auf den Zustand zurücksetzt, der beim letzten Speichern aktiv war.

### ROLES Button
Rollen ermöglichen es Ihnen, Aktionen auf einem Build zu autorisieren/verbieten, wie im Beispielbild gezeigt. Sie sind dafür konzipiert, die Sicherheit Ihrer Builds gegen böswillige Aktionen anderer Spieler zu gewährleisten.
Wenn Sie ein OwnerPad auf einem Build platzieren und kein anderes OwnerPad vorhanden ist, werden Sie zum Besitzer dieses Builds.

Standardmäßig sind alle Berechtigungen auf `@Everyone` gesetzt, wodurch der Build vollständig öffentlich ist.  
Neben `@Everyone` und `dksm (OWNER)` im Beispiel wird die Liste aller verbundenen Spieler angezeigt, sodass Sie den Spielern Ihrer Wahl Rollen zuweisen können.

Ein `Give Ownership`-Button ist neben jedem verbundenen Spieler vorhanden, um das Eigentum an den Spieler Ihrer Wahl zu übertragen. Sie haben dann keine Rechte mehr auf dem Build, bis der neue Besitzer Ihnen Rollen gewährt.

![OwnerPadDemo](RolesUI.png)

### Control via the data port
Das OwnerPad hat einen Datenport, der die Steuerung von einem Computer oder zum Beispiel per Fernzugriff über einen Beacon ermöglicht.
Sie müssen einen Text auf Kanal 0 senden, der das Schlüsselwort `"save"` oder `"reset"` enthält, je nach der gewünschten Aktion.

Sie müssen einen leeren Text `""` senden, um den Zustand zurückzusetzen, bevor Sie einen weiteren Befehl senden können.
