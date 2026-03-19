<p align="center">
  <img src="FissionReactor.png" />
</p>

|Component|`FissionReactor`|
|---|---|
|**Module**|`ARCHEAN_nuclear`|
|**Mass**|1000 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|300 x 300 x 275 cm|
|**Push/Pull Fluid**|Accept Push / Initiate Push|
#
---

# Description
El Fission Reactor es un componente que produce calor a partir de la fisión nuclear de barras de uranio.

---

# Usage

## Funcionamiento general
El reactor calienta agua (H₂O) usando la energía generada por la fisión nuclear.

El agua tiene un doble rol:
- Enfriar el núcleo del reactor.
- Producir vapor para las turbinas.

---

## Recursos necesarios
El reactor requiere:
- Una fuente de alimentación continua de bajo voltaje de **1000 W**.
- Un suministro de agua fría.
- Barras de uranio colocadas en las 4 zonas internas del reactor.

> Es altamente recomendable tener al menos una barra de uranio por zona.
> Un reactor con zonas vacías funcionará muy mal o no funcionará en absoluto.

---

## Inventario y zonas
El reactor tiene **40 ranuras**, divididas en **4 zonas independientes**.

Cada zona influye en su potencia local y temperatura según el número y tipo de barras de uranio colocadas.

---

## Barras de control
Cada zona tiene una *barra de control* ajustable:
- 0% retraída (completamente insertada) → Reacción detenida.
- 100% retraída → Reacción máxima.

---

## Inicio de la reacción
Se requiere una inyección manual de neutrones a través del puerto de datos.

Se pueden enviar hasta **1000 neutrones** por segundo durante el arranque
(hasta **250 neutrones** por segundo por zona).

> - Incluso con uranio al 100% U235, es necesario un suministro inicial de neutrones.
> - Con uranio de bajo enriquecimiento (10% U235), el arranque puede requerir varios minutos de inyección continua de neutrones.

---

## Comportamiento de la reacción en cadena

Aunque cada zona del reactor tiene sus propias barras de uranio, temperatura y población de neutrones, el reactor está diseñado para simular una reacción en cadena realista a través de todo el núcleo.

- Las zonas no están completamente aisladas.
- Los neutrones producidos en una zona pueden propagarse parcialmente a las zonas vecinas.
- Este comportamiento mejora la estabilidad de la reacción y ayuda a las zonas más débiles a mantener la fisión.

> Una zona altamente activa puede apoyar a una menos activa, pero tener todas las zonas correctamente abastecidas sigue siendo esencial para la máxima eficiencia.

---

## Enfriamiento y producción de vapor
Cuando se usa con [Steam Turbines](SteamTurbine.md), la temperatura ideal del agua de salida es **650 K**.

- Por debajo → Producción de energía reducida.
- Por encima → Pérdida de eficiencia (sin ganancia adicional).

> Un flujo de agua excesivamente alto puede sobreenfriar el reactor y limitar la potencia de salida.

---

## Estados del reactor

|State|Meaning|
|---|---|
|IDLE|El reactor está apagado.|
|STARTING|Arranque en progreso (inyección de neutrones).|
|ACTIVE|Reacción nuclear activa (se están produciendo neutrones).|
|COOLDOWN|Enfriamiento en progreso (no se producen neutrones).|
|HOT|El reactor está caliente, por favor aumente el flujo de fluido.|
|SCRAM|Apagado de emergencia activado (barras de control bloqueadas al 0% de retracción).|
|CRITICAL|El núcleo del reactor se está sobrecalentando gravemente, fusión inminente.|
|MELTDOWN|Fusión del núcleo. Reactor inutilizable sin reinicio manual.|

---

## Seguridad y fusión del núcleo
- Por encima de **1200 K** → Entra en estado *CRITICAL* - fusión inminente.

En *MELTDOWN*:
- El flujo de vapor se detiene - no se puede producir energía.
- El reactor se vuelve inutilizable hasta que se reinicie manualmente.

### Reiniciar la fusión
A través del botón de reinicio en la interfaz del reactor (tecla `V`).

> - En modo creativo, este botón siempre está disponible.
> - En modo aventura, solo está disponible cuando el reactor ha entrado en fusión.

---

# Desgaste de las barras de uranio

Las barras de uranio se degradan lentamente con el tiempo a medida que participan en la reacción nuclear.

### Consumo de isótopos
- **U235** se consume gradualmente para mantener la fisión.
- **U238** también puede transformarse parcialmente en plutonio.

### Productos de fisión
Durante la operación, las barras acumulan automáticamente productos de fisión:
- **Xenon (Xe)**
- **Plutonium (Pu)**

