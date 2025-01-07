# N-Body Physics

## Introduction
Archean supports two types of physics for entities located outside of a celestial body's atmosphere:

- **Dominant Gravity Physics (Default)**: The celestial body with the greatest gravitational influence will affect the entity.
- **N-Body Physics**: All celestial bodies will affect the entity.

## Why is N-Body Physics not enabled by default?
**N-Body Physics** offers a more realistic simulation, for players with advanced knowledge of space physics who want an extra challenge. In reality, space agencies rely on supercomputers to calculate satellite and probe trajectories and adjust them as needed. In *Archean*, players must perform these calculations manually, constrained by the limited computing power of a **Xenoncode** computer.

A unique problem in *Archean* is the proximity of the Moon to Earth during that era, making it nearly impossible to achieve a stable orbit around Earth without being heavily influenced by lunar gravity. However, with **Dominant Gravity Physics**, players can focus on the Earth's gravity and ignore the Moon's influence when in orbit around Earth.

## Configuration
To enable N-Body Physics, you need to modify the file `Archean-data/server/ARCHEAN_celestial.ini` and set the value of `nbody` to `yes`.

---
## Additional Information
When using N-Body Physics, we do not recommend using the [NavInstrument](/components/navigation/NavInstrument.md) which is designed to work natively with Dominant Gravity Physics. It is possible to use it with N-Body Physics, but it will return inaccurate information and your orbit will not be stable.

