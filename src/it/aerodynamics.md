# Aerodinamica

Archean simula forze aerodinamiche che si applicano automaticamente a qualsiasi veicolo in movimento attraverso un mezzo fluido, che sia aria o acqua. Queste forze includono la **resistenza** (opposizione al movimento), la **portanza** (forza perpendicolare dalle superfici sottili) e la **galleggiabilita** (forza verso l'alto dallo spostamento del fluido). Comprendere come funzionano questi sistemi e fondamentale per progettare aerei, barche, sottomarini e qualsiasi altra creazione in movimento.

## Come funziona

### Mezzo fluido

Il motore fisico interroga l'ambiente in ogni punto rilevante del tuo veicolo per determinare le proprieta locali del fluido:

| Proprieta | Descrizione | Valori di esempio |
|----------|-------------|----------------|
| **Densita** (kg/m³) | Massa per volume del fluido | Aria al livello del mare: ~1,2, Acqua: ~1000 |
| **Viscosita** (kg/(m·s)) | Resistenza allo scorrimento all'interno del fluido | Usata per il rilevamento dell'acqua e lo smorzamento |

- Nell'**aria**, la densita diminuisce con l'altitudine. Maggiore l'altitudine, minori la resistenza e la portanza.
- Nell'**acqua**, la densita e circa 800× maggiore rispetto all'aria — le forze aerodinamiche sono drasticamente piu forti.
- Nello **spazio** (vuoto), la densita e 0 — nessuna forza aerodinamica si applica.

> Le forze aerodinamiche si attivano solo quando la velocita di un veicolo supera **0,1 m/s**. Sotto questa soglia, le forze non vengono calcolate.

### Resistenza

La resistenza e la forza che si oppone al movimento di un veicolo attraverso un fluido. Agisce nella **direzione opposta** alla velocita.

La forza di resistenza su ogni superficie esposta segue l'equazione aerodinamica standard:

**F = ½ × C<sub>d</sub> × ρ × v² × A**

| Simbolo | Significato | Valore |
|--------|---------|-------|
| C<sub>d</sub> | Coefficiente di resistenza | **0,4** per le superfici dei blocchi |
| ρ | Densita del fluido (kg/m³) | Dipende dall'ambiente |
| v | Velocita relativa alla superficie (m/s) | Velocita del veicolo + velocita rotazionale in quel punto |
| A | Area frontale esposta (m²) | Perpendicolare alla velocita, scalata dal rapporto di occupazione |

Punti chiave:
- La resistenza cresce con il **quadrato** della velocita — raddoppiare la velocita quadruplica la resistenza
- Solo le **superfici esposte** contribuiscono alla resistenza (vedi [Occlusione](#occlusione-e-superfici-esposte))
- La forza e calcolata **per superficie**, nella posizione di ogni superficie, il che significa che la resistenza puo anche indurre **coppia** (rotazione) se applicata fuori centro

### Portanza

La portanza e generata automaticamente da **strutture sottili e piatte** — come ali o pinne — che il motore fisico rileva in base alla geometria.

Una superficie e classificata come **superficie portante** quando tutte le seguenti condizioni sono soddisfatte:

| Condizione | Soglia |
|-----------|-----------|
| Spessore (dimensione piu corta) | < **0,3 m** |
| Larghezza (dimensione media) | ≥ **lunghezza / 4** |
| Lunghezza (dimensione piu lunga) | ≥ **4 m** |

Quando viene rilevata una superficie portante:
- Il **coefficiente di portanza** dipende dall'angolo di attacco: `C_l = sin(|angolo_di_attacco| × π/2)`
- Il **coefficiente di resistenza** e molto basso: solo **0,01** (rispetto a 0,4 per le superfici normali)
- La forza di portanza e perpendicolare alla velocita, spingendo il veicolo nella direzione della normale alla superficie

> Per costruire ali che generano portanza, usa disposizioni piatte di blocchi lunghe almeno **4 metri** e spesse **meno di 0,3 metri**. Le pendenze possono essere usate per modellare i bordi d'attacco e d'uscita.

### Galleggiabilita

La galleggiabilita e la forza verso l'alto esercitata su un oggetto sommerso o parzialmente sommerso. Si oppone alla gravita e dipende da quanto fluido i blocchi del veicolo spostano.

**F<sub>galleggiamento</sub> = V<sub>spostato</sub> × ρ<sub>fluido</sub> × g**

| Simbolo | Significato |
|--------|---------|
| V<sub>spostato</sub> | Volume spostato (volume del blocco × `volumeDisplacementRatio`) |
| ρ<sub>fluido</sub> | Densita del fluido nel punto di campionamento |
| g | Accelerazione gravitazionale (direzione opposta) |

- Il motore campiona **almeno 16 punti casuali** su tutti i collider per gestire la **sommersione parziale** in modo fluido
- Il contributo di ogni blocco dipende dal `volumeDisplacementRatio` del suo materiale (vedi [Materiali](#materiali))
- La galleggiabilita e applicata in ogni punto di campionamento, quindi un veicolo puo inclinarsi in base a una sommersione non uniforme

## Blocchi e forme

### Forme dei blocchi

Diverse forme di blocchi hanno diversi **rapporti di occupazione**, che influenzano direttamente i calcoli della resistenza:

| Forma | Rapporto di occupazione | Moltiplicatore di massa |
|-------|----------------|-----------------|
| **Cubo** | 1,0 | 1,0× |
| **Pendenza** | 0,5 | 0,5× |
| **Angolo** | 0,5 | 0,5× |
| **Piramide** | 0,5 | 0,5× |
| **Angolo inverso** | 0,5 | 0,5× |

Il rapporto di occupazione scala l'area di resistenza calcolata — un blocco a pendenza rivolto verso il vento produce circa **la meta della resistenza** di un cubo nella stessa posizione.

### Materiali

Ogni materiale dei blocchi ha proprieta fisiche diverse che influenzano l'aerodinamica, la galleggiabilita e la massa:

| Materiale | Massa (kg/unita blocco) | Rapporto di spostamento del volume | Attrito |
|----------|---------------------|--------------------------|----------|
| **Composite** | 0,25 | 0,20 × occupazione | 0,05 |
| **Concrete** | 10,0 | 0,25 × occupazione | 0,50 |
| **Steel** | 1,0 | 0,01 × occupazione | 0,20 |
| **Aluminium** | 0,5 | 0,01 × occupazione | 0,20 |
| **Glass** | 1,0 | 0,02 × occupazione | 0,10 |
| **Lead** | 150,0 | 1,00 × occupazione | 0,20 |

Il **rapporto di spostamento del volume** determina quanto un blocco contribuisce alla galleggiabilita e quanto e visibile al rilevamento delle superfici aerodinamiche:
- **Lead** (1,0) sposta completamente il fluido — forza di galleggiamento massima ma anche molto pesante, quindi affonda
- **Steel/Aluminium** (0,01) spostano appena il fluido — contribuiscono quasi zero alla galleggiabilita
- **Composite** (0,2) offre un equilibrio moderato tra galleggiabilita e leggerezza

### Occlusione e superfici esposte

Il sistema aerodinamico usa il **raycasting** per determinare quali superfici sono effettivamente esposte al flusso d'aria:

1. Per ogni collider di blocco, il motore identifica la superficie rivolta verso la direzione della velocita
2. Un raggio viene proiettato da quella superficie verso l'esterno nella direzione della velocita
3. Se il raggio colpisce un altro blocco dello stesso veicolo, quella superficie e considerata **occlusa** e **non** contribuisce alla resistenza o alla portanza
4. Solo le superfici realmente esposte generano forze aerodinamiche

Questo significa:
- I **blocchi interni** all'interno di uno scafo non aggiungono resistenza — conta solo il guscio esterno
- Un **veicolo compatto** con meno facce esposte ha meno resistenza di una struttura allargata
- Quando un gruppo di blocchi ha un rapporto di occupazione inferiore a **0,9**, il sistema esamina ricorsivamente i singoli blocchi figli per trovare le superfici effettivamente esposte

> Questo e un punto di ottimizzazione importante: due veicoli con la stessa forma esterna ma strutture interne diverse subiranno la **stessa** resistenza aerodinamica. Riempi gli interni liberamente senza preoccuparti della resistenza aggiuntiva.

### Travi del telaio

Le travi del telaio (le barre strutturali ai bordi dei telai) hanno un **rapporto di spostamento del volume pari a 0**. Questo significa:

- Non producono **resistenza**
- Non producono **portanza**
- Non producono **galleggiabilita**
- Servono solo come geometria di collisione strutturale

> Le travi del telaio sono aerodinamicamente invisibili. Usale liberamente per la struttura interna senza influenzare le prestazioni aerodinamiche del tuo veicolo.

## Componenti aerodinamici

### Aileron

L'[Aileron](components/miscellaneous/Aileron.md) e una superficie di controllo che si deflette per creare forze perpendicolari al flusso d'aria. E usato per governare aerei e imbarcazioni.

- **Input**: un valore tra `-1.0` e `+1.0` attraverso la sua porta dati, che controlla la rotazione da -45° a +45°
- **Forza**: proporzionale alla densita del fluido × velocita² × angolo di deflessione
- **Non calcola l'occlusione** — a differenza dei blocchi, l'Aileron genera sempre la sua forza completa indipendentemente dalla geometria circostante

> Poiche gli Aileron ignorano l'occlusione, puoi **nasconderli all'interno delle ali** fatte di blocchi. I blocchi avranno le loro superfici occluse (riducendo la resistenza), mentre gli Aileron producono comunque la loro piena forza di controllo.

### Propeller

Il [Propeller](components/propulsion/Propeller.md) genera spinta facendo ruotare le pale attraverso un mezzo fluido. Funziona sia in aria che in acqua.

Fisica chiave:
- **Spinta** = ½ × ρ × A<sub>disco</sub> × v<sub>effettiva</sub>² × 0,4
- **Resistenza sulle pale** = ½ × ρ × viscosita × A<sub>disco</sub> × v<sub>effettiva</sub>² × 10,0
- **Effetto suolo**: quando un Propeller e vicino al suolo e punta verso il basso, la spinta aumenta fino al **+50%** (entro 3× il raggio delle pale dal terreno)
- **Precessione giroscopica**: i Propeller in rotazione resistono ai cambiamenti di orientamento, creando una coppia perpendicolare all'asse di rotazione — proprio come i veri giroscopi
- La spinta massima e limitata a **100.000 N**

### Thruster e RCS

I [Thruster](components/propulsion/thruster/SmallThruster.md) chimici generano spinta tramite la combustione del carburante e **non sono influenzati** dall'aerodinamica esterna per la loro produzione di spinta — funzionano allo stesso modo in atmosfera e nel vuoto.

I propulsori [RCS](components/propulsion/RCS.md) (Reaction Control System), tuttavia, subiscono un'**attenuazione atmosferica**:

**attenuazione = max(e<sup>-ρ×4</sup>, 0,01)**

| Ambiente | Densita (ρ) | Attenuazione | Spinta effettiva |
|-------------|-------------|-------------|-----------------|
| Vuoto | 0 | 100% | Spinta piena |
| Aria (livello del mare) | ~1,2 | ~99,2% | Quasi piena |
| Acqua | ~1000 | ~1% | Quasi nessuna spinta |

> I propulsori RCS sono progettati per le manovre spaziali. In atmosfere dense o in acqua, la loro efficacia diminuisce drasticamente.

## Fisica dell'acqua

Quando un veicolo entra in acqua, il motore fisico applica effetti di smorzamento aggiuntivi oltre alla resistenza standard:

### Rilevamento dell'acqua

Il motore rileva l'acqua misurando la **viscosita** dell'ambiente. Una viscosita tra **0,0000151** e **0,000999** kg/(m·s) e classificata come acqua.

### Effetti di smorzamento in acqua

| Effetto | Descrizione |
|--------|-------------|
| **Soppressione della velocita verticale** | La velocita verticale viene ridotta nel tempo, simulando la resistenza dell'acqua al movimento verticale |
| **Smorzamento di beccheggio e rollio** | La rotazione attorno agli assi orizzontali e smorzata proporzionalmente a quanto il veicolo e sommerso |
| **Smorzamento di imbardata** | La rotazione attorno all'asse verticale e smorzata alla **meta** della velocita del beccheggio/rollio |

Il **fattore di sommersione** e calcolato dalla viscosita media: `sommerso = clamp(pow(viscosita × 1000, 0,1), 0,5, 1,0)`

> L'acqua stabilizza naturalmente i veicoli. Un veicolo parzialmente sommerso resistera al ribaltamento grazie allo smorzamento di beccheggio/rollio. Questo rende le barche intrinsecamente piu stabili degli aerei.

## Stabilita angolare ad alta velocita

A velocita superiori a **10 m/s**, il motore fisico applica uno smorzamento angolare artificiale che simula l'accumulo di pressione sulle superfici del veicolo:

**ω -= ω × min(1, ρ) × clamp(Δt × |v| / 25, 0, 0,025)**

Questo significa:
- I **veicoli piu veloci** sono piu stabili rotazionalmente
- I **fluidi piu densi** (acqua > aria) forniscono una stabilizzazione piu forte
- Questo impedisce ai veicoli di ribaltarsi in modo incontrollabile ad alte velocita
- In acqua ad alta viscosita, viene applicato un fattore di smorzamento angolare aggiuntivo

## Consigli di progettazione

### Ridurre la resistenza
- **Minimizza l'area superficiale esposta** — una forma compatta e aerodinamica crea meno resistenza
- Usa **pendenze, angoli e smussi** sui bordi d'attacco e sui musi invece di facce piatte di cubi
- I **blocchi interni non aggiungono resistenza** — conta solo il guscio esterno, quindi riempi gli interni come necessario
- Le travi del telaio sono aerodinamicamente invisibili — usale liberamente per la struttura interna

### Costruire ali efficaci
- Le ali devono essere lunghe **almeno 4 metri**, spesse **meno di 0,3 metri**
- Un'apertura alare piu ampia (larghezza ≥ lunghezza/4) assicura che la superficie sia classificata come superficie portante piuttosto che come superficie di resistenza

### Progettazione di imbarcazioni
- I blocchi **Composite** (rapporto 0,2) offrono il miglior equilibrio galleggiabilita-peso per il galleggiamento
- **Steel e Aluminium** (rapporto 0,01) contribuiscono appena alla galleggiabilita — usali con parsimonia nelle barche
- **Lead** (rapporto 1,0) sposta la maggior quantita di fluido, ma a 150 kg per unita affondera rapidamente
- Lo smorzamento dell'acqua stabilizza naturalmente la tua imbarcazione — scafi larghi e piatti sono i piu stabili

### Posizionamento dei Propeller
- L'**effetto suolo** aumenta la spinta fino al 50% quando si e vicini al terreno — utile per i design di hovercraft
- I Propeller generano **coppia giroscopica** — coppie di Propeller contro-rotanti annullano questo effetto
- I Propeller funzionano sia in aria che in acqua, adattando la loro spinta in base alla densita e alla viscosita del fluido
