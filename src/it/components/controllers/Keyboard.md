<p align="center">
    <img src="Keyboard.png" />
</p>

|Component|`Keyboard`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Mass**|2 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 25 x 25 cm|
#
---
# Description
La Keyboard è un componente che fornisce una tastiera tattile per inviare valori alfanumerici ad altri componenti.

# Usage
È possibile inserire un valore alfanumerico utilizzando i pulsanti tattili della tastiera premendo il tasto `F`, e verranno visualizzati sullo schermo della Keyboard ma diventeranno effettivi/aggiornati solo quando il pulsante di conferma (verde) viene premuto.

Il pulsante giallo consente di cancellare l'ultimo carattere inserito, mentre il pulsante rosso consente di cancellare tutto.

> - `^` Consente di passare da minuscole a maiuscole
> - `!?` Visualizza i caratteri speciali
> - Quando il pulsante di conferma viene premuto, un `1` viene inviato sul canale 1 per 1 tick, altrimenti viene inviato `0`.
