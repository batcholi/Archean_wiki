# Earth

### Distribucion de recursos
|Nombre completo del elemento|Rareza|Distribucion|
|---|---|---|
|Silicon (Si)|Comun|En todas partes|
|Iron (Fe)|Comun|En todas partes (+ cerca de volcanes)|
|Carbon (C)|Comun|Sobre el nivel del mar|
|Copper (Cu)|Comun|Sobre el nivel del mar|
|Tin (Sn)|Comun|Sobre el nivel del mar|
|Aluminum (Al)|Poco comun|Gran altitud (Montanas)|
|Silver (Ag)|Poco comun|Gran altitud (Montanas)|
|Nickel (Ni)|Raro|Gran altitud (Montanas)|
|Chromium (Cr)|Raro|Gran altitud (Montanas)|
|Titanium (Ti)|Raro|Muy alta altitud|
|Gold (Au)|Muy raro|Baja altitud (Profundidades del mar)|
|Lead (Pb)|Muy raro|Baja altitud (+ cerca de volcanes)|
|Tungsten (W)|Raro|Mixto (alta y baja altitud)|
|Uranium (U)|Muy raro|Baja altitud (Profundidades del mar)|
|Fluorite (F)|Muy raro|Solo cerca de volcanes|


### Parametros del cuerpo celeste
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
; By mole fractions, given arbitrary number of molecules they will be automatically re-normalized to 100% by the engine
N2 = 78.0
CO2 = 15.0
CH4 = 4.0
H2O = 2.5
O2 = 0.5

```
