# Earth

### Resource distribution
|Полное название элемента|Редкость|Распространение|
|---|---|---|
|Silicon (Si)|Обычный|Повсюду|
|Iron (Fe)|Обычный|Повсюду (+ вблизи вулканов)|
|Carbon (C)|Обычный|Выше уровня моря|
|Copper (Cu)|Обычный|Выше уровня моря|
|Tin (Sn)|Обычный|Выше уровня моря|
|Aluminum (Al)|Необычный|Высокогорье (Горы)|
|Silver (Ag)|Необычный|Высокогорье (Горы)|
|Nickel (Ni)|Редкий|Высокогорье (Горы)|
|Chromium (Cr)|Редкий|Высокогорье (Горы)|
|Titanium (Ti)|Редкий|Очень высокогорье|
|Gold (Au)|Очень редкий|Низкие высоты (Глубоко в море)|
|Lead (Pb)|Очень редкий|Низкие высоты (+ вблизи вулканов)|
|Tungsten (W)|Редкий|Смешанный (высокие и низкие высоты)|
|Uranium (U)|Очень редкий|Низкие высоты (Глубоко в море)|
|Fluorite (F)|Очень редкий|Только вблизи вулканов|


### Celestial body parameters
```ini
[celestial]
orbit_distance = 1.5e11 ; meters
base_radius = 6200000 ; meters
outer_radius = 6400000 ; meters
mass = 6e24 ; kg
orbital_plane_tilt = 0 ; degrees
orbit_offset = 0 ; degrees
axial_tilt = -10 ; degrees
rotation_period = 43200 ; seconds
albedo = 0.2 0.2 0.25

[terrain]
height_variation = 15000 ; meters
hydrosphere = 0.2 ; as a ratio of terrain variation
module = ARCHEAN_celestial
continent_ratio = 0.5
continent_size = 2000 ; km
seed = 14182121141

[atmosphere]
density_at_surface = 1.3 ; kg/m3
mie_scattering_coefficient = 0.000001
g = -0.99
temperature_at_surface = 330 ; kelvin

[atmosphere_composition]
; По молярным долям, заданным произвольным числом молекул, которые будут автоматически перенормированы до 100% движком
N2 = 78.0
CO2 = 15.0
CH4 = 4.0
H2O = 2.5
O2 = 0.5

```
