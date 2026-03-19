<p align="center">
  <img src="dataspool.png" />
  <img src="lowvoltagespool.png" />
  <img src="highvoltagespool.png" />
  <img src="fluidspool.png" />
  <img src="itemconduitspool.png" />
</p>

|Item|`Spool`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Length**|100 m|

# Description
I diversi spool permettono di collegare i componenti per trasferire dati, energia, oggetti o fluidi.

# Usage
## Creating a cable (connecting two components)
La creazione di un cavo inizia e termina su un connettore di un componente.

Il posizionamento dei cavi e' completamente libero e permette di aggiungere quanti punti si desidera (purche' la lunghezza rimanente dello spool lo consenta) per personalizzarne la forma. Durante la creazione di un cavo, se hai posizionato piu' punti, puoi rimuoverli usando il `tasto destro` per affinare il posizionamento o annullare completamente la creazione del cavo se non ci sono piu' punti esistenti.

- I cavi possono essere sovrapposti ad altri cavi esistenti e ai componenti. (Per agganciarlo alla superficie di un componente, devi tenere premuto il tasto `Shift`).
- Puoi posizionare il cavo sulla faccia interna del blocco/componente tenendo premuto il tasto `X`.

## Creating a Flexible Cable
Potresti voler collegare componenti di costruzioni diverse tra loro temporaneamente o semplicemente agganciare due costruzioni insieme.
Questo creera' effettivamente un Flexible Cable.
Le due costruzioni saranno effettivamente collegate e vincolate nel motore fisico.
Non c'e' limite di forza, i cavi non si staccheranno.
Puoi anche aggiungere un cavo flessibile tra due componenti della stessa costruzione tenendo premuto `X`, per ottenere un cavo dritto (forse leggermente curvo) che sara' influenzato dalla gravita'.

## Deleting a cable
Puoi eliminare un cavo con il `tasto destro` purche' lo strumento nella tua mano sia lo spool del tipo di cavo appropriato.

## Painting cables
Puoi dipingere i cavi usando il [Paint Tool](../tools/PaintTool.md) proprio come faresti con i blocchi.
I cavi offrono due opzioni di personalizzazione aggiuntive:
- `Shift` per dipingere un cavo e renderlo trasparente
- `X` per dipingere un cavo normalmente con un effetto a strisce
  
Puoi anche combinare entrambi gli effetti tenendo premuti entrambi i tasti.

---
>- *Durante la creazione del cavo, se si rifiuta di essere creato, e' probabile che non ci sia abbastanza lunghezza disponibile nello spool corrente per creare il cavo.*
>- *I cavi non hanno limiti di trasferimento ne' perdite legate alla lunghezza.*
>- *I cavi non determinano la direzione di cio' che trasportano.*
>- *Un cavo non puo' essere modificato una volta posizionato, devi eliminarlo.*
>- *I cavi flessibili influiranno significativamente sulle prestazioni, mentre i cavi normali non influiranno affatto sulle prestazioni anche se ne hai migliaia in una costruzione. Cerca di dare priorita' all'uso di cavi normali dove possibile.*
