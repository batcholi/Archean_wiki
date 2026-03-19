# Erde

### Ressourcenverteilung
|Vollständiger Elementname|Seltenheit|Verteilung|
|---|---|---|
|Silicon (Si)|Häufig|Überall|
|Iron (Fe)|Häufig|Überall (+ in der Nähe von Vulkanen)|
|Carbon (C)|Häufig|Über dem Meeresspiegel|
|Copper (Cu)|Häufig|Über dem Meeresspiegel|
|Tin (Sn)|Häufig|Über dem Meeresspiegel|
|Aluminum (Al)|Ungewöhnlich|Hohe Lage (Berge)|
|Silver (Ag)|Ungewöhnlich|Hohe Lage (Berge)|
|Nickel (Ni)|Selten|Hohe Lage (Berge)|
|Chromium (Cr)|Selten|Hohe Lage (Berge)|
|Titanium (Ti)|Selten|Sehr hohe Lage|
|Gold (Au)|Sehr selten|Niedrige Lage (Tief im Meer)|
|Lead (Pb)|Sehr selten|Niedrige Lage (+ in der Nähe von Vulkanen)|
|Tungsten (W)|Selten|Gemischt (hohe und niedrige Lage)|
|Uranium (U)|Sehr selten|Niedrige Lage (Tief im Meer)|
|Fluorite (F)|Sehr selten|Nur in der Nähe von Vulkanen|


### Parameter des Himmelskörpers
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
