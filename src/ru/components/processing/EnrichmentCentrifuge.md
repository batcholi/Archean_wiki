<p align="center">
  <img src="EnrichmentCentrifuge.png" />
</p>

|Component|`EnrichmentCentrifuge`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|75 x 75 x 275 cm|
|**Push/Pull Fluid**|Accept Push/Pull / Initiate Push/Pull|
#
---

# Description
Enrichment Centrifuge — компонент, разделяющий смесь молекул на два потока на основе их молекулярной массы.

# Usage
Требуется:
- Постоянное электропитание мощностью 1000 Вт.
- Входной сигнал данных для активации.

Жидкость подаётся через порт, расположенный в самом верху компонента. В нижней части более лёгкие молекулы выходят через порт, расположенный выше, а более тяжёлые молекулы — через нижний порт непосредственно под ним.

Оба выходных порта должны быть правильно подключены для корректной работы.
