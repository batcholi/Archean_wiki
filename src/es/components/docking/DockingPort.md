<p align="center">
  <img src="DockingPort.png" />
</p>

|Component|`DockingPort`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|50 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
|**Push/Pull Fluid**|Accept Push/Pull -> Forwards action to other side|
#
---

# Description
El Docking Port es un componente que permite conectar dos construcciones entre sí. La conexión permite la transferencia de datos, energía, fluidos e **items** entre las construcciones conectadas, pero también las restringe físicamente entre sí. Quedan unidas.

# Usage
El Docking Port no necesita estar alimentado.
El conector de datos separado permite controlar el Docking Port, mientras que los otros conectores permiten conectar varios cables que transferirán datos, energía o fluidos hacia/desde el otro Docking Port.

### Transfer Mode
El Docking Port puede operar en dos modos de transferencia, configurables a través del menú GetInfo (tecla `V`):
- **Fluid Mode** (por defecto): Transfiere fluidos entre puertos acoplados
- **Item Mode**: Transfiere items entre puertos acoplados

> Ambos Docking Ports deben estar configurados en el mismo modo para que las transferencias funcionen.

> El Docking Port solo puede acoplarse a otro Docking Port.

### Usage with aliases
Usar alias por defecto no es posible para ambos puertos simultáneamente porque el objeto solo mostrará un único campo de alias en su ventana de información (`V`). De manera similar, el [Router](../computers/Router.md) solo muestra un único campo de alias por componente.
Para usar puertos de datos por separado con alias, necesitas usar un [Data Bridge](../computers/DataBridge.md) o una [Data Junction](../computers/DataJunction.md). Esto te permite asignar alias a estos objetos en lugar de a los puertos de acoplamiento.

### List of outputs
|Channel|Function|
|---|---|
|0|Is Docked

### List of inputs
|Channel|Function
|---|---|
|0|Arm/Disarm Docking

