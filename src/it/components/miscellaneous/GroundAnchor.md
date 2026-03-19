<p align="center">
  <img src="GroundAnchor.png" />
</p>

|Component|`GroundAnchor`|
|---|---|
|**Module**|`ARCHEAN_anchor`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 100 x 100 cm|
#
---

# Description
Il Ground Anchor e' un dispositivo che blocca una costruzione al suolo quando attivato, impedendo qualsiasi movimento.

# Usage
Il Ground Anchor funziona senza richiedere alimentazione esterna. Il suo meccanismo si basa su un semplice valore, `0` per disattivato (non ancorato) o `1` per attivato (ancorato) tramite la sua porta dati.

>- Per rilasciare una costruzione ancorata, rimuovere il Ground Anchor non e' sufficiente. Bisogna disancorare il Ground Anchor attuale oppure installarne uno nuovo per riattivare la fisica della costruzione, a condizione che non ci siano piu' ancoraggi attivi collegati.
>- Se e' presente un [OwnerPad](OwnerPad.md), l'utilizzo del pulsante "Reset" per spostare la costruzione NON sara' impedito dal Ground Anchor.
>- Il Ground Anchor non puo' ancorare un veicolo a un altro veicolo, funziona solo sui terreni.
