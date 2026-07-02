# Aerodinamica

Archean simula forze aerodinamiche realistiche, da simulatore di volo, su qualsiasi veicolo in movimento attraverso un fluido, aria o acqua. Il motore produce **portanza**, **resistenza**, **stabilita**, **autorita di controllo**, **galleggiabilita** e persino **riscaldamento da rientro**, tutto a partire dalla **forma** reale della tua costruzione. Non esistono "blocchi ala" speciali ne statistiche nascoste: se sembra un'ala ed e posizionato come un'ala, vola come un'ala.

## Come funziona

### Il campo di forma (modello a sezione trasversale)

Quando finisci di modificare una costruzione, il motore ne cattura un'**istantanea della forma esterna** scandagliandola dalle sei direzioni degli assi (come una cubemap), poi trasforma il risultato in un insieme di piccole superfici. Ogni superficie conosce la propria posizione, la direzione che espone, la propria area e, soprattutto, **quanto e profondo il corpo dietro di essa** (la sua sezione trasversale).

Questa istantanea viene **memorizzata in cache** e ricostruita solo quando la costruzione cambia (aggiungi/rimuovi blocchi, una superficie di controllo si muove, o la costruzione subisce danni). La fisica di volo per fotogramma si limita a leggere le superfici in cache, quindi il costo resta **limitato indipendentemente dalla complessita del veicolo**: un aereo di linea da 300 metri con centinaia di collider si pilota con la stessa efficienza di un piccolo caccia. La risoluzione della scansione si adatta automaticamente alle dimensioni del veicolo.

Ne derivano tre promesse — e il motore le mantiene **esattamente**, non in modo approssimato:

- **Il modo in cui costruisci una forma non cambia mai come vola — conta solo la forma finale.** Un'ala di 10 × 10 × 1 fatta da un unico grande blocco o da cento piccoli da un risultato **identico bit per bit**: le stesse forze e gli stessi momenti, fino all'ultima cifra. La suddivisione, il numero di blocchi e il modo in cui la geometria viene divisa o unita sono del tutto invisibili al flusso: contano solo la sagoma esterna e la sezione trasversale.
- **Aria e acqua sono la stessa fisica — non esiste un "percorso acqua" separato.** Il modello campiona la **densita del fluido a ogni superficie** e la inserisce nelle *stesse* equazioni di portanza e resistenza. Aria, linea di galleggiamento e acqua profonda sono solo punti su un'unica scala continua di densita, cosicche un'ala diventa gradualmente un'idroala mentre si immerge: nulla viene commutato.
- **Il materiale e invisibile al volo.** Acciaio, alluminio, composito: una lastra piatta resta una lastra piatta. **Il materiale influisce solo su massa e galleggiabilita, mai su portanza o resistenza** — cambia il *bilanciamento* dell'aereo, non il suo *modo di volare*.

> Viene scandagliato solo il **guscio esterno**. I blocchi interni non sono mai esposti al flusso d'aria, quindi non aggiungono **alcuna** resistenza aerodinamica ne alcun costo - e poiche il modello legge lo spessore solido dietro una superficie (una cavita sigillata conta come corpo solido), una forma cava vola esattamente come la sua versione piena. Riempi, o svuota, gli interni liberamente; non cambia mai il modo in cui vola la costruzione.

### Portanza

