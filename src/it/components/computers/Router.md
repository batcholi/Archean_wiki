<p align="center">
  <img src="Router.png" />
</p>

|Component|`Router`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|20 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
#
---

# Description
Un router è un dispositivo utilizzato per collegare diversi componenti a una rete. Il suo vantaggio principale è la capacità di collegare un numero praticamente illimitato di componenti, tutti controllabili da uno o più computer sulla rete. Al contrario, la capacità di un singolo computer di connettersi ai componenti è limitata dal suo numero di porte disponibili.

Ogni router è dotato di 30 porte dati. Possono essere collegati in catena per aumentare il numero totale di porte disponibili, moltiplicando così le porte per il numero di router collegati insieme.

Richiede un'alimentazione a bassa tensione per funzionare e consuma 50 watt.

> - Non è possibile avere più reti router separate collegate a diverse porte dello stesso computer. Un computer può interfacciarsi con una sola rete router unificata, ma questa rete può includere un numero illimitato di router collegati in catena.

# Usage
Quando il router è acceso e collegato ai componenti, consente di assegnare alias ai componenti tramite un'interfaccia visiva tridimensionale, che possono poi essere utilizzati per identificare questi componenti dal codice del computer.

È possibile aprire l'interfaccia del router usando il tasto `F`.

L'interfaccia si presenta come un ambiente 3D (vedi l'immagine sotto) nel quale è possibile navigare tenendo premuto il `tasto destro del mouse`, usando i tasti di movimento standard `WASD`, `CONTROL/SPACE` per scendere/salire, e `Shift` per accelerare il movimento.

I componenti sono posizionati nella loro posizione 3D reale l'uno rispetto all'altro nella costruzione, e includeranno tutti i componenti collegati da tutti i router nella catena.

![Router](routerillus1.png)

Ogni componente mostra un'etichetta dove è possibile inserire l'alias che verrà utilizzato successivamente su un computer. Per imparare ad usare gli alias, fare riferimento alla pagina XenonCode IDE.

È possibile assegnare un alias a un componente direttamente visualizzando la sua finestra informativa usando il tasto `V`, come mostrato nell'esempio seguente.

![Router](routerillus2.png)

# Controlling multiple components with a single alias
In certe situazioni, può essere pratico controllare più componenti che servono allo stesso scopo con un singolo alias. Per farlo, basta aggiungere un asterisco `*` alla fine dell'alias nei nodi/XenonCode. Ad esempio, se state costruendo un aeroplano e avete quattro alettoni sull'ala sinistra, potete nominarli come segue:
- `leftAileron1`
- `leftAileron2`
- `leftAileron3`
- `leftAileron4`

Potete quindi controllarli usando l'alias `leftAileron*`. L'asterisco `*` consente di selezionare tutti i componenti il cui alias inizia con `leftAileron`.

# Additional information:
- I router che comunicano direttamente con un computer devono essere alimentati, gli altri router nella catena non richiedono alimentazione. Questo consente anche di utilizzare un [MiniRouter](MiniRouter.md) come se fosse un [Data Bridge](DataBridge.md) (senza alimentazione) ma a differenza del [DataBridge](DataBridge.md) è effettivamente in grado di risolvere gli alias e i riferimenti agli schermi.

- Per l'instradamento dei dati, un router deve assolutamente essere collegato a un computer o a un altro router. Non è possibile avere questo tipo di configurazione `Computer > DataBridge/DataJunction > Router`.
