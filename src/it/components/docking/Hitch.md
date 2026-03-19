<p align="center">
  <img src="Hitch.png" />
</p>

|Component|`Hitch`|
|---|---|
|**Module**|`ARCHEAN_build`|
|**Mass**|10 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|
#
---

# Description  
Il componente Hitch collega due costruzioni insieme in un punto fisso, consentendo piena libertà di rotazione attorno al giunto. Una volta collegati, i veicoli rimangono bloccati in posizione ma sono liberi di ruotare l'uno rispetto all'altro attorno all'Hitch.

# Usage  

L'Hitch ha una **porta dati** che controlla il suo stato.  
Quando due componenti Hitch sono attivati (armati) e si avvicinano sufficientemente, si collegano automaticamente.
La connessione può essere interrotta in qualsiasi momento disattivando uno dei due componenti.

> - Per ragioni di prestazioni, le collisioni non vengono elaborate tra costruzioni collegate tramite Hitch. Il gioco utilizza la fisica lato server, e controllare continuamente le collisioni tra veicoli in stretta prossimità sarebbe troppo costoso. Un aggiornamento futuro potrebbe consentire ai giocatori di definire vincoli su tutti gli assi dell'Hitch per simulare limiti fisici, ad esempio impedire a un rimorchio di ruotare oltre un certo angolo per evitare compenetrazioni con il trattore.

### List of inputs
|Channel|Function|value|
|---|---|---|
|0|Arm/Disarm Docking|0 or 1|

### List of outputs
|Channel|Function|value|
|---|---|---|
|0|Is Docked|0 or 1|