Una superficie genera **portanza** (si comporta come un'ala) quando la sua **sezione trasversale e sottile**: la profondita avanti-dietro di materiale solido in quel punto e piccola rispetto alle dimensioni del veicolo. Un'ala e sottile dall'alto in basso ma ampia in apertura e corda, quindi porta. Una fusoliera e profonda in ogni direzione, quindi crea solo resistenza.

- La portanza segue una **curva di portanza realistica**: cresce con l'angolo di attacco, poi **stalla** oltre circa **15°**, dopodiche la portanza crolla e la resistenza sale bruscamente, proprio come un vero profilo alare.
- La portanza e **a due facce**: un'ala esposta all'aria su entrambe le facce produce piena portanza; un'ala il cui ventre e schiacciato contro la fusoliera porta comunque, a potenza ridotta.
- **Superfici separate generano portanza ciascuna per conto proprio.** Una doppia deriva, ali sovrapposte (biplano), o una deriva allineata dietro un'altra lungo lo stesso asse vengono lette come le superfici sottili distinte che sono: lo spazio d'aria tra di esse non e conteggiato come corpo solido, quindi ognuna di esse funziona.
- La portanza e calcolata **nella posizione di ciascuna superficie**, quindi produce naturalmente i giusti momenti di **beccheggio, rollio e imbardata** attorno al tuo centro di massa.

> **Per fare un'ala, falla geometricamente sottile.** Una superficie ampia e piatta spessa solo uno o due blocchi portera. Un'ala spessa e profonda creera soprattutto resistenza. Il modo in cui e suddivisa o il materiale non contano: conta solo la sezione trasversale.

### Resistenza

La resistenza proviene da diverse fonti fisiche, combinate automaticamente:

| Fonte | Descrizione |
|-------|-------------|
| **Resistenza di forma (pressione)** | La spinta dell'aria sulle superfici rivolte al flusso. Cresce con il **quadrato della velocita**. |
| **Attrito superficiale** | Lo sfregamento dell'aria lungo le superfici parallele al flusso (basato sul numero di Reynolds). Dominante per i corpi grandi e lenti. |
| **Resistenza indotta** | La resistenza inevitabile che accompagna la portanza: piu portanza significa piu resistenza indotta. |

Il nuovo comportamento chiave e il **profilamento basato sulla snellezza**. Il motore misura quanto e **affusolata** ogni superficie: quanto il corpo si estende *lungo* il flusso rispetto alla sua sottigliezza *in trasversale*:

- Una forma **affusolata** (un muso a punta, il bordo d'attacco affilato di un'ala, una lunga fusoliera sottile in avanzamento) mantiene il flusso aderente e ha una resistenza di forma **molto bassa**.
- Una forma **tozza** (un cubo, una lastra piatta tenuta di traverso come un aerofreno, un muso smussato) ha la **piena** resistenza di forma.

E puramente geometrico: legge la sezione trasversale reale della tua costruzione, quindi profilare muso e bordi ripaga davvero.

> Usa pendenze, angoli e smussi per affusolare musi e bordi d'attacco/uscita. Una forma profilata puo avere **un decimo** della resistenza di forma di una tozza con la stessa dimensione frontale.

### Comprimibilita (alta velocita)

Il modello tiene conto dei regimi. All'avvicinarsi e oltre la **velocita del suono** (che dipende dalla temperatura dell'aria), la pressione sulle superfici rivolte in avanti aumenta nel regime transonico e supersonico, e **la portanza delle ali svanisce in supersonico** (ti affidi di piu alla portanza del corpo e alla deflessione dei comandi). Il volo ad alto Mach diventa nettamente piu pesante e meno reattivo, come dovrebbe.

### Stabilita: emergente, non programmata

Non c'e **alcun smorzamento artificiale** del tipo "tieni il muso in avanti". La stabilita e un risultato reale ed emergente di dove si trovano le tue superfici:

- Uno **stabilizzatore orizzontale** montato dietro il centro di massa incontra il flusso d'aria con un'angolazione ogni volta che il muso si alza o si abbassa, generando una **forza di richiamo** che riporta indietro il muso. E **stabilita di beccheggio** automatica.
- Uno **stabilizzatore verticale** (deriva) fa lo stesso per l'**imbardata** ogni volta che il veicolo derapa.
- Lo **smorzamento rotazionale** (resistenza al ribaltamento) emerge anch'esso naturalmente: le superfici lontane dal centro di massa si muovono velocemente nell'aria quando il veicolo ruota, e le forze risultanti si oppongono alla rotazione.

