# Earth

### Resource distribution
|Nome completo dell'elemento|Rarita'|Distribuzione|
|---|---|---|
|Silicio (Si)|Comune|Ovunque|
|Ferro (Fe)|Comune|Ovunque (+ vicino ai vulcani)|
|Carbonio (C)|Comune|Sopra il livello del mare|
|Rame (Cu)|Comune|Sopra il livello del mare|
|Stagno (Sn)|Comune|Sopra il livello del mare|
|Alluminio (Al)|Non comune|Alta quota (Montagne)|
|Argento (Ag)|Non comune|Alta quota (Montagne)|
|Nichel (Ni)|Raro|Alta quota (Montagne)|
|Cromo (Cr)|Raro|Alta quota (Montagne)|
|Titanio (Ti)|Raro|Altitudine molto elevata|
|Oro (Au)|Molto raro|Bassa quota (In fondo al mare)|
|Piombo (Pb)|Molto raro|Bassa quota (+ vicino ai vulcani)|
|Tungsteno (W)|Raro|Misto (alta e bassa quota)|
|Uranio (U)|Molto raro|Bassa quota (In fondo al mare)|
|Fluorite (F)|Molto raro|Solo vicino ai vulcani|


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
; Per frazioni molari, dato un numero arbitrario di molecole, queste verranno automaticamente rinormalizzate al 100% dal motore
N2 = 78.0
CO2 = 15.0
CH4 = 4.0
H2O = 2.5
O2 = 0.5

```
