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
Il Docking Port è un componente che consente di collegare due costruzioni insieme. La connessione permette il trasferimento di dati, energia, fluidi e **oggetti** tra le costruzioni collegate, ma le vincola anche fisicamente insieme. Sono bloccate insieme.

# Usage
Il Docking Port non necessita di alimentazione.
Il connettore dati separato consente di controllare il Docking Port, mentre gli altri connettori permettono di collegare vari cavi che trasferiranno dati, energia o fluidi da/verso l'altro Docking Port.

### Transfer Mode
Il Docking Port può operare in due modalità di trasferimento, configurabili tramite il menu GetInfo (tasto `V`):
- **Fluid Mode** (predefinito): Trasferisce fluidi tra le porte agganciate
- **Item Mode**: Trasferisce oggetti tra le porte agganciate

> Entrambi i Docking Port devono essere impostati sulla stessa modalità perché i trasferimenti funzionino.

> Il Docking Port può essere agganciato solo a un altro Docking Port.

### Usage with aliases
L'utilizzo degli alias predefiniti non è possibile per entrambe le porte contemporaneamente perché l'oggetto mostrerà un solo campo alias nella sua finestra informativa (`V`). Allo stesso modo, il [router](../computers/Router.md) mostra un solo campo alias per componente.
Per utilizzare separatamente le porte dati con gli alias, è necessario usare un [data bridge](../computers/DataBridge.md) o una [data junction](../computers/DataJunction.md). Questo consente di assegnare gli alias a questi oggetti invece che alle porte di aggancio.

### List of outputs
|Channel|Function|
|---|---|
|0|Is Docked

### List of inputs
|Channel|Function
|---|---|
|0|Arm/Disarm Docking