Essendo fisica reale, **la stabilita statica dipende dal tuo centro di massa**. Un aereo e stabile quando il suo **centro di massa si trova in corrispondenza o leggermente davanti al centro di portanza dell'ala**, e instabile quando la massa e troppo arretrata, esattamente come un vero aereo (e un vero aeromodello). Vedi [Volare bene](#volare-bene) piu sotto.

> La vecchia stabilizzazione angolare artificiale ad alta velocita e **scomparsa** per le costruzioni che usano questo modello. Se il tuo aereo sembra nervoso o non si assesta, e un problema di **bilanciamento**, non il motore che ti combatte: sposta massa in avanti o aggiungi superficie di coda.

### Superfici di controllo e autorita

Le superfici di controllo (gli [Aileron](components/miscellaneous/Aileron.md) usati come alettoni, equilibratori o timoni) sono montate su cerniere e **si deflettono in tempo reale**. Il motore rivaluta l'aerodinamica di una superficie deflessa **al suo angolo corrente a ogni fotogramma**, quindi:

- Un equilibratore deflesso cambia immediatamente il flusso d'aria sulla coda e fa beccheggiare l'aereo.
- L'autorita dipende dall'**area** della superficie, dalla sua **distanza dal centro di massa** (braccio di leva) e da **densita dell'aria × velocita²**.

> **Per un controllo potente:** rendi le superfici di controllo **grandi** e montale **lontano dal centro di massa**. Un equilibratore all'estremita della coda ha molta piu autorita di beccheggio di uno vicino all'ala. Aria piu veloce e piu densa danno piu autorita: i comandi si ammorbidiscono a bassa velocita e ad alta quota.

### Aerodinamica sensibile ai danni

I danni da combattimento cambiano il modo in cui una superficie vola. Man mano che un pannello viene deformato o bucato (e sempre piu man mano che viene distrutto):

- **Perde portanza**: un'ala distrutta smette di volare.
- **Perde profilamento e recupero di pressione**, e **crea piu resistenza** (genera una scia turbolenta).

Poiche portanza e resistenza sono calcolate per superficie, i **danni asimmetrici** hanno l'effetto giusto: un'ala crivellata su un lato fa sia **rollare** l'aereo (perdita di portanza su quel lato) sia **imbardare** (resistenza aggiuntiva su quel lato). I progetti simmetrici e ridondanti sopravvivono meglio al combattimento.

### Galleggiabilita

La galleggiabilita e la forza verso l'alto sui blocchi immersi, calcolata per collider dal volume di fluido che ciascun blocco sposta.

**F<sub>galleggiabilita</sub> = V<sub>spostato</sub> × ρ<sub>fluido</sub> × g**

