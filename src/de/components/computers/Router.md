<p align="center">
  <img src="Router.png" />
</p>

|Component|`Router`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|20 kg|
|[**Size**](# "Basierend auf der Belegung der Komponente in einem festen 25-cm-Raster.")|100 x 100 x 25 cm|
#
---

# Description
Ein Router ist ein Gerät, das dazu dient, verschiedene Komponenten mit einem Netzwerk zu verbinden. Sein Hauptvorteil ist die Möglichkeit, eine praktisch unbegrenzte Anzahl von Komponenten anzuschließen, die alle von einem oder mehreren Computern im Netzwerk steuerbar sind. Im Gegensatz dazu ist die Fähigkeit eines einzelnen Computers, sich mit Komponenten zu verbinden, durch die Anzahl seiner verfügbaren Anschlüsse begrenzt.

Jeder Router ist mit 30 Datenanschlüssen ausgestattet. Sie können verkettet werden, um die Gesamtzahl der verfügbaren Anschlüsse zu erhöhen, wodurch die Anschlüsse mit der Anzahl der miteinander verbundenen Router multipliziert werden.

Er benötigt eine Niederspannungs-Stromversorgung zum Betrieb und verbraucht 50 Watt.

> - Es ist nicht möglich, mehrere separate Router-Netzwerke an verschiedene Anschlüsse desselben Computers anzuschließen. Ein Computer kann nur mit einem einheitlichen Router-Netzwerk verbunden werden, aber dieses Netzwerk kann eine unbegrenzte Anzahl verketteter Router umfassen.

# Usage
Wenn der Router eingeschaltet und mit Komponenten verbunden ist, ermöglicht er die Zuweisung von Aliassen an Komponenten über eine dreidimensionale visuelle Oberfläche, die später zur Identifizierung dieser Komponenten aus dem Computercode verwendet werden können.

Sie können die Router-Oberfläche mit der `F`-Taste öffnen.

Die Oberfläche erscheint als 3D-Umgebung (siehe Bild unten), in der Sie navigieren können, während Sie die `rechte Maustaste` gedrückt halten, mit den Standard-Bewegungstasten `WASD`, `STRG/LEERTASTE` zum Absteigen/Aufsteigen und `Shift` zum Beschleunigen der Bewegung.

Die Komponenten sind an ihrer tatsächlichen 3D-Position relativ zueinander im Build positioniert und umfassen alle verbundenen Komponenten aller Router in der Kette.

![Router](routerillus1.png)

Jede Komponente zeigt ein Label an, in das Sie den Alias eingeben können, der später auf einem Computer verwendet wird. Um zu erfahren, wie Aliasse verwendet werden, besuchen Sie die Seite XenonCode IDE.

Es ist möglich, einer Komponente direkt einen Alias zuzuweisen, indem Sie deren Informationsfenster mit der `V`-Taste anzeigen, wie im folgenden Beispiel gezeigt.

![Router](routerillus2.png)

# Controlling multiple components with a single alias
In bestimmten Situationen kann es praktisch sein, mehrere Komponenten, die denselben Zweck erfüllen, mit einem einzigen Alias zu steuern. Fügen Sie dazu einfach ein Sternchen `*` am Ende des Alias in Nodes/XenonCode hinzu. Wenn Sie beispielsweise ein Flugzeug bauen und vier Querruder am linken Flügel haben, können Sie sie wie folgt benennen:
- `leftAileron1`
- `leftAileron2`
- `leftAileron3`
- `leftAileron4`

Sie können sie dann mit dem Alias `leftAileron*` steuern. Das Sternchen `*` ermöglicht es, alle Komponenten auszuwählen, deren Alias mit `leftAileron` beginnt.

# Additional information:
- Die Router, die direkt mit einem Computer kommunizieren, müssen mit Strom versorgt werden, andere Router in der Kette benötigen keinen Strom. Dies ermöglicht auch die Verwendung eines [MiniRouter](MiniRouter.md) als wäre er eine [Data Bridge](DataBridge.md) (ohne Strom), aber im Gegensatz zur [DataBridge](DataBridge.md) ist er tatsächlich in der Lage, Aliasse und Bildschirmreferenzen aufzulösen.

- Für das Daten-Routing muss ein Router unbedingt mit einem Computer oder einem anderen Router verbunden sein. Folgendes Muster ist nicht möglich: `Computer > DataBridge/DataJunction > Router`.
