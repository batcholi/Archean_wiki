# Visual Nodes Editor
L'editor di nodi del XenonCode IDE offre una vasta gamma di nodi per aiutarti a creare script e programmi.

E' abbastanza completo per gestire compiti complessi ed e' anche piu' facile da comprendere per i principianti. Per possibilita' ancora piu' avanzate, puoi anche usare [XenonCode](documentation.md) in modalita' testo (codice).

---
## Code generation

Il sistema Visual Nodes generera' sempre automaticamente codice in background man mano che fai modifiche.
Il codice viene generato ogni volta che viene aggiunto un nodo endpoint `output`, `print` o `execute`, e retro-propaghera' attraverso le dipendenze di input.
Questo significa che aggiungere un nodo input non generera' alcun codice, ma aggiungere un nodo output generera' il codice per entrambi i nodi quando li connetti insieme.

---
## List of nodes

Ecco una lista dei diversi tipi di nodi disponibili nell'editor, con le relative descrizioni se necessario:

`Constant Number` Definisce un valore numerico costante.

`Constant Text` Definisce un valore testuale costante.

`Variable Number` Definisce un valore numerico variabile che puo' essere definito e reimpostato da un altro nodo.

`Variable Text` Definisce un valore testuale variabile che puo' essere definito e reimpostato da un altro nodo.

`Comment` Permette di visualizzare un blocco commento nel tuo script.

---
### Input
`By Alias` Usa un nodo output di un componente usando il suo alias quando si comunica attraverso un Router.

`0,1,2,3...` Usa un nodo output di un componente attualmente connesso a una porta del computer. Quando connetti un componente a una porta, viene automaticamente rilevato dal computer.

---
### Output
`Print (Console log)` Visualizza un numero/testo nella console del computer.

`By Alias` Usa un nodo input di un componente usando il suo alias quando si comunica attraverso un Router.

`0,1,2,3...` Usa un nodo input di un componente attualmente connesso a una porta del computer. Quando connetti un componente a una porta, viene automaticamente rilevato dal computer.

---
### Math
I nodi Math possono avere piu' di due input, permettendoti di concatenare piu' valori in una singola operazione.

`Add` Restituisce l'addizione di due o piu' valori.

`Subtract` Restituisce la sottrazione di due o piu' valori.

`Multiply` Restituisce il prodotto di due o piu' valori.

`Divide` Restituisce la divisione di due o piu' valori.

`Absolute` Restituisce il valore assoluto di un numero.

`Negative` Restituisce il valore negativo di un numero.

`Modulo` Restituisce il resto della divisione di due numeri.

`Floor` Restituisce il valore arrotondato per difetto all'intero piu' vicino.

`Ceil` Restituisce il valore arrotondato per eccesso all'intero piu' vicino.

`Round` Restituisce il valore arrotondato all'intero piu' vicino.

`Fract` Restituisce la parte decimale di un numero.

`Sign` Restituisce il segno di un numero.

`Pow` Restituisce la potenza di due numeri.

`Log` Restituisce il logaritmo di un numero.

`Sqrt` Restituisce la radice quadrata di un numero.

`Clamp` Restituisce il valore di un numero limitato tra un minimo e un massimo.

`Step` Restituisce 0 se il valore e' inferiore a una soglia e 1 se e' superiore.

`Smoothstep` Restituisce un'interpolazione liscia e limitata tra due valori basata su un rapporto.

`Lerp` Restituisce un'interpolazione lineare tra due valori basata su un rapporto.

`Sin` Restituisce il seno di un angolo (dato in radianti).

`Cos` Restituisce il coseno di un angolo (dato in radianti).

`Tan` Restituisce la tangente di un angolo (dato in radianti).

`Asin` Restituisce l'angolo arcoseno in radianti di un numero.

`Acos` Restituisce l'angolo arcocoseno in radianti di un numero.

`Atan` Restituisce l'angolo arcotangente in radianti di un numero.

---
### Boolean
I valori booleani sono rappresentati come valori numerici. 0 significa Falso, qualsiasi altro valore significa Vero.
I nodi Boolean possono avere piu' di due input, permettendoti di concatenare piu' condizioni in una singola operazione.

`And` Restituisce 1 se tutti i valori sono Veri.

`Or` Restituisce 1 se uno qualsiasi dei valori e' Vero.

`Xor` Restituisce 1 se un numero dispari di valori e' Vero.

`Not` Restituisce l'opposto di un dato valore booleano.

---
### Compare
`Equal` Confronta se due valori sono uguali e restituisce un booleano (0 o 1).

`Greater` Confronta se un valore e' maggiore di un altro e restituisce un booleano (0 o 1).

`Lesser` Confronta se un valore e' minore di un altro e restituisce un booleano (0 o 1).

---
### Functions
`Expression` Permette di scrivere un'espressione matematica piu' avanzata usando funzioni XenonCode e/o algebra.

`Switch` Restituisce valori diversi a seconda del valore di input.

`Counter` Restituisce un contatore che si incrementa ad ogni chiamata. Il valore iniziale, minimo e massimo possono essere definiti.

`Pulse` Restituisce 1 quando il suo valore di input e' cambiato.

`PulseToggle` Restituisce un booleano che alterna tra Vero/Falso ogni volta che il suo valore di input e' cambiato.

`Text` Permette di scrivere un'espressione testuale piu' avanzata.

`PID Controller` Restituisce un valore di controllo PID basato sull'errore, l'integrale dell'errore e la derivata dell'errore.

`Unit Converter` Converte un valore tra unita' fisiche comuni della stessa categoria. Categorie supportate: Angle (Radians, Degrees), Rotation (RPS, RPM), Speed (m/s, km/h, mph, ft/s, knots), Temperature (Kelvin, Celsius, Fahrenheit), Pressure (Pascal, bar, psi, atm), Force (Newton, lbf, kgf).

---
### Execution
`Statement` Permette di scrivere un'istruzione XenonCode pura come una chiamata di funzione. Deve avere come output un nodo Conditional o Execute.

`Conditional` Considera l'istruzione data solo se la condizione data e' Vera. Puo' essere concatenato con altri condizionali.

`Execute` Esegue le istruzioni connesse in ordine dall'alto verso il basso.

`Include` Include un altro script XenonCode nello script corrente. Assicurati che i tuoi nodi variabili e costanti abbiano nomi unici.

---
### Timing

`Time` Restituisce il Timestamp Unix corrente in unita' di secondi, con decimali con precisione al microsecondo.

`Delay` Restituisce un booleano 1 dopo un dato ritardo in secondi dopo che l'input Set ha ricevuto un cambiamento da 1 a 0.

`Blinker` Restituisce un booleano alternato tra 0 e 1 che cambia ad ogni intervallo di tempo definito in secondi.

`Smooth` Restituisce un valore che interpola dal target precedente (o 0) al valore target corrente con una durata data in secondi dopo che l'input Start ha ricevuto un cambiamento da 1 a 0.