- Il volume spostato di ogni blocco = il suo volume × il **rapporto di spostamento volumetrico** del suo materiale (vedi [Materiali](#materiali)).
- I blocchi danneggiati perdono quasi tutta la loro galleggiabilita.
- La galleggiabilita e applicata dove i blocchi si trovano davvero, quindi un'immersione disuniforme inclina l'imbarcazione: un effetto di autoraddrizzamento per gli scafi ben sagomati.

### Acqua

L'acqua non e **un caso speciale**. Il modello campiona la **densita del fluido a ogni superficie** — aria sopra la linea di galleggiamento, acqua sotto, con una transizione continua — cosicche lo *stesso* modello di portanza e resistenza produce semplicemente forze molto maggiori sott'acqua, dove il fluido e **~800× piu denso** dell'aria. Nulla e codificato in modo fisso per il fatto di "essere in acqua":

- Un'ala diventa un'**idroala**: porta e oppone resistenza sott'acqua esattamente come nell'aria, solo molto piu intensamente. **Le superfici di controllo continuano a funzionare sott'acqua**, percio un sottomarino sterza con gli stessi alettoni ed impennaggi di un aereo.
- **La resistenza e enorme** e cresce con il quadrato della velocita: un corpo che entra in acqua decelera bruscamente e uno scafo galleggiante e trattenuto in modo naturale invece di schizzare fuori — senza alcuno smorzamento artificiale.
- **Lo smorzamento rotazionale** proviene direttamente dallo stesso modello: le superfici lontane dal centro di massa si muovono rapidamente nel fluido denso quando il mezzo vira o ruota, cosicche barche e sottomarini si stabilizzano naturalmente.

> Poiche le forze crescono con la densita, **colpire l'acqua ad alta velocita e un vero impatto**. Una spanciata ad alta velocita carica l'intera faccia di contatto ben oltre cio che la struttura puo reggere e la **deforma o distrugge**, esattamente come urtare un terreno solido — quindi entra in acqua con un angolo basso e rallenta prima.

### Riscaldamento da rientro

Muoversi velocemente nell'aria riscalda le superfici rivolte in avanti verso la **temperatura di ristagno (di recupero)**, che cresce con il quadrato della velocita. E lieve a velocita supersoniche ma **esplosivo alle velocita di rientro**, e ogni materiale si consuma oltre il proprio limite termico: quindi uno scudo termico, un angolo di rientro ripido ma sopravvivibile e la perdita di velocita in alta quota contano tutti.

## Blocchi e materiali

### Materiali

La scelta del materiale influisce su **massa** e **galleggiabilita** (e quindi sul **bilanciamento**) ma **non su portanza o resistenza**:

| Materiale | Massa (per unita di blocco) | Spostamento volumetrico (galleggiabilita) |
|-----------|-----------------------------|-------------------------------------------|
| **Composite** | 0,25 | 0,20 × occupazione |
| **Concrete** | 10,0 | 0,25 × occupazione |
| **Steel** | 1,0 | 0,01 × occupazione |
| **Aluminium** | 0,5 | 0,01 × occupazione |
| **Glass** | 1,0 | 0,02 × occupazione |
| **Lead** | 150,0 | 1,00 × occupazione |
| **Titanium** | 0,6 | 0,01 × occupazione |

- Il **Lead** e denso e sposta tutto: ideale come **zavorra di prua** per portare il centro di massa in avanti (o come zavorra di chiglia in una barca), ma affonda.
- Il **Composite** e leggero con spostamento moderato: il miglior galleggiante generico.
- **Steel/Aluminium/Titanium** spostano appena il fluido: resistenti e leggeri, ma non contribuiscono quasi nulla alla galleggiabilita.

> Poiche il materiale non cambia l'aerodinamica, scegli i materiali per **resistenza, peso, resistenza al calore e bilanciamento**, non per le prestazioni di volo.

### Forme dei blocchi

Pendenze, angoli e piramidi occupano mezzo cubo e sono piu leggeri. Aerodinamicamente contano perche permettono di **affusolare** le superfici, trasformando una faccia tozza e resistente in una affusolata e profilata. Usali su musi e bordi d'ala.

### Travi del telaio

Le travi del telaio (le barre strutturali ai bordi dei telai) sono **aerodinamicamente invisibili**: niente portanza, niente resistenza, niente galleggiabilita. Usale liberamente come struttura interna.

## Componenti aerodinamici

### Aileron

L'[Aileron](components/miscellaneous/Aileron.md) e una superficie di controllo a cerniera usata come alettone, equilibratore o timone. L'ingresso e un valore da `-1.0` a `+1.0` (rotazione da −45° a +45°) tramite la sua porta dati.

- Calcola la **propria** forza di controllo ed e **escluso dal campo di forma principale**, quindi non viene mai conteggiato due volte e fornisce sempre la piena autorita anche se circondato da struttura.
- Puoi costruire la parte fissa di un'ala o di una coda con blocchi (gestiti dal campo) e mettere **alettoni sul bordo d'uscita** per il controllo.

### Propeller

Il [Propeller](components/propulsion/Propeller.md) (elica) genera spinta in aria o acqua ed e escluso dal campo di forma (ha un proprio modello). Comportamenti chiave: la spinta dipende dalla densita del fluido e dall'area del disco; l'**effetto suolo** aumenta la spinta fino a **+50%** vicino al terreno; le pale rotanti creano una resistenza **giroscopica** al riorientamento; la spinta e limitata a **100.000 N**.

### Thruster e RCS

I [Thruster](components/propulsion/thruster/SmallThruster.md) chimici non sono influenzati dall'aerodinamica e funzionano allo stesso modo in atmosfera e nel vuoto. Gli [RCS](components/propulsion/RCS.md) perdono quasi tutta l'efficacia nei fluidi densi (attenuazione ≈ e<sup>−ρ×4</sup>): sono per lo spazio.

## Volare bene

### Costruire ali

- Rendi l'ala **geometricamente sottile**: una superficie ampia e piatta spessa uno o due blocchi. Sezione piu sottile = portanza piu pulita.
- Dalle **apertura e corda**; un'ala lunga e ampia porta di piu e stalla in modo piu dolce.
- **Materiale e numero di blocchi non contano** per la portanza: costruisci per resistenza e peso.
- Affusola i **bordi d'attacco e d'uscita** con pendenze per ridurre la resistenza.

### Bilanciare per un volo stabile

E la cosa piu importante per un aereo che vola bene:

- Mantieni il **centro di massa in corrispondenza o leggermente davanti alle ali**. Aggiungi massa densa (ad es. **lead** o componenti pesanti) verso il **muso** per portarlo in avanti: i veri aerei portano il motore davanti esattamente per questo motivo.
- Un aereo **appesantito in coda** (massa troppo arretrata) e instabile: beccheggia e imbarda in modo divergente ed e estenuante da pilotare.
- Monta **stabilizzatori orizzontali** ben dietro il centro di massa per la stabilita di beccheggio, e una **deriva** per la stabilita di imbardata. Piu superficie di coda e una coda piu lunga = piu stabilita.
- Se una costruzione non si calma, **sposta massa in avanti** o **aggiungi superficie di coda** prima di incolpare i comandi.

### Autorita di controllo

- Superfici di controllo piu grandi, montate **piu lontano dal centro di massa**, danno piu autorita.
- Metti gli **equilibratori all'estremita della coda** per il beccheggio, i **timoni sulla deriva** per l'imbardata, gli **alettoni alle estremita alari** per il rollio.
- L'autorita cala a **bassa velocita** e ad **alta quota** (aria rarefatta): mantieni la velocita in avvicinamento.

### Ridurre la resistenza

- **Profila** musi e bordi con pendenze: le forme affusolate creano molta meno resistenza.
- Mantieni il veicolo **compatto**; le strutture sparse presentano piu area frontale.
- I **blocchi interni sono gratuiti**: viene scandagliato solo il guscio esterno, quindi la disposizione interna non aggiunge mai resistenza.

### Imbarcazioni

- Usa il **composite** per lo scafo (miglior rapporto galleggiabilita/peso); usa il **lead in fondo alla chiglia** per la stabilita.
- Gli scafi **larghi e piatti** sono i piu stabili: lo smorzamento dell'acqua fa il resto.
- **Steel/aluminium** galleggiano appena; usali sopra la linea di galleggiamento.

### Sopravvivere al combattimento

- **Simmetria e ridondanza:** un danno alare asimmetrico ti fa *rollare* e *imbardare*, quindi duplica le superfici portanti e di controllo critiche su entrambi i lati.
- Aspettati che un'ala danneggiata **perda portanza e crei piu resistenza**: tieni velocita e quota in riserva.

### Prestazioni

Il campo di forma e in cache e viene ricostruito solo quando la costruzione cambia o subisce danni, e il suo costo e limitato indipendentemente da dimensioni o numero di blocchi. Non paghi mai una penalita per fotogramma per il dettaglio o il riempimento interno, quindi costruisci grande e dettagliato quanto vuoi.
