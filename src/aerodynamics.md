# Aerodynamics

Archean simulates aerodynamic forces that automatically apply to any vehicle moving through a fluid medium — whether it's air or water. These forces include **drag** (resistance to motion), **lift** (perpendicular force from thin surfaces), and **buoyancy** (upward force from fluid displacement). Understanding how these systems work is key to designing efficient aircraft, boats, submarines, and any other moving creation.

## How It Works

### Fluid Medium

The physics engine queries the environment at each relevant point on your vehicle to determine the local fluid properties:

| Property | Description | Example Values |
|----------|-------------|----------------|
| **Density** (kg/m³) | Mass per volume of the fluid | Air at sea level: ~1.2, Water: ~1000 |
| **Viscosity** (kg/(m·s)) | Resistance to flow within the fluid | Used for water detection and damping |

- In **air**, density decreases with altitude. Higher altitude means less drag and lift.
- In **water**, density is roughly 800× greater than air — aerodynamic forces are dramatically stronger.
- In **space** (vacuum), density is 0 — no aerodynamic forces apply at all.

> Aerodynamic forces only activate when a vehicle's speed exceeds **0.1 m/s**. Below that threshold, forces are not computed.

### Drag

Drag is the force that opposes a vehicle's motion through a fluid. It acts in the **opposite direction** of the velocity.

The drag force on each exposed surface follows the standard aerodynamic equation:

**F = ½ × C<sub>d</sub> × ρ × v² × A**

| Symbol | Meaning | Value |
|--------|---------|-------|
| C<sub>d</sub> | Drag coefficient | **0.4** for block surfaces |
| ρ | Fluid density (kg/m³) | Depends on environment |
| v | Relative speed at the surface (m/s) | Vehicle speed + rotational speed at that point |
| A | Exposed frontal area (m²) | Perpendicular to velocity, scaled by occupancy ratio |

