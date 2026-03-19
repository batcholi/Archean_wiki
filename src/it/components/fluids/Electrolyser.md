<p align="center">
  <img src="Electrolyser.png" />
</p>

|Component|`Electrolyser`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|500 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Initiate Push/Pull|
#
---

# Description
L'Electrolyser e' un componente che permette la dissociazione dell'acqua in idrogeno e ossigeno.

# Usage
L'Electrolyser richiede un'alimentazione ad alta tensione e fino a 10 kW durante il funzionamento, producendo in modo linearmente proporzionale alla quantita' di energia disponibile, fino a un massimo di 1 kg di acqua al secondo con 10 kW di potenza.

Per avviare il processo di elettrolisi, basta collegare una sorgente d'acqua alla porta di ingresso blu. Questa sorgente puo' provenire da un [Fluid Port](../fluids/FluidPort.md) immerso nell'acqua per estrarre direttamente l'acqua dal mare, ad esempio, o da un serbatoio contenente acqua.

L'idrogeno e l'ossigeno prodotti possono poi essere raccolti rispettivamente dalle porte di uscita gialla (H2) e ciano (O2).

### Production
L'Electrolyser puo' processare fino a 1 kg di acqua al secondo, fornendo circa [0,9 kg di ossigeno e 0,1 kg di idrogeno](# "O2:0.88kg / H2:0.11kg") al secondo.
