# Earth

### 资源分布
|元素全称|稀有度|分布|
|---|---|---|
|Silicon (Si)|常见|随处可见|
|Iron (Fe)|常见|随处可见（+ 火山附近）|
|Carbon (C)|常见|海平面以上|
|Copper (Cu)|常见|海平面以上|
|Tin (Sn)|常见|海平面以上|
|Aluminum (Al)|不常见|高海拔（山区）|
|Silver (Ag)|不常见|高海拔（山区）|
|Nickel (Ni)|稀有|高海拔（山区）|
|Chromium (Cr)|稀有|高海拔（山区）|
|Titanium (Ti)|稀有|极高海拔|
|Gold (Au)|非常稀有|低海拔（深海中）|
|Lead (Pb)|非常稀有|低海拔（+ 火山附近）|
|Tungsten (W)|稀有|混合分布（高海拔和低海拔）|
|Uranium (U)|非常稀有|低海拔（深海中）|
|Fluorite (F)|非常稀有|仅火山附近|


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
; 按摩尔分数计算，给定任意数量的分子，引擎将自动重新归一化至 100%
N2 = 78.0
CO2 = 15.0
CH4 = 4.0
H2O = 2.5
O2 = 0.5

```
