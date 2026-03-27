# XenonCode - Documentation

**XenonCode** e' un linguaggio di programmazione leggero progettato come scripting di alto livello all'interno dei giochi per dispositivi di calcolo virtuali (ad esempio: un computer programmabile all'interno di un gioco).

# Capabilities

- Variabili tipizzate
- Costanti
- Array dinamici
- Vettori e Matrici (fino a 4x4) con swizzling
- Operazioni aritmetiche standard su valori numerici
- Concatenazione e formattazione semplice di stringhe
- Funzioni definite dall'utente
- Funzioni e oggetti definiti dal dispositivo
- Funzioni trailing/membro
- Funzioni matematiche standard integrate
- Operazioni IO integrate tra dispositivi virtuali
- Oggetti chiave-valore integrati
- Funzioni a intervallo sincronizzato (timer)
- Condizionali `if`/`elseif`/`else`
- Cicli `while`
- Cicli `foreach` per array
- Cicli `repeat n`
- Cicli `for` con indice iniziale e finale

# Sample code

```xc
include "my_functions.xc"

; Declare global storage
storage var $myStorageVar : number
storage array $myStorageArray : number

; Declare global variables
var $myVar = 0
var $myVar2 = "Hello World"
var $myVar3 : number
var $myVar4 : text
array $myArray : number
array $myArray2 : text

; Declare a user-defined function that changes the values of $myVar and $myVar2
function @myFunction($arg1 : number, $arg2 : text)
	$myVar = $arg1
	$myVar2 = $arg2

; Declare a user-defined function that returns a value
function @myFunction2($arg1 : number, $arg2 : text) : number
	return $arg1 + size($arg2)

init
	; Call a user-defined function
	@myFunction(1, "Hello")

	; Call a trailing function
	$myVar.@myFunction2("Hey")

	; Add values to an array
	$myArray.append(1)
	$myArray.append(5)
	$myArray.append(0)

	; Sort an array
	$myArray.sort()

	; Iterate over an array
	foreach $myArray ($index, $item)
		$myVar4 &= $index:text & ": " & $item:text & ", "

	; Output to a virtual device (ie: a console at input port 0)
	output.0 ($myVar4)
	output.0 (text("Sum of values in the array: {}", $myArray.sum))
	output.1 ($myArray.0:text)
	output.1 ($myArray.1:text)
	var $index = 2
	output.1 ($myArray.$index:text)
	
	; Repeat a statement three times
	repeat 3 ($i)
		output.1 ($i)

	; for loops
	for 3,8 ($i)
		; value of $i will go from 3 to 8 inclusively
	
```

## Types of developer

1. `User`: La persona che usa questo linguaggio per scrivere uno script, tipicamente un giocatore in un gioco.
2. `Device`: L'implementazione che definisce le capacita' e le funzioni disponibili, tipicamente un tipo specifico di dispositivo virtuale programmabile in un gioco specifico.

# Syntax

XenonCode e' progettato con una sintassi molto basica in mente e una struttura molto precisa.

- Ogni istruzione deve essere breve e facile da leggere
- Pochissimi caratteri speciali necessari
- Meno criptico della maggior parte degli altri linguaggi
- Le indentazioni definiscono lo scope (SOLO tabulazioni, nessuna ambiguita')
- Una singola istruzione per riga
- L'indicizzazione degli array, come nella maggior parte degli altri linguaggi di programmazione, e' basata su 0 ma usa la notazione con punto `arr.0` invece della tipica notazione con parentesi quadre `arr[0]`
- 100% case-insensitive
- Un'implementazione puo' definire funzioni, oggetti e punti di ingresso personalizzati del "Device"

### Types

XenonCode e' un linguaggio tipizzato, ma include solo due tipi generici, oltre ad array di entrambi, e oggetti definiti dall'implementazione.

Tipi di dati generici che l'utente puo' dichiarare:
- `number`
- `text`
- `vecN` (vettore numerico a dimensione fissa, es. `vec3`)
- `matNxM` (matrice numerica a dimensione fissa, es. `mat4x4`)

Una variabile `number` e' internamente sempre un numero in virgola mobile a 64 bit, ma puo' anche fungere da booleano quando il suo valore e' 1 o 0 (vero o falso), sebbene qualsiasi valore diverso da zero sia valutato come vero.

Le variabili `text` contengono testo unicode semplice, anche se la loro dimensione massima dipende dall'implementazione.
Un letterale di testo e' definito tra virgolette doppie `" "`.
Per usare caratteri virgolette doppie all'interno del testo, puoi duplicarli.
Non esiste altro meccanismo di sequenza di escape. Un backslash `\` e' semplicemente parte della stringa, e l'implementazione puo' decidere di usarlo per sequenze di escape.
```xc
var $myText = "Say ""Hello"" to this text"
```

I tipi oggetto sono per uso dell'implementazione e sono opachi per l'utente, il che significa che la loro struttura non e' necessariamente definita, tuttavia l'implementazione puo' rendere disponibili alcune funzioni membro per quegli oggetti all'utente.

Anche se questo e' un linguaggio tipizzato, specificare il tipo non e' necessario quando puo' essere dedotto automaticamente dal compilatore durante l'inizializzazione. Il tipo dovrebbe essere specificato solo quando non c'e' inizializzazione.

Tutte le parole definite dall'utente devono iniziare con un carattere prefisso:
- `$` per le variabili
- `@` per le funzioni

### Comments

I commenti sono righe che iniziano con `;`
Un'istruzione di codice puo' anche terminare con un commento finale
NOTA: `//` e' deprecato e NON dovrebbe essere usato.

# Limitations
Questo linguaggio e' progettato per essere potenzialmente eseguito lato server nel contesto di un gioco multiplayer, pertanto per ragioni di sicurezza e prestazioni ci sono limiti a cio' che gli utenti possono fare.

- Nessun tipo puntatore ne' riferimento (eccetto per gli oggetti definiti dall'implementazione, che devono essere sanificati dall'implementazione a runtime)
- Il numero di istruzioni per ciclo puo' essere limitato, e un overflow puo' causare un crash virtuale per l'utente
- Gli array possono essere limitati in dimensione a runtime, e un overflow puo' provocare un crash virtuale per l'utente
- Lo stack ricorsivo (chiamare una funzione ricorsivamente) e' consentito con una sintassi specifica ed e' limitato a 16 ricorsioni
- Le funzioni DEVONO essere completamente definite PRIMA del loro utilizzo, quindi l'ordine di definizione e' importante (questo e' cio' che impone il punto precedente)

### Per-Virtual-Computer limitations
Queste sono definite per implementazione e possono includere varianti multiple o essere personalizzabili dall'utente

- ROM (dimensione massima del programma compilato come numero di parole a 32 bit)
- RAM (numero massimo di variabili locali, globali e tmp piu' tutti gli array locali e globali moltiplicati per la loro dimensione)
- STORAGE (numero massimo di variabili storage piu' tutti gli array storage moltiplicati per la loro dimensione)
- Frequency (frequenza massima per le funzioni timer e la lettura degli input)
- Ports (numero massimo di input/output)
- IPC (istruzioni massime per ciclo, una riga di codice puo' contare come istruzioni multiple)

### Operation on data
- Tutte le funzioni, inclusi i timer, sono eseguite atomicamente, prevenendo qualsiasi data-race
- Gli argomenti delle funzioni sono sempre passati per copia, una funzione NON PUO' modificare le variabili inserite nella sua lista di argomenti
- Le funzioni trailing MODIFICANO il valore della variabile iniziale
- Le assegnazioni di variabili copiano sempre il valore per i tipi generici
- Gli oggetti definiti dall'implementazione sono sempre passati per riferimento
- Gli oggetti definiti dall'implementazione non possono essere copiati a meno che l'implementazione non fornisca tale funzionalita' attraverso una funzione del dispositivo
- Le divisioni per zero risultano in un errore a runtime. E' responsabilita' dell'utente assicurarsi di tenerne conto.

### Basic rules
- Le variabili possono essere dichiarate usando `var` e opzionalmente assegnate un valore iniziale, altrimenti viene usato il valore generico predefinito (0 per number e "" per text)
- Le variabili oggetto devono essere assegnate alla dichiarazione usando un costruttore o una funzione del dispositivo che restituisce un oggetto di quel tipo
- Iniziare un'istruzione con un nome di variabile (che inizia con `$`) significa che stiamo modificando il suo valore
- Se la parola successiva dopo un'assegnazione di variabile e' `=`, allora il risultato dell'espressione seguente verra' assegnato come suo valore
- Se la parola successiva dopo un'assegnazione di variabile e' un punto e una funzione, questa chiamata di funzione e' considerata una funzione trailing
- Chiamare una funzione trailing MODIFICA il valore della variabile iniziale che viene anche usata come primo argomento della funzione, il quale deve essere omesso dalla lista degli argomenti quando la si chiama
- Iniziare un'istruzione con un nome di funzione (che inizia con `@` per le funzioni definite dall'utente) significa che stiamo chiamando questa funzione e scartando il suo valore di ritorno
- Chiamare una funzione non MODIFICHERA' MAI il valore di nessuno dei suoi argomenti di tipo generico passati tra parentesi, i tipi generici sono sempre passati per copia
- Qualsiasi cosa tra parentesi che non e' preceduta da un nome di funzione e' considerata un'espressione separata, le espressioni interne piu' a sinistra sono calcolate per prime
- Si applicano le regole tipiche per la precedenza matematica degli operatori

# Valid usage

XenonCode e' progettato per essere compilato come byteCode che e' molto veloce da analizzare dal gioco host a runtime.

## Each line must begin with one of the following first words (with examples):

### Global scope
- `include` Importa il contenuto di un altro file
- `const` dichiara una costante globale
- `var` dichiara una variabile globale
- `array` dichiara un array globale
- `storage` dichiara una variabile o array di storage, che sara' persistente tra i cicli di accensione
- `init` Definisce il corpo della funzione init, che verra' eseguita una volta quando il dispositivo viene acceso
- `tick` dichiara il corpo della funzione tick che verra' eseguita ad ogni ciclo di clock
- `function` dichiara una funzione definita dall'utente
- `recursive function` dichiara una funzione definita dall'utente che puo' chiamare se stessa ricorsivamente
- `timer` Definisce il corpo di una funzione che verra' eseguita ripetutamente a una frequenza specifica in Hz
- `input` Definisce una funzione di input
- `;` Commenti
- un punto di ingresso definito dall'implementazione
- una o piu' tabulazioni, significa che siamo all'interno del corpo di una funzione, poi si applicano le seguenti regole:

### Function body / Entry point
- `var` Dichiara una nuova variabile in questo scope locale (non accessibile dall'esterno di questa funzione)
- `array` Dichiara un nuovo array in questo scope locale (non accessibile dall'esterno di questa funzione)
- `$` Per assegnare un nuovo valore a una variabile esistente
- `@` Per chiamare una funzione definita dall'utente
- `output` Funzione integrata per inviare dati a un altro dispositivo attraverso una porta specifica
- `foreach` scorre tutti gli elementi di un array
- `repeat` ripete un blocco di codice n volte
- `while` ripete finche' una condizione e' vera
- `for` ripete un blocco di codice, dato un indice iniziale e finale
- `break` interrompe un ciclo come se avesse completato tutte le iterazioni
- `continue` interrompe questa iterazione di un ciclo e passa immediatamente alla successiva
- `if` esegue un blocco di codice se una condizione e' vera
- `elseif` dopo un if, quando la condizione iniziale finora e' falsa e una nuova condizione e' vera
- `else` dopo un if, quando tutte le condizioni sono false
- `return` interrompe l'esecuzione di questa funzione e restituisce un valore al chiamante

## Reserved keywords
Poiche' tutte le parole definite dall'utente devono iniziare con `$` o `@`, non c'e' bisogno di parole riservate.
L'implementazione/dispositivo deve fare attenzione a definire solo nomi di funzioni e tipi di oggetti che non entrino in conflitto con le parole chiave integrate per la versione di XenonCode che stanno usando.

## Declaring a constant
Le costanti sono valori con nome che non dovrebbero mai cambiare durante l'esecuzione di un programma. Sono valori fissi definiti a tempo di compilazione.
I valori assegnati devono essere forniti esplicitamente e devono essere espressioni il cui risultato puo' essere determinato a tempo di compilazione.

`const $stuff = 5` dichiara una costante chiamata $stuff con il numero 5 come valore
`const $stuff = "hello"` dichiara una costante chiamata $stuff con il testo "hello" come valore

## Declaring a variable
Le variabili sono valori con nome che possono cambiare durante l'esecuzione di un programma.
Possiamo o meno assegnare loro un valore iniziale.
Se non assegniamo un valore iniziale, viene usato il valore generico predefinito e dobbiamo fornire un tipo.
Una variabile e' accessibile solo all'interno dello scope in cui e' stata dichiarata. Per esempio, se dichiariamo una variabile all'inizio di una funzione, e' disponibile in tutta la funzione. Se dichiariamo una variabile all'interno di un blocco if, e' disponibile solo all'interno di quel blocco, fino al corrispondente `else`, `elseif` o fino al ritorno allo scope genitore.
Una variabile dichiarata nello scope globale e' accessibile da ovunque.
Per le variabili dichiarate nello scope globale, quando assegniamo un valore iniziale, l'espressione data deve essere determinabile a tempo di compilazione.
I nomi delle variabili devono iniziare con una lettera o underscore (`a`-`z` o `_`) poi devono contenere solo caratteri alfanumerici e underscore.

`var $stuff = 5` dichiara una variabile numerica con valore iniziale impostato a 5 all'avvio del programma
`var $stuff = "hello"` dichiara una variabile testo con valore iniziale impostato a "hello" all'avvio del programma
`var $stuff:number` dichiara una variabile numerica con valore iniziale impostato a 0 all'avvio del programma
`var $stuff:text` dichiara una variabile testo con valore iniziale impostato a "" all'avvio del programma
`var $stuff = position()` dichiara un'istanza di un tipo oggetto definito dall'implementazione di tipo `position` (questo e' un esempio)

Gli oggetti definiti dall'implementazione non possono essere dichiarati senza inizializzazione, poiche' non hanno un valore predefinito.

## Assigning a new value to a variable
Per assegnare un nuovo valore a una variabile, possiamo semplicemente iniziare un'istruzione con il nome della variabile seguito da `=` e un'espressione il cui risultato sara' il nuovo valore.
Possiamo anche usare una funzione trailing che modifichera' intrinsecamente il valore della variabile.

`$stuff = 5` assegna il valore 5 alla variabile chiamata $stuff
`$stuff = $other + 5` assegna il risultato dell'espressione ($other + 5) alla variabile chiamata $stuff
`$stuff.round()` chiama una funzione trailing che arrotonda il valore della variabile

## Declaring an array
Un array e' una lista dinamica di valori di un certo tipo. Possiamo aggiungere o cancellare valori, accedere a un valore specifico dalla lista, o scorrere tutti i suoi valori.
Quando dichiariamo un array, non possiamo specificare un valore iniziale e dobbiamo fornire un tipo.
Gli array sono inizializzati con dimensione zero all'avvio del programma, i valori possono essere aggiunti/cancellati/modificati durante l'esecuzione del programma

`array $stuff:number` dichiara un array di numeri
`array $stuff:text` dichiara un array di testi

Gli array non possono contenere oggetti definiti dall'implementazione, solo tipi generici.

## Vettori e Matrici

I vettori e le matrici sono contenitori a dimensione fissa di numeri in virgola mobile a 64 bit, utili per posizioni, trasformazioni e algebra lineare. Tutti gli elementi sono inizializzati a zero.

### Dichiarazione

Usare `vecN` per i vettori (1D) e `matNxM` per le matrici 2D, con dimensioni fino a 4.

```xc
var $position : vec3       ; vettore a 3 elementi (vec2, vec3, vec4 disponibili)
var $transform : mat4x4    ; matrice 4x4
var $rotation : mat3       ; abbreviazione per mat3x3
```

| Tipo | Abbreviazione | Descrizione |
|------|---------------|-------------|
| `vec2`, `vec3`, `vec4` | -- | Vettori con 2, 3 o 4 elementi |
| `matNxM` | -- | Matrice 2D con N righe e M colonne (es. `mat3x4`) |
| `matN` | `matNxN` | Abbreviazione per matrice quadrata (es. `mat3` = `mat3x3`) |

### Accesso ai componenti

Accedere agli elementi usando `.x`, `.y`, `.z`, `.w` o equivalentemente `.0`, `.1`, `.2`, `.3`.

**Vettori** -- ogni accessore si riferisce a un singolo elemento:
```xc
var $v : vec3
$v.x = 1       ; elemento 0
$v.y = 2       ; elemento 1
$v.z = 3       ; elemento 2
$v.0 = 1       ; uguale a .x
```

**Matrici 2D** -- il primo accessore seleziona una riga, il secondo seleziona una colonna all'interno di quella riga:
```xc
var $m : mat4x4
$m.0.x = 1     ; riga 0, colonna 0
$m.1.y = 1     ; riga 1, colonna 1
$m.w.w = 1     ; riga 3, colonna 3 (uguale a $m.3.3)
```

### Swizzling

Combinare 2-4 nomi di componenti da `xyzw` per estrarre piu' elementi contemporaneamente in un nuovo vettore:
```xc
var $v : vec3
$v.x = 10
$v.y = 20
$v.z = 30
var $a : vec2
$a = $v.xy         ; vec2 contenente (10, 20)
var $b : vec2
$b = $v.zx         ; vec2 contenente (30, 10)
```
Lo swizzling produce sempre una **copia** -- modificare il risultato non influisce sull'originale.

### Aritmetica

Operazioni **elemento per elemento** tra vettori/matrici della stessa dimensione:
```xc
var $a : vec3
var $b : vec3
var $c : vec3
$c = $a + $b       ; addizione elemento per elemento
$c = $a - $b       ; sottrazione elemento per elemento
```

La moltiplicazione e la divisione **scalare** scalano ogni elemento:
```xc
$c = $a * 2        ; moltiplica tutti gli elementi per 2
$c = $a / 2        ; divide tutti gli elementi per 2
```

**Moltiplicazione matriciale** con `*` quando le dimensioni sono compatibili:
```xc
var $m : mat3x3
var $v : vec3
var $result : vec3
$result = $m * $v  ; matrice 3x3 per vettore 3x1 = vettore 3x1
```

Anche gli operatori di **assegnazione composta** funzionano: `+=`, `-=`, `*=`, `/=`

### Funzioni trailing (sul posto)

Queste modificano direttamente il vettore o la matrice e non restituiscono un valore.

| Funzione | Si applica a | Descrizione |
|----------|--------------|-------------|
| `.normalize()` | vettori | Scalare a lunghezza unitaria |
| `.cross($other)` | vec3 | Memorizzare il prodotto vettoriale di se' e `$other` in se' |
| `.transpose()` | matrici quadrate | Trasporre sul posto |
| `.inverse()` | matrici quadrate | Invertire sul posto |
| `.identity()` | matrici quadrate | Impostare come matrice identita' |
| `.lerp($other, $t)` | vettori / matrici | Interpolare verso `$other` per fattore `$t` |

```xc
var $dir : vec3
$dir.x = 3
$dir.y = 4
$dir.normalize()   ; $dir e' ora un vettore unitario
```

### Funzioni standard (restituiscono un nuovo valore)

Queste non modificano i loro argomenti. Le funzioni che restituiscono un singolo numero sono contrassegnate come *scalare*.

| Funzione | Restituisce | Descrizione |
|----------|-------------|-------------|
| `length($v)` | scalare | Magnitudine di un vettore |
| `distance($a, $b)` | scalare | Distanza euclidea tra due vettori |
| `dot($a, $b)` | scalare | Prodotto scalare di due vettori |
| `angle($a, $b)` | scalare | Angolo tra due vettori in radianti |
| `cross($a, $b)` | vec3 | Prodotto vettoriale di due vettori vec3 |
| `determinant($m)` | scalare | Determinante di una matrice quadrata |
| `normalize($v)` | stesso tipo | Copia normalizzata di un vettore |
| `transpose($m)` | stesso tipo | Copia trasposta di una matrice quadrata |
| `inverse($m)` | stesso tipo | Copia invertita di una matrice quadrata |
| `lerp($a, $b, $t)` | stesso tipo | Copia interpolata tra `$a` e `$b` per fattore `$t` |

### Passaggio alle funzioni

I vettori e le matrici possono essere usati come tipi di argomento e di ritorno delle funzioni:
```xc
function @scale($v : vec3, $factor : number) : vec3
	return $v * $factor

var $result : vec3
$result = @scale($myVec, 2.5)
```

## Declaring storage
Lo storage viene usato per mantenere alcuni dati persistenti tra i cicli di accensione e anche attraverso una ricompilazione.
Possiamo dichiarare variabili e array di storage di tipo number o text.
Lo storage dovrebbe essere dichiarato SOLO nello scope globale.
```xc
storage var $stuff:number
storage var $stuff:text
storage array $stuff:number
storage array $stuff:text
```

## Accessing/Assigning the nth item within an array
Per accedere o modificare il valore di un elemento specifico in un array, dobbiamo usare l'operatore trail `.` seguito dall'indice basato su 0 dell'elemento o una variabile contenente quell'indice
`$stuff.0 = 5` Assegna il valore 5 al primo elemento dell'array
`$stuff.$index = 5` Assegna il valore 5 all'elemento con un indice definito dal valore di $index
`$value = $stuff.1` Assegna il valore del secondo elemento dell'array alla variabile $value

## Accessing/Assigning the nth character within a text variable
Le variabili testo funzionano in modo molto simile agli array. Possiamo usare l'operatore trail `.` per accedere o modificare il valore di caratteri specifici all'interno di un testo.
`$myText.0 = "a"` Imposta "a" come primo carattere di $myText

### Key-Value objects

XenonCode supporta il proprio tipo chiave-valore che e' sempre memorizzato come testo.
Dichiara semplicemente una variabile testo e assegna/leggi i suoi membri usando la chiave come membro trailing
```xc
var $myObject = ".a{5}.b{8}" ; you can use the serialization format like so, but you don't have to, you may simply start with an empty text and assign the members one by one
print($myObject.a) ; will print 5
$myObject.b += 2 ; adds 2 to b which was 8 and will now be 10
```

## The Init function
Il corpo della funzione Init verra' eseguito per primo ogni volta che il computer virtuale viene acceso.
La funzione init non puo' essere chiamata dall'utente. Puo' solo essere definita, e il dispositivo la chiamara' automaticamente all'avvio virtuale.
```xc
init
    $stuff = 5
    @func1()
    ;...
```

## Tick function
La funzione tick viene eseguita all'inizio di ogni ciclo di clock di questo computer virtuale.
La funzione tick non puo' essere chiamata dall'utente. Puo' solo essere definita, e il dispositivo la chiamara' automaticamente ad ogni ciclo.
```xc
tick
    ; This body is executed once per clock cycle at the virtual computer's frequency
```

## Timer functions
Le funzioni timer vengono eseguite a un intervallo o frequenza specificati, ma al massimo una volta per ciclo di clock.
Possiamo specificare un `interval` come ogni N secondi o una `frequency` come N volte al secondo.
Le funzioni timer non possono essere chiamate dall'utente. Possono solo essere definite, e il dispositivo le chiamara' automaticamente al momento appropriato.
```xc
timer frequency 4
    ; stuff here runs 4 times per second
timer interval 2
    ; stuff here runs once every 2 seconds
```
Nota: Se la velocita' di clock del computer virtuale e' piu' lenta dell'intervallo o della frequenza indicati, quella funzione timer non funzionera' correttamente all'intervallo o alla frequenza specificati, e potrebbe essere eseguita ad ogni ciclo di clock.

## Input
I punti di ingresso input sono un modo per accedere alle informazioni ricevute da un altro dispositivo.
Possono essere eseguiti un numero qualsiasi di volte per ciclo di clock, a seconda di quanti dati sono stati ricevuti dal ciclo di clock precedente. L'implementazione puo' decidere di eseguirlo una sola volta per ciclo usando solo gli ultimi dati ricevuti.
I dispositivi possono avere un limite superiore nel buffer di ricezione che definisce il numero massimo di volte in cui la funzione input puo' essere chiamata per ciclo di clock.
Se quel limite e' stato raggiunto, solo gli ultimi N valori saranno mantenuti nel buffer.
I punti di ingresso input sono come funzioni definite dall'utente, contengono argomenti, ma nessun valore di ritorno, e dobbiamo anche specificare un indice di porta.
L'indice di porta deve essere specificato dopo la parola chiave input e un operatore trail `.`
L'indice di porta puo' essere specificato anche tramite una costante (deve essere noto a tempo di compilazione).
Gli argomenti della funzione devono essere circondati da parentesi e i loro tipi devono essere specificati.
I punti di ingresso non possono essere chiamati direttamente dall'utente. Possono solo essere definiti, poi il dispositivo li chiamara' automaticamente se sono stati ricevuti dati, alla fine di un ciclo di clock.
```xc
input.0 ($arg1:number, $arg2:text)
    $stuff = $arg1
input.$myPortIndex ($arg1:number, $arg2:text)
    $stuff = $arg1
```

## Output
La funzione output e' il modo in cui inviamo dati a un altro dispositivo. Questa funzione e' pensata per essere chiamata come istruzione, e non puo' essere usata nello scope globale come le funzioni input.
Dobbiamo anche passare l'indice di porta come facciamo con la funzione input, e puo' anche essere specificato tramite una costante nota a tempo di compilazione.
Dobbiamo passare una lista di argomenti tra parentesi (o un set vuoto di parentesi).
`output.0 ($stuff, $moreStuff)`

## If Elseif Else
Come nella maggior parte dei linguaggi di programmazione, possiamo usare i condizionali.
```xc
if $stuff == 5
    ; then run this
elseif $stuff == 6
    ; then run that instead
else
    ; all previous conditions evaluate to false, then run this instead
```

## Foreach loops
Questo scorre tutti gli elementi di un array.
Il blocco di codice sotto quell'istruzione di ciclo verra' eseguito per ogni elemento nell'array, uno per uno.
```xc
foreach $stuff ($index, $item)
    ; we loop through the array $stuff, and we define $index which contains the 0-based index of this item and $item for the current item's value
    ; note that $item is a copy of its value, so modifying the value of $item will not affect the original array $stuff
    ; if we want to persist the modified $item value into the original array, we can use $index to index the element from the array like so:
    $stuff.$index = $item
    ; CAUTION: $index is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Puoi anche usare il ciclo foreach con oggetti chiave-valore
```xc
foreach $obj ($key, $value)
    print($key)
    print($value)
```

## Repeat loops
Questo ciclo ripetera' l'esecuzione del blocco seguente un dato numero di volte.
```xc
repeat 5 ($i)
    ; this block will be repeated 5 times, and $i is the 0-based index of this iteration (first time will be 0, last will be 4)
    ; CAUTION: $i is a reference used internally for the loop, don't modify its value unless you actually want to affect the loop
```
Il numero di volte (sopra specificato come 5) puo' anche essere specificato tramite una variabile o una costante, ma non un'espressione

## For loops
Questo ciclo e' simile a repeat ma prende un indice iniziale e finale invece di un numero di ripetizioni
```xc
for 3,8 ($i)
	; $i will start at 3, and end with 8, inclusively, for a total of 6
```

## While loops
Questo ciclo eseguira' il blocco seguente finche' la condizione data e' vera.
```xc
while $stuff < 5
    $stuff++
```

## Break
Questa parola chiave viene usata per interrompere un ciclo come se avesse completato tutte le sue iterazioni.
```xc
while $stuff < 5
    $stuff++
    if $stuff == 3
        break
```

## Continue
Questa parola chiave viene usata per interrompere questa iterazione di un ciclo e passare immediatamente alla successiva.
```xc
while $stuff < 5
    $stuff++
    if $stuff == 2
        continue
```

## Math Operators
- `+` addizione
- `-` sottrazione
- `*` moltiplicazione
- `/` divisione
- `%` modulo
- `^` potenza

## Trailing Operators
- `++` incrementa il valore della variabile
- `--` decrementa il valore della variabile
- `!!` inverte il valore della variabile (se il valore e' `0`, lo imposta a `1`, altrimenti a `0`)

## Assignment operators
- `=` assegna direttamente il valore seguente

I seguenti operatori calcolano l'operazione matematica appropriata tra la variabile iniziale e l'espressione seguente, poi assegnano il risultato alla variabile iniziale.
- `+=` addizione
- `-=` sottrazione
- `*=` moltiplicazione
- `/=` divisione
- `%=` modulo
- `^=` alla potenza
- `&=` concatena testo

## Conditional Operators
- `==` uguale a
- `<>` o `!=` diverso da
- `>` maggiore di
- `<` minore di
- `<=` minore o uguale a
- `>=` maggiore o uguale a
- `&&` o `and` AND condizionale
- `||` o `or` OR condizionale
- `xor` e' anche disponibile, equivalente a (!!a != !!b)

## Other operators
- `.` (operatore trail) fa riferimento a un sotto-elemento di un array o testo o chiama una funzione trailing sulla variabile iniziale, o un membro di un oggetto
- `:` (operatore typecast) converte in un altro tipo
- `&` (operatore concat) concatena testi
- `!` (operatore not) inverte un valore o espressione booleana (i numeri diversi da zero diventano 0, e 0 diventa 1)

## Casting (parse variables as another type)

Per convertire una variabile esistente in un altro tipo, basta aggiungere i due punti e il tipo, cosi':
```xc
$someTextValue = $someNumberValue:text
```
Questo funziona solo con i tipi generici `number` e `text`, non con array o oggetti.

## String concatenation

Per concatenare testi, basta separare tutti i valori/variabili testo con l'operatore concat `&` nella stessa assegnazione (non dimenticare di convertire in text se necessario).
```xc
$someTextVar = "Hello, " & $someName & "!, My age is " & $age:text & " and I have all my teeth"
```

## Include
Potresti voler dividere il tuo progetto in piu' file sorgente.
Per farlo, puoi inserire del codice in un altro file `.xc` e usare la parola chiave `include` nel file genitore.
```xc
include "test.xc"
```
Questo e' effettivamente lo stesso che prendere tutte le righe da `test.xc` e inserirle nel file corrente dove si trova l'`include`.
Questo puo' essere fatto su piu' livelli, assicurati solo che un file non includa se stesso, direttamente o indirettamente, nel qual caso le definizioni al suo interno entreranno in conflitto e risulteranno in un errore di compilazione.

# User-Defined Functions

Le funzioni definiscono un gruppo di operazioni che possiamo chiamare una o piu' volte durante l'esecuzione del programma.

Le operazioni da eseguire in una funzione appaiono nel suo corpo.

Le funzioni possono avere argomenti che possono essere usati nel corpo in modo che le operazioni possano avere una variazione a seconda del valore di alcune variabili.

Gli argomenti delle funzioni sono definiti dopo il nome della funzione, tra parentesi e possono essere di tipo `number`, `text`, o oggetto definito dall'implementazione.

I nomi delle funzioni hanno le stesse regole dei nomi delle variabili.

NOTA: Le funzioni DEVONO essere completamente definite prima del loro utilizzo. Questo significa che l'ordine di dichiarazione delle funzioni e' importante e possiamo solo chiamare una funzione che e' stata dichiarata SOPRA il chiamante e una funzione NON PUO' chiamare se stessa. Questo impone la regola "no-stack-recursion".

### Declaration

Ecco alcuni esempi di dichiarazione di funzioni

Questa funzione prende un singolo argomento numerico:
```xc
function @func0 ($var1:number)
```

Questa funzione prende due argomenti numerici:
```xc
function @func1 ($var1:number, $var2:number)
```

Questa funzione prende un argomento numerico e un argomento testo:
```xc
function @func2 ($var1:number, $var2:text)
```

Questa funzione prende un argomento di tipo oggetto `position` definito dall'implementazione:
```xc
function @func3 ($var1:position)
```

Questa funzione prende un argomento numerico e un argomento testo e restituisce un valore numerico:
```xc
function @func2 ($var1:number, $var2:text) : number
```

### Body
Il corpo di una funzione (le operazioni da eseguire quando la si chiama) deve trovarsi nelle righe successive alla dichiarazione, indentato con una tabulazione.
Le righe vuote all'interno di un corpo sono consentite e ignorate dal compilatore.
I corpi delle funzioni possono avere un'istruzione `return` opzionalmente seguita da un'espressione che verrebbe usata per assegnare un valore a una variabile iniziale nell'istruzione del chiamante.
Quando si restituisce un valore, il tipo di ritorno deve essere fornito alla fine degli argomenti, dopo la parentesi di chiusura e i due punti.

```xc
function @func1 ($var1:number, $var2:number) : number
    return $var1 + $var2
```

### Call

Chiamare una funzione eseguira' le operazioni nel suo corpo.
Per chiamare una funzione, scrivi semplicemente il nome della funzione (che inizia con `@` per le funzioni definite dall'utente), poi i suoi argomenti tra parentesi separati da virgole, cosi':
```xc
@func1(4, 6)
```
Qui abbiamo passato due argomenti numerici, quindi questa chiamata esegue il corpo della dichiarazione sopra.
E' naturalmente anche possibile usare variabili o anche espressioni complesse invece di semplici numeri letterali come argomenti della funzione.

#### NOTE:
Gli argomenti omessi sono legali.
Il loro valore inizialmente prende il valore vuoto predefinito ("" o 0) poi persiste con cio' che viene passato o assegnato per le chiamate successive a quella funzione.
Cambiare il valore di un argomento all'interno di quella funzione sara' anche persistente per la chiamata successiva a quella funzione, se quell'argomento e' omesso.
Pertanto, se e' necessario un concetto di valore predefinito dell'argomento, questi possono essere assegnati all'argomento nel corpo di quella funzione dopo il loro utilizzo.
Questo concetto di argomento omesso puo' anche essere pensato come un concetto simile alle variabili locali statiche in C++.

### Return value

Le funzioni possono restituire un valore usando la parola chiave `return`.
Questo valore restituito puo' essere assegnato a una variabile cosi':
```xc
$value = @func1(4, 6)
```

# Recursive functions
Una funzione ricorsiva e' una funzione che chiama se stessa.
Per definire una funzione ricorsiva, usa `recursive function` e `recurse` per chiamare la funzione stessa.
```xc
recursive function @recursiveFunc($myVar:number)
    if $myVar < 15
        recurse($myVar++)
```
Questo esempio di funzione ricorsiva si chiamera' finche' il valore di $myVar e' inferiore a 15.
Le funzioni ricorsive sono limitate a 16 chiamate ricorsive.

Nota: La parola chiave `recurse` e' disponibile solo all'interno delle funzioni ricorsive e viene usata per chiamare la funzione stessa. La lista degli argomenti deve essere la stessa della definizione della funzione.

# Trailing functions
Qualsiasi funzione puo' essere chiamata come funzione trailing, anche le funzioni definite dall'utente.
Il modo in cui funzionano e' che sotto il cofano la variabile iniziale viene passata come primo argomento a quella funzione, e poi le viene assegnato il valore di ritorno.
Quando si chiama una funzione trailing, dobbiamo omettere il primo argomento poiche' invia automaticamente la variabile iniziale come primo argomento.
Se la definizione della funzione non ha argomenti, questo e' comunque valido, anche se semplicemente non ci interessa il valore corrente della variabile iniziale, ma le assegneremo un nuovo valore.
La definizione della funzione DEVE avere un tipo di ritorno che corrisponde a quello della variabile iniziale, se e' un tipo generico.
Una funzione trailing puo' essere chiamata su oggetti definiti dall'implementazione, nel qual caso il primo argomento deve essere di quel tipo di oggetto, non c'e' tipo di ritorno nella funzione e NON deve restituire alcun valore.
Poiche' non possiamo passare array come argomenti di funzione, gli array possono solo prendere le proprie funzioni trailing specificamente definite.
```xc
$myVariable.round()
```
```xc
$myVariable.@func1(6)
```
```xc
$myArray.clear()
```

# Built-in functions

### Math
Queste funzioni sono definite nel linguaggio base e prendono uno o piu' argomenti.
Le funzioni matematiche trailing useranno la variabile iniziale come primo argomento e modificheranno quella variabile assegnandole il valore di ritorno.
- `floor`(number)
- `ceil`(number)
- `round`(number)
- `sin`(number) in radianti
- `cos`(number) in radianti
- `tan`(number) in radianti
- `asin`(number) in radianti
- `acos`(number) in radianti
- `atan`(number) o (number, number) in radianti
- `abs`(number)
- `fract`(number)
- `log`(number, base)
- `sqrt`(number)
- `sign`(number [, default])
- `pow`(number, exponent)
- `clamp`(number, minimum, maximum)
- `step`(edge1, edge2, number) o (edge, number)
- `smoothstep`(edge1, edge2, number)
- `lerp`(a, b, number)
- `mod`(number, divisor) l'operatore modulo
- `min`(number, number)
- `max`(number, number)
- `avg`(number, number)
- `add`(number, number)
- `sub`(number, number)
- `mul`(number, number)
- `div`(number, number)

### Text functions
- `text`(inputTextWithFormatting, vars ...) Vedi la sezione sotto per maggiori dettagli
- `substring`($myText, start, length) restituisce una nuova stringa
- `replace`($myText, searchText, replaceText [, count]) restituisce una nuova stringa con tutte le occorrenze di `searchText` sostituite da `replaceText`, o fino a `count` occorrenze se specificato
- `size`($myText) restituisce il numero di caratteri in $myText
- `last`($myText) restituisce l'ultimo carattere in $myText
- `lower`($myText) restituisce la versione minuscola di $myText
- `upper`($myText) restituisce la versione maiuscola di $myText

#### Formatting
La funzione `text` prende un formato come primo argomento.
Il formato e' fondamentalmente un testo che puo' contenere parentesi graffe che saranno sostituite dal valore di alcune variabili o espressioni.
Esempio:
```xc
$formattedText = text("My name is {} and I am {} years old.", $name, $age)
```
Le parentesi graffe vuote sopra saranno sostituite dalle variabili corrispondenti negli argomenti seguenti nello stesso ordine.
E' anche possibile formattare le variabili numeriche in un modo specifico fornendo alcuni pseudo-valori all'interno delle parentesi graffe cosi':
- `{}` visualizza automaticamente solo le cifre necessarie in base al valore (es: `3` o `123.456`)
- `{0}` arrotonda al valore intero piu' vicino (es: `3` o `123`)
- `{00}` arrotonda al valore intero piu' vicino ma visualizza almeno due cifre (es: `03` o `123`)
- `{0e}` visualizza il valore integrale arrotondato come notazione scientifica (es: `3e+00` o `1e+02`)
- `{0e.00}` visualizza il valore come notazione scientifica con due cifre dopo il decimale (es: `3.00e+00` o `1.23e+02`)
- `{0.0}` arrotonda a una cifra dopo il decimale (es: `3.0` o `123.5`)
- `{0000.00}` visualizza almeno 4 cifre integrali e arrotonda a due cifre dopo il decimale (es: `0003.00` o `0123.46`)

### Trailing functions for Arrays
Queste funzioni DEVONO essere chiamate come funzioni trailing, e non restituiscono nulla, invece modificano l'array
- $myArray.`clear`() Svuota un array
- $myArray.`sort`() Ordina un array in ordine crescente
- $myArray.`sortd`() Ordina un array in ordine decrescente
- $myArray.`append`(value1, value2, ...) Aggiunge uno o piu' valori alla fine di un array.
- $myArray.`pop`() Cancella l'ultimo valore in un array, riducendo la sua dimensione di uno
- $myArray.`insert`(index, value) Inserisce un nuovo valore in un array in una posizione specifica, spostando indietro tutti i valori successivi di uno
- $myArray.`erase`(index) Cancella un elemento da un array a un indice specifico, tirando avanti tutti i valori successivi di uno
- $myArray.`fill`(qty, value) Ridimensiona e riempie un array con una dimensione data e il valore specificato per tutti gli elementi (questo cancella qualsiasi valore precedentemente presente nell'array)
- $myArray.`from`(other [, separator]) Imposta il contenuto dell'array a un altro array o testo. Il separatore serve per dividere con una stringa specifica (valido solo quando other e' un testo). Questa funzione funziona anche al contrario quando eseguita su un testo dato un array e un separatore.

### Trailing members for Arrays
Usando l'operatore trail `.`, possiamo anche restituire un'informazione specifica su certi tipi di variabili.
- $myArray.`size` restituisce il numero di elementi in $myArray
- $myArray.`min` restituisce il valore minimo all'interno di un array numerico
- $myArray.`max` restituisce il valore massimo all'interno di un array numerico
- $myArray.`avg` restituisce il valore medio all'interno di un array numerico
- $myArray.`med` restituisce il valore mediano all'interno di un array numerico
- $myArray.`sum` restituisce la somma di tutti i valori all'interno di un array numerico
- $myArray.`last` restituisce il valore dell'ultimo elemento all'interno di un array, questo permette anche di modificare quel valore assegnando un'espressione

### Other useful helpers
- `contains`($myText, "str") restituisce 1 se $myText contiene "str", altrimenti 0
- `find`($myText, "str") restituisce l'indice del primo carattere della prima occorrenza di "str" in $myText, altrimenti -1 se non trovato
Queste funzionano anche sugli array.
- `isnumeric`($myText) restituisce 1 se $myText e' un numero, altrimenti 0

### Ternary operator
L'operatore ternario e' un'espressione condizionale abbreviata che restituisce un valore a seconda della valutazione di una condizione.
```xc
$myVar = if($cond, $valTrue, $valFalse)
```

### Device functions
Un'implementazione dovrebbe definire funzioni specifiche dell'applicazione per il dispositivo.
Ecco esempi di funzioni base del dispositivo che POSSONO o MENO essere definite:
- `delta`() restituisce la differenza di tempo in secondi dall'ultima esecuzione di questa funzione `delta`
Le funzioni del dispositivo che non richiedono argomenti possono essere usate senza parentesi quando chiamate dall'interno di un'espressione.

# Compiler Specifications
Questa sezione e' destinata agli sviluppatori di giochi che vogliono usarlo nel loro gioco.

XenonCode viene fornito con la propria libreria parser/compilatore/interprete, e un tool CLI molto semplice.

## Editor
Si raccomanda che l'editor di codice esegua il seguente parsing sulla riga corrente ad ogni pressione di tasto:
- Sostituisci le sequenze iniziali di spazi con esattamente una tabulazione in piu' rispetto alla riga non vuota precedente, se inizia piu' avanti
- Autocompletamento delle parole premendo la barra spaziatrice se quella parola non e' un simbolo esistente
    - Scrivi i caratteri rimanenti minimi (denominatore comune) dei simboli che iniziano con i caratteri scritti
        - Se questa e' la parola iniziale: Autocompleta solo con le parole delle istruzioni dello scope globale
        - Se preceduta da tabulazioni: Autocompleta solo con le parole delle istruzioni del corpo della funzione
        - Quando il primo carattere nella parola corrente e' un `$`, autocompleta con una variabile utente
        - Quando il primo carattere nella parola corrente e' un `@`, autocompleta con una funzione utente
        - Altrimenti, autocompleta con uno di:
            - Argomenti della funzione/foreach/repeat corrente
            - Funzioni integrate
            - Operatori

## Runtime

All'accensione del computer virtuale:
- Esegui il corpo della funzione init()

Un ciclo di clock, eseguito 'frequency' volte al secondo:
- Esegui tutte le funzioni input che hanno ricevuto dati dall'ultimo ciclo (una volta ciascuna per ciclo)
- Esegui eventi personalizzati / punti di ingresso
- Esegui la funzione tick
- Esegui tutte le funzioni timer sequenzialmente se il loro tempo e' dovuto
- Attendi per Tempo_trascorso-1/Frequenza secondi

# Testing XenonCode
Potresti voler testare XenonCode o esercitare le tue abilita' di programmazione.
C'e' uno strumento fiddle online su <a href="https://xenoncode.com/">XenonCode.com</a>

Altrimenti, potresti voler provare a eseguirlo direttamente sul tuo computer.
Per questo, XenonCode ha un CLI con un comando `-run` per testare alcuni script nella console.
Questo repository include il tool CLI, situato in `build/xenoncode`
Ecco come puoi scaricare ed eseguire XenonCode:
```shell
# Clone this github repository
git clone https://github.com/batcholi/XenonCode.git
cd XenonCode
# Compile & Run the XC program located in test/
build/xenoncode -compile test -run test
```
Puoi modificare i file sorgente .xc in `test/` poi provare ad eseguire di nuovo l'ultima riga per compilare ed eseguire.
La directory `test/storage/` verra' creata, conterra' i dati di storage (variabili prefissate con la parola chiave `storage`).
Nota che questo comando `-run` e' pensato per testare rapidamente il linguaggio e eseguira' solo la funzione `init`.
Inoltre, assicurati che il tuo editor sia configurato per usare tabulazioni e non spazi, per un corretto parsing dell'indentazione.

Se vuoi integrare XenonCode nel tuo progetto C++, puoi includere `XenonCode.hpp`.
Ulteriore documentazione arrivera' presto per questo, nel frattempo puoi usare `main.cpp` come esempio ma il suo utilizzo e' ancora soggetto a cambiamenti.
