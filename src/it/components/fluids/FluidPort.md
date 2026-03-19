<p align="center">
  <img src="FluidPort.png" />
</p>

|Component|`FluidPort`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
|**Push/Pull Fluid**|Accept Push/Pull|
#
---

# Description
Il Fluid Port e' un dispositivo che permette l'aspirazione o l'espulsione di fluidi.

> <font color="green"> *Questo componente e' legato alla pressurizzazione delle costruzioni. Per maggiori informazioni, consultare la pagina [Pressurization](../../pressurization.md).*</font>

Quando aspira fluido, preleva la composizione dell'ambiente circostante. Ad esempio, se e' immerso nell'acqua, puo' riempire un serbatoio di fluido con H2O, e se e' all'aria aperta, aspira la composizione dell'atmosfera.

Quando espelle fluido, puo' svuotare i serbatoi del loro contenuto.

# Usage
Il Fluid Port funge da ponte tra un contenitore di fluido e la composizione dell'ambiente circostante.

Per funzionare, deve essere collegato a qualsiasi componente in grado di contenere o processare fluidi.

Di seguito un esempio che illustra come potrebbe essere collegato.

![FluidPortDemo](fluidportdemo.jpg)

## Flow Rate Limit

Il Fluid Port ha una portata massima di **1,0 m³/s** (basata sul volume, non sulla massa).

Poiche' il limite e' volumetrico, la **massa effettivamente trasferita dipende dalla densita' del fluido**:
- I fluidi densi (liquidi come H2O, O2 liquido) trasferiscono piu' massa al secondo
- I fluidi leggeri (gas, atmosfera ad alta quota) trasferiscono meno massa al secondo
- Nel vuoto (densita' = 0), nulla puo' essere trasferito

Ad esempio:
- Acqua (~1000 kg/m³): fino a 1000 kg/s
- Aria al livello del mare (~1,2 kg/m³): fino a 1,2 kg/s
- Aria ad alta quota (~0,4 kg/m³): fino a 0,4 kg/s

## Placement

Quando si posiziona un Fluid Port, assicurarsi che l'**apertura dell'ugello sia orientata verso** l'area con cui si desidera interagire. E' possibile montarlo a filo su una parete con l'apertura rivolta verso l'interno: purche' l'ugello punti nel compartimento, funzionera' correttamente.

## Information Window

Premere `V` su un Fluid Port per visualizzare:
- **Environment density** (kg/m³): la densita' nel punto di campionamento
- **Environment Composition**: la composizione del fluido in percentuale volumetrica

Se il punto di campionamento si trova all'interno di un volume pressurizzato, mostrera' il contenuto del volume. Altrimenti, mostrera' l'ambiente circostante (atmosfera, acqua, ecc.).
