<p align="center">
  <img src="PassiveRadiator.png" />
</p>

|Component|`PassiveRadiator`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|25 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 25 cm|
|**Push/Pull Fluid**|Accept Push -> Forwards action to other side|
#
---

# Description
Passive Radiator — компонент, используемый для медленного охлаждения жидкостей путём теплообмена с окружающей средой или излучения тепла в космос. Не требует электропитания.

# Usage
Эффективность охлаждения зависит от:
- Температуры окружающей среды
- Плотности окружающей среды

Теплообмен происходит за счёт теплопроводности (улучшается при более высокой плотности) и излучения.  
Когда жидкость проходит через него, её температура стремится к выравниванию с температурой компонента.

### List of outputs
|Channel|Function|Type|
|---|---|---|
|0|Temperature (K)|number|
