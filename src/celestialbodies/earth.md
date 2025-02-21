# Earth

### Resource distribution
|Full Element Name|Rarity|Distribution|
|---|---|---|
|Silicon (Si)|Common|Everywhere|
|Iron (Fe)|Common|Everywhere|
|Carbon (C)|Common|Everywhere|
|Copper (Cu)|Common|Everywhere|
|Aluminum (Al)|Common|High altitude (Mountains)|
|Nickel (Ni)|Rare|High altitude (Mountains)|
|Silver (Ag)|Rare|High altitude (Mountains)|
|Tin (Sn)|Rare|High altitude (Mountains)|
|Chromium (Cr)|Rare|High altitude (Mountains)|
|Titanium (Ti)|Rare|High altitude (Mountains)|
|Gold (Au)|Very rare|Low altitude (Deep in the sea)|
|Lead (Pb)|Very rare|Low altitude (Deep in the sea)|
|Tungsten (W)|Very rare|Low altitude (Deep in the sea)|
|Uranium (U)|Very rare|Low altitude (Deep in the sea)|


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
; By mole fractions, given arbitrary number of molecules they will be automatically re-normalized to 100% by the engine
N2 = 78.0
CO2 = 15.0
CH4 = 4.0
H2O = 2.5
O2 = 0.5

```