Key points:
- Drag grows with the **square** of speed — doubling your speed quadruples the drag
- Only **exposed surfaces** contribute to drag (see [Occlusion](#occlusion-and-exposed-surfaces))
- The force is computed **per surface**, at each surface's position, which means drag can also induce **torque** (rotation) if applied off-center

### Lift

Lift is generated automatically by **thin, flat structures** — such as wings or fins — that the physics engine detects based on geometry.

A surface is classified as a **lift surface** when all of the following conditions are met:

| Condition | Threshold |
|-----------|-----------|
| Thickness (shortest dimension) | < **0.3 m** |
| Width (medium dimension) | ≥ **length / 4** |
| Length (longest dimension) | ≥ **4 m** |

When a lift surface is detected:
- The **lift coefficient** depends on the angle of attack: `C_l = sin(|angle_of_attack| × π/2)`
- The **drag coefficient** is very low: only **0.01** (compared to 0.4 for regular surfaces)
- Lift force is perpendicular to the velocity, pushing the vehicle in the direction of the surface normal

> To build wings that generate lift, use flat arrangements of blocks at least **4 meters long** and **less than 0.3 meters thick**. Slopes can be used to shape the leading and trailing edges.

### Buoyancy

Buoyancy is the upward force exerted on a submerged or partially submerged object. It opposes gravity and depends on how much fluid the vehicle's blocks displace.

**F<sub>buoyancy</sub> = V<sub>displaced</sub> × ρ<sub>fluid</sub> × g**

| Symbol | Meaning |
|--------|---------|
| V<sub>displaced</sub> | Displaced volume (block volume × `volumeDisplacementRatio`) |
| ρ<sub>fluid</sub> | Fluid density at sample point |
| g | Gravitational acceleration (opposing direction) |

- The engine samples **at least 16 random points** across all colliders to handle **partial submersion** smoothly
- Each block's contribution depends on its material's `volumeDisplacementRatio` (see [Materials](#materials))
- Buoyancy is applied at each sample point, so a vehicle can tilt based on uneven submersion

## Blocks and Shapes

### Block Shapes

Different block shapes have different **occupancy ratios**, which directly affect drag calculations:

| Shape | Occupancy Ratio | Mass Multiplier |
|-------|----------------|-----------------|
| **Cube** | 1.0 | 1.0× |
| **Slope** | 0.5 | 0.5× |
| **Corner** | 0.5 | 0.5× |
| **Pyramid** | 0.5 | 0.5× |
| **Inverse Corner** | 0.5 | 0.5× |

The occupancy ratio scales the calculated drag area — a slope block facing the wind produces roughly **half the drag** of a cube in the same position.

### Materials

Each block material has different physical properties that affect aerodynamics, buoyancy, and mass:

| Material | Mass (kg/block unit) | Volume Displacement Ratio | Friction |
|----------|---------------------|--------------------------|----------|
| **Composite** | 0.25 | 0.20 × occupancy | 0.05 |
| **Concrete** | 10.0 | 0.25 × occupancy | 0.50 |
| **Steel** | 1.0 | 0.01 × occupancy | 0.20 |
| **Aluminium** | 0.5 | 0.01 × occupancy | 0.20 |
| **Glass** | 1.0 | 0.02 × occupancy | 0.10 |
| **Lead** | 150.0 | 1.00 × occupancy | 0.20 |

The **volume displacement ratio** determines how much a block contributes to buoyancy and how visible it is to the aerodynamic surface detection:
- **Lead** (1.0) fully displaces fluid — maximum buoyancy force but also very heavy, so it sinks
- **Steel/Aluminium** (0.01) barely displace fluid — they contribute almost no buoyancy
- **Composite** (0.2) offers a moderate balance between buoyancy and light weight

### Occlusion and Exposed Surfaces

The aerodynamic system uses **raycasting** to determine which surfaces are actually exposed to the airflow:

1. For each block collider, the engine identifies the surface facing the velocity direction
2. A ray is cast from that surface outward in the velocity direction
3. If the ray hits another block of the same vehicle, that surface is considered **occluded** and does **not** contribute to drag or lift
4. Only truly exposed surfaces generate aerodynamic forces

This means:
- **Internal blocks** inside a hull add no drag — only the outer shell matters
- A **compact vehicle** with fewer exposed faces has less drag than a spread-out structure
- When a group of blocks has an occupancy ratio below **0.9**, the system recursively examines the individual child blocks to find the actual exposed surfaces

> This is an important optimization point: two vehicles with the same outer shape but different internal structures will experience the **same** aerodynamic drag. Fill interiors freely without worrying about added drag.

### Frame Beams

Frame beams (the structural bars at the edges of frames) have a **volume displacement ratio of 0**. This means:

- They produce **no drag**
- They produce **no lift**
- They produce **no buoyancy**
- They only serve as structural collision geometry

> Frame beams are aerodynamically invisible. Use them freely for internal structure without affecting your vehicle's aerodynamic performance.

## Aerodynamic Components

### Aileron

The [Aileron](components/miscellaneous/Aileron.md) is a control surface that deflects to create forces perpendicular to the airflow. It is used to steer aircraft and watercraft.

- **Input**: a value between `-1.0` and `+1.0` through its data port, controlling rotation from -45° to +45°
- **Force**: proportional to fluid density × speed² × deflection angle
- **Does not compute occlusion** — unlike blocks, the aileron always generates its full force regardless of surrounding geometry

> Because ailerons ignore occlusion, you can **hide them inside wings** made of blocks. The blocks will have their surfaces occluded (reducing drag), while the ailerons still produce their full control force.

### Propeller

The [Propeller](components/propulsion/Propeller.md) generates thrust by spinning blades through a fluid medium. It works in both air and water.

Key physics:
- **Thrust** = ½ × ρ × A<sub>disc</sub> × v<sub>effective</sub>² × 0.4
- **Drag on blades** = ½ × ρ × viscosity × A<sub>disc</sub> × v<sub>effective</sub>² × 10.0
- **Ground effect**: when a propeller is near the ground and pointing downward, thrust increases by up to **+50%** (within 3× blade radius of terrain)
- **Gyroscopic precession**: spinning propellers resist changes in orientation, creating a torque perpendicular to the rotation axis — just like real gyroscopes
- Maximum thrust is capped at **100,000 N**

### Thruster & RCS

Chemical [Thrusters](components/propulsion/thruster/SmallThruster.md) generate thrust through fuel combustion and are **not affected** by external aerodynamics for their thrust output — they work the same in atmosphere and in vacuum.

[RCS](components/propulsion/RCS.md) (Reaction Control System) thrusters, however, experience **atmospheric attenuation**:

**attenuation = max(e<sup>-ρ×4</sup>, 0.01)**

| Environment | Density (ρ) | Attenuation | Effective Thrust |
|-------------|-------------|-------------|-----------------|
| Vacuum | 0 | 100% | Full thrust |
| Air (sea level) | ~1.2 | ~99.2% | Nearly full |
| Water | ~1000 | ~1% | Almost no thrust |

> RCS thrusters are designed for space maneuvering. In dense atmospheres or water, their effectiveness drops dramatically.

## Water Physics

When a vehicle enters water, the physics engine applies additional damping effects beyond standard drag:

### Water Detection

The engine detects water by measuring the environment's **viscosity**. A viscosity between **0.0000151** and **0.000999** kg/(m·s) is classified as water.

### Water Damping Effects

| Effect | Description |
|--------|-------------|
| **Vertical velocity suppression** | Vertical speed is reduced over time, simulating water resistance to vertical movement |
| **Pitch & roll damping** | Rotation around horizontal axes is dampened proportionally to how submerged the vehicle is |
| **Yaw damping** | Rotation around the vertical axis is dampened at **half** the rate of pitch/roll |

The **submersion factor** is calculated from the average viscosity: `submerged = clamp(pow(viscosity × 1000, 0.1), 0.5, 1.0)`

> Water naturally stabilizes vehicles. A partially submerged vehicle will resist tipping over due to the pitch/roll damping. This makes boats inherently more stable than aircraft.

## High-Speed Angular Stability

At speeds above **10 m/s**, the physics engine applies an artificial angular damping that simulates pressure buildup on the vehicle's surfaces:

**ω -= ω × min(1, ρ) × clamp(Δt × |v| / 25, 0, 0.025)**

This means:
- **Faster vehicles** are more rotationally stable
- **Denser fluids** (water > air) provide stronger stabilization
- This prevents vehicles from tumbling uncontrollably at high speeds
- In water at high viscosity, an additional angular damping factor is applied

## Design Tips

### Reducing Drag
- **Minimize exposed surface area** — a compact, streamlined shape creates less drag
- Use **slopes, corners, and bevels** on leading edges and noses instead of flat cube faces
- **Internal blocks don't add drag** — only the outer shell matters, so fill interiors as needed
- Frame beams are aerodynamically invisible — use them freely for internal structure

### Building Effective Wings
- Wings must be **at least 4 meters long**, **less than 0.3 meters thick**
- A wider wingspan (width ≥ length/4) ensures the surface is classified as a lift surface rather than a drag surface

### Watercraft Design
- **Composite blocks** (ratio 0.2) offer the best buoyancy-to-weight balance for floating
- **Steel and Aluminium** (ratio 0.01) barely contribute to buoyancy — use them sparingly in boats
- **Lead** (ratio 1.0) displaces the most fluid, but at 150 kg per unit it will sink rapidly
- Water damping naturally stabilizes your vessel — wide, flat hulls are most stable

### Propeller Placement
- **Ground effect** boosts thrust by up to 50% when close to terrain — useful for hovercraft designs
- Propellers generate **gyroscopic torque** — counter-rotating propeller pairs cancel this effect
- Propellers work in both air and water, adapting their thrust based on fluid density and viscosity
