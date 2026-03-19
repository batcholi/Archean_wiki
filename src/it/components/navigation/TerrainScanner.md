<p align="center">
  <img src="TerrainScanner.png" />
</p>

|Component|`TerrainScanner`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---

# Description
Il Terrain Scanner e' un componente che permette di recuperare l'altitudine del terreno in una o piu' posizioni (per distanza) nella direzione del suo sensore. Funziona solo su pianeti e lune.

# Usage
Da un punto di vista tecnico, lo scanner e' molto semplice. Si invia un numero nel canale 0 che corrisponde alla distanza in metri alla quale si desidera scansionare il terreno orizzontalmente, e lo scanner restituira' un numero corrispondente all'altitudine a quella distanza nella direzione del sensore.

L'altitudine restituita nel caso della Terra e' relativa al livello del mare.

La sua forza risiede nella possibilita' di inviargli piu' distanze in canali diversi per scansionare piu' punti simultaneamente ad ogni tick del server (25 volte al secondo per impostazione predefinita).

> Non puntarlo mai verso il basso/alto, funziona meglio quando scansiona orizzontalmente.

## Example
Per scansionare il terreno a una distanza di 10m, bisogna inviare il valore 10 nel canale di ingresso 0. Lo scanner restituira' un numero che corrisponde all'altitudine a 10m di distanza nel canale di uscita corrispondente.

Per scansionare il terreno a distanze di 10m e 20m, bisogna inviare il valore 10 nel canale di ingresso 0 e il valore 20 nel canale di ingresso 1, ad esempio. Lo scanner restituira' quindi un numero che corrisponde all'altitudine a 10m di distanza nel canale di uscita 0 e un altro numero per 20m di distanza nel canale di uscita 1.

Con queste possibilita', e' possibile, ad esempio, utilizzare un ciclo XenonCode per scansionare tutte le altitudini in un raggio di 100m con un passo di 10m e visualizzarle nella console.

```xc
    repeat 10 ($i)
        output_number($scanner_io, $i, $i*10)
        print(input_number($scanner_io, $i))
```

Tenere presente che ci sara' un ritardo di 1 tick tra l'invio all'uscita e il recupero dall'ingresso.
Fondamentalmente, lo Scanner fornira' i risultati basati sui valori inviati nel tick precedente, quindi non cambiare i valori di distanza tra i canali e non usare valori casuali, cercare di mantenerli costanti attraverso piu' tick.

## Go further
Il Terrain Scanner scansiona il terreno nella direzione del suo sensore. E' possibile installarlo su un Small Pivot per, ad esempio, ruotarlo e creare una mappa altimetrica attorno alla sua posizione utilizzando un programma XenonCode e gli schermi di gioco.

## Energy
Il Terrain Scanner consuma energia a bassa tensione per funzionare. Il suo consumo e' direttamente proporzionale al numero di canali utilizzati. Piu' posizioni si scansionano in un singolo tick, piu' energia si consuma, ovvero 100 watt per canale per tick.
