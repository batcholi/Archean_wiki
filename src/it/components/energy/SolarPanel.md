<p align="center">
  <img src="SolarPanel.png" />
</p>

|Component|`SolarPanel`|
|---|---|
|**Module**|`ARCHEAN_celestial`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|200 x 200 x 25 cm|
#
---

# Description
Il Solar Panel genera energia a bassa tensione. Ha un'efficienza del 99,9% e una superficie di 4 metri quadrati (2x2 metri).
La potenza in uscita sarà limitata in base alla distanza e all'orientamento rispetto al/ai sole/i.
Con la configurazione predefinita del sistema solare in Archean, il sole è solo circa il 25% luminoso rispetto al nostro sole reale. Sulla Terra di Archean all'interno dell'atmosfera nelle migliori circostanze, è possibile generare fino a circa 980 watt per pannello.

# Usage
Collegare il Solar Panel al componente che richiede energia a bassa tensione per funzionare.

Il Solar Panel ha due porte elettriche, il che consente di collegare due componenti contemporaneamente o collegare più pannelli solari in serie per aumentare la potenza totale disponibile.

### List of outputs
|Channel|Function|
|---|---|
|0|Generated Power (Watts)|
|1|Output Power (Watts)|

> Se si utilizza il Solar Panel per alimentare due componenti, la potenza totale distribuita sulle due porte non può superare la potenza in uscita del pannello.
>
> Se uno dei due componenti vuole consumare l'intera potenza disponibile dal pannello, potrebbe impedire all'altro componente di utilizzare qualsiasi potenza. In questo caso è meglio utilizzare delle junction di potenza per assicurarsi che tutti i componenti ricevano alimentazione.