Estos elementos aparecen directamente en la composición de la barra a medida que envejece.
> Es importante señalar que estos productos de fisión actualmente no tienen uso en el juego. Para obtener plutonio para fabricar el RTG, debes usar el proceso de fabricación de plutonio descrito en la página del RTG [RTG](./RTG.md#how-to-produce-plutonium).

### Barra agotada
Cuando la concentración de **U235** de una barra de uranio cae por debajo del **4.45%**, se considera *agotada*.

> Una barra agotada ya no puede mantener una reacción en cadena, incluso con un suministro externo de neutrones.

### Factores de desgaste
La vida útil de las barras de uranio depende enteramente de:
- Su tasa de enriquecimiento inicial de U235.
- La potencia real producida por el reactor (y por lo tanto el flujo de neutrones).

> → Cuanto menor sea el enriquecimiento y mayor la extracción de potencia, más rápido se desgastará la barra.
> → Por el contrario, una barra de uranio altamente enriquecida operando a potencia moderada puede durar un tiempo extremadamente largo.

### List of inputs

|Channel|Function|Value|
|---|---|---|
|0|Control Rod Zone 1|0.0 to 1.0|
|1|Control Rod Zone 2|0.0 to 1.0|
|2|Control Rod Zone 3|0.0 to 1.0|
|3|Control Rod Zone 4|0.0 to 1.0|
|4|Neutrons Injection|0 to 1000|
|5|SCRAM (Emergency Shutdown)|0 or 1|

---

### List of outputs

|Channel|Function|Value|
|---|---|---|
|0|Zone 1 Temperature (Kelvin)|Number|
|1|Zone 2 Temperature (Kelvin)|Number|
|2|Zone 3 Temperature (Kelvin)|Number|
|3|Zone 4 Temperature (Kelvin)|Number|
|4|Control Rod Position Zone 1|0.0 to 1.0|
|5|Control Rod Position Zone 2|0.0 to 1.0|
|6|Control Rod Position Zone 3|0.0 to 1.0|
|7|Control Rod Position Zone 4|0.0 to 1.0|
|8|Neutron Flux Zone 1|Number|
|9|Neutron Flux Zone 2|Number|
|10|Neutron Flux Zone 3|Number|
|11|Neutron Flux Zone 4|Number|
|12|Input Water Temperature (Kelvin)|Number|
|13|Output Water Temperature (Kelvin)|Number|
|14|Water Flow Rate (kg/s)|Number|
|15|Reactor Status|"IDLE", "STARTING", "ACTIVE", "COOLDOWN", "HOT", "SCRAM", "CRITICAL", "MELTDOWN"|
|16|Lifetime|Estimated remaining time in seconds|

---

# Fabricación de barras de uranio

---

## Low Enriched Uranium (LEU)

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher (Uranium Powder)|Uranium Ore : 1000 g|Uranium powder (U235 : 10%, U238 : 90%) : 1000 g|-|
|ChemicalFurnace (Yellow Cake (U₃O₈))|Uranium powder : 0.714 g, Oxygen (O₂) : 0.128 g|Yellow Cake (U₃O₈) : 0.842 g|750K - 950K|
|ChemicalFurnace (Uranium Dioxide (UO₂))|Yellow Cake (U₃O₈) : 0.842 g, Hydrogen (H₂) : 0.004 g|Uranium dioxide (UO₂) : 0.810 g, Water (H₂O) : 0.036 g|850K - 1050K|
|Crafter (Uranium Rod LEU (UO₂))|Uranium dioxide (UO₂) : 1000 g|Uranium rod LEU (UO₂, U235 : 10%, U238 : 90%) : 1|-|

---

## Highly Enriched Uranium (HEU)

### Producción de UF₆ (Gas)

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|Crusher (Fluorite powder (F₂))|Fluorite Ore: 1000 g|Fluorite powder (F₂) : 1000 g|-|
|ChemicalFurnace (Hydrogen Fluoride (HF)) <font color="orange">*</font>|Fluorite powder (F₂) : 0.038 g, Hydrogen (H₂) : 0.002 g|Hydrogen fluoride (HF) : 0.040 g|300K - 400K|
|ChemicalFurnace (Uranium Tetrafluoride (UF₄))|Hydrogen fluoride (HF) : 0.080 g, Uranium dioxide (UO₂) : 0.270 g|Uranium tetrafluoride (UF₄) : 0.314 g, Water (H₂O) : 0.036 g|750K - 950K|
|ChemicalFurnace (Uranium Hexafluoride (UF₆))|Uranium tetrafluoride (UF₄) : 0.314 g, Fluorite powder (F₂) : 0.038 g|Uranium hexafluoride (UF₆) : 0.352 g|550K - 750K|

<font color="orange">*</font> La producción de Hydrogen Fluoride (HF) desencadena una reacción altamente exotérmica. En este caso específico, la temperatura resultante, incluso si el horno químico muestra valores alrededor de 3000K, no afecta la reacción química. Sin embargo, en procesos posteriores, necesitarás enfriar el HF antes de poder usarlo, típicamente con un [Active Radiator](../fluids/radiator/ActiveRadiator.md) o un dispositivo de enfriamiento similar.




---

### Uso de la centrifugadora de enriquecimiento

|Characteristic|Value|
|---|---|
|Power consumption|1000 W|
|Input flow|0.1 kg/s|
|Internal capacity|10 kg|

Operación:
- La primera centrifugadora recibe hexafluoruro de uranio (UF₆) por la parte superior.
- La salida pesada (inferior) puede descartarse ya que solo contendrá U238.
- La salida más ligera puede enviarse a otra centrifugadora para un procesamiento adicional.

> Típicamente, alcanzar una alta concentración de U235 requiere una cadena de 8 a 10 centrifugadoras.

---

### Vuelta al estado sólido y ensamblaje de barras de uranio HEU

|Step|Inputs|Outputs|Temperature|
|---|---|---|---|
|ChemicalFurnace (Uranyl Fluoride (UO₂F₂))|Uranium hexafluoride (UF₆) : 0.352 g, Water (H₂O) : 0.036 g|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen fluoride (HF) : 0.080 g|300K - 350K|
|ChemicalFurnace (Uranium Dioxide (UO₂))|Uranyl fluoride (UO₂F₂) : 0.308 g, Hydrogen (H₂) : 0.002 g|Uranium dioxide (UO₂) : 0.270 g, Hydrogen fluoride (HF) : 0.040 g|750K - 850K|
|Crafter (Uranium Rod HEU (UO₂))|Enriched uranium dioxide (UO₂) : 1000 g|Uranium rod HEU (UO₂, U235 content depends on enrichment) : 1|-|
