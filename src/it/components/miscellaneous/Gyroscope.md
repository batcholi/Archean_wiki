<p align="center">
  <img src="SmallGyroscope.png" />
  <img src="Gyroscope.png" />
</p>

|Component|`SmallGyroscope`| `Gyroscope`|
|---|---|---|
|**Module**|`ARCHEAN_gyroscope`|`ARCHEAN_gyroscope`|
|**Mass**|50 kg|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|50 x 50 x 50 cm|100 x 100 x 100 cm|
#
---

# Description
Il Gyroscope e' un componente che, quando alimentato e attivo, smorza la sua velocita' angolare. Viene utilizzato principalmente per stabilizzare un veicolo o fermare il momento angolare in assenza di gravita'.

# Power Supply
Lo SmallGyroscope e' alimentato tramite **bassa tensione** e il Gyroscope tramite **alta tensione**. Consumano piu' energia all'avvio e riducono gradualmente il loro consumo man mano che raggiungono la velocita' di rotazione richiesta tramite la porta dati.

# Usage
Per avviare il Gyroscope, deve ricevere un valore tra `0.0` e `1.0` nella sua porta dati per diminuire/aumentare la velocita' di rotazione, aumentando cosi' il suo effetto stabilizzante.

Il Gyroscope consente di orientare manualmente un veicolo tramite la sua porta dati sfruttando la coppia indotta delle ruote inerziali al suo interno. Agira' in base al suo orientamento e alla velocita' di rotazione.

### List of inputs
|Channel|Function|range|
|---|---|---|
|0|Speed| 0.0 to 1.0|
|1|Control| -1.0 to +1.0|

>Un Gyroscope ha un effetto limitato rispetto al peso della costruzione. E' possibile aumentare il numero di Gyroscope per aumentare l'effetto stabilizzante.
