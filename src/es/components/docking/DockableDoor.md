<p align="center">
  <img src="DockableDoor.png" />
</p>

|Component|`DockableDoor`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|400 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|250 x 250 x 100 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
La Dockable Door es una puerta grande que puede acoplarse a una puerta similar para conectar dos construcciones entre sí. El acoplamiento permite la transferencia de datos, energía y fluidos entre las construcciones conectadas, pero también restringe físicamente ambas construcciones entre sí. Quedan unidas.

> - Las Dockable Doors solo pueden instalarse en la cara de los marcos.
> - La Dockable Door solo puede acoplarse a otra Dockable Door.
> - <font color="green"> *Este componente está relacionado con la presurización de construcciones, consulte la página de [Pressurization](../../pressurization.md) para más información.*</font>

# Usage
Para funcionar correctamente, la Dockable Door necesita estar alimentada por bajo voltaje. Consume 20 vatios cuando está inactiva y hasta 250 vatios cuando las puertas están en movimiento.

El lado interior de la puerta tiene dos paneles para interactuar con la puerta o transferir datos, energía o fluidos a través del puerto de acoplamiento.

Aquí hay una imagen que ilustra los dos paneles.
- El panel en verde es para interactuar con la puerta, alimentarla y controlarla remotamente a través de un puerto de datos. (La tabla a continuación indica las entradas/salidas del puerto de datos)
- El panel en azul es para conectar varios cables que transferirán datos, energía o fluidos hacia/desde la otra puerta acoplada.

![DockableDoorDemo](DockableDoorExample.png)

### Usage with aliases
Usar alias por defecto no es posible para ambos puertos simultáneamente porque el objeto solo mostrará un único campo de alias en su ventana de información (`V`). De manera similar, el [Router](../computers/Router.md) solo muestra un único campo de alias por componente.
Para usar puertos de datos por separado con alias, necesitas usar un [Data Bridge](../computers/DataBridge.md) o una [Data Junction](../computers/DataJunction.md). Esto te permite asignar alias a estos objetos en lugar de a los puertos de acoplamiento.

### List of inputs
|Channel|Function|
|---|---|
|0|Close/Open Door|
|1|Arm/Disarm Dock|

### List of outputs
|Channel|Function|
|---|---|
|0|Door State|
|1|Dock State|
