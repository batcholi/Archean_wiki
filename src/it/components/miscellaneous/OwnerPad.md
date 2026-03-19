<p align="center">
  <img src="ownerpad.webp" />
</p>

|Component|`OwnerPad`|
|---|---|
|**Module**|`ARCHEAN_ownership`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 50 x 50 cm|
#
---

# Description
L'OwnerPad e' un dispositivo di sicurezza versatile che garantisce la protezione delle costruzioni contro potenziali azioni dannose.

Oltre alla sua funzione di sicurezza, permette di salvare lo stato di una costruzione o di un veicolo (Posizione, Velocita', Livello batteria, interruttori...).
Con questa funzione, diventa possibile ripristinare istantaneamente quello stato con un singolo clic.

# Usage
### SAVE & RESET Button
Il pulsante `SAVE` salva la posizione di una costruzione e lo stato dei suoi componenti, mentre il pulsante `RESET` ripristina la costruzione allo stato in cui si trovava all'ultimo salvataggio.

### ROLES Button
I ruoli permettono di autorizzare/vietare azioni su una costruzione, come mostrato nell'immagine di esempio. Sono progettati per garantire la sicurezza delle costruzioni contro qualsiasi azione dannosa da parte di altri giocatori.
Quando si posiziona un OwnerPad su una costruzione, se non e' presente nessun altro OwnerPad, si diventa il proprietario di quella costruzione.

Per impostazione predefinita, tutti i permessi sono impostati su `@Everyone`, rendendo la costruzione completamente pubblica.
Oltre a `@Everyone` e `dksm (OWNER)` nell'esempio, verra' visualizzato l'elenco di tutti i giocatori connessi, consentendo di assegnare ruoli ai giocatori desiderati.

Un pulsante `Give Ownership` e' presente accanto a ciascun giocatore connesso per trasferire la proprieta' al giocatore scelto. Non si avranno piu' diritti sulla costruzione fino a quando il nuovo proprietario non concedera' dei ruoli.

![OwnerPadDemo](RolesUI.png)

### Control via the data port
L'OwnerPad ha una porta dati per consentire il controllo da un computer o in remoto tramite un Beacon, ad esempio.
Bisogna inviare un testo nel canale 0 contenente la parola chiave `"save"` o `"reset"` a seconda dell'azione che si desidera eseguire.

Bisogna inviare un testo vuoto `""` per resettare lo stato prima di poter inviare un altro comando.
