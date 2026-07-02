# Aerodynamics

Archean simulates realistic, flight-sim-grade aerodynamic forces on any vehicle moving through a fluid — air or water. The engine produces **lift**, **drag**, **stability**, **control authority**, **buoyancy**, and even **re-entry heating**, all from the actual **shape** of your build. There are no special "wing blocks" or hidden stats: if it looks like a wing and is placed like a wing, it flies like a wing.

## How It Works

### The shape field (cross-section model)

When you finish editing a build, the engine takes a **snapshot of its outer shape** by scanning it from the six axis directions (like a cubemap) and turning the result into a set of small surface patches. Each patch knows its position, the direction it faces, its area, and — crucially — **how deep the body is behind it** (its cross-section).

This snapshot is **cached** and only rebuilt when the build changes (you add/remove blocks, a control surface moves, or the build takes damage). Per-frame flight physics just reads the cached patches, so the cost stays **bounded no matter how complex your vehicle is** — a 300-meter airliner with hundreds of colliders is just as cheap to fly as a small fighter. The scan resolution scales automatically with the vehicle's size.

Three promises follow — and the engine keeps them **exactly**, not approximately:

- **How you build a shape never changes how it flies — only the final shape does.** A 10 × 10 × 1 wing made from one big block or from a hundred small ones gives a **bit-for-bit identical** result: the same forces and the same moments, to the last digit. Subdivision, block count, and how geometry is split or merged are completely invisible to the airflow — only the outer silhouette and cross-section matter.
- **Air and water are the same physics — there is no separate "water path."** The model samples the **fluid density at each surface** and feeds it into the *same* lift-and-drag equations. Air, the waterline, and deep water are just points on one continuous density scale, so a wing smoothly becomes a hydrofoil as it submerges — nothing switches over.
- **Material is invisible to flight.** Steel, aluminium, composite — a flat plate is a flat plate. **Material affects only mass and buoyancy, never lift or drag** — it changes how the plane is *balanced*, not how it *flies*.

> Only the **outer shell** is scanned. Interior blocks are never exposed to the airflow, so they add **zero** aerodynamic drag or cost — and because the model reads the **solid thickness** behind a surface (a sealed cavity counts as solid body), a **hollow shape flies exactly like its solid version**. Fill, or hollow out, your interiors freely; it never changes how the craft flies.

### Lift

A surface generates **lift** (acts like a wing) when its **cross-section is thin** — the **solid** front-to-back depth at that surface is small compared to the vehicle's size. A wing is thin top-to-bottom but broad in span and chord, so it lifts. A fuselage is deep in every direction, so it only drags.

- Lift follows a **realistic lift curve**: it rises with angle of attack, then **stalls** past roughly **15°**, after which lift drops and drag climbs sharply — just like a real airfoil.
- Lift is **two-sided**: a wing exposed to the air on both faces produces full lift; a wing whose underside is buried against the fuselage still lifts, at reduced strength.
- **Separate surfaces each lift on their own.** A twin tail, stacked (biplane) wings, or a fin lined up behind another along the same axis are read as the distinct thin surfaces they are — the air gap between them is *not* counted as solid body, so every one of them works.
- Lift is computed **at each surface's location**, so it naturally produces the right **pitch, roll, and yaw moments** about your center of mass.

> **To make a wing, make it geometrically thin.** A broad, flat planform only a block or two thick will lift. A chunky, deep wing will mostly drag. How it is subdivided or what it is made of does not matter — only the cross-section.

### Drag

Drag comes from several physical sources, combined automatically:

| Source | What it is |
|--------|-----------|
| **Form (pressure) drag** | The push of air on surfaces facing the flow. Grows with the **square of speed**. |
| **Skin friction** | The rubbing of air along surfaces parallel to the flow (Reynolds-number based). Dominant for large, slow bodies. |
| **Induced drag** | The unavoidable drag that comes *with* lift — more lift means more induced drag. |

The key new behavior is **fineness-based streamlining**. The engine measures how **slender** each surface is — how far the body extends *along* the flow versus how thin it is *across* it:

- A **slender** shape (a pointed nose, a wing's sharp leading edge, a long thin fuselage moving forward) keeps the airflow attached and has **very low** form drag.
- A **bluff** shape (a cube, a flat plate held broadside like an airbrake, a blunt nose) has **full** form drag.

This is purely geometric — it reads your build's actual cross-section, so streamlining your nose and edges genuinely pays off.

> Use slopes, corners, and bevels to taper noses and leading/trailing edges. A streamlined shape can have **a tenth** of the form drag of a blunt one at the same frontal size.

### Compressibility (high speed)

The model is regime-aware. As you approach and exceed the **speed of sound** (which depends on air temperature), pressure on forward-facing surfaces rises through the transonic and supersonic range, and **wing lift fades supersonically** (you rely more on body lift and control deflection). This makes high-Mach flight feel distinctly heavier and less responsive, as it should.

### Stability — emergent, not scripted

There is **no artificial "keep it pointing forward" damping**. Stability is a real, emergent result of where your surfaces are:

- A **horizontal stabilizer** mounted behind the center of mass meets the airflow at an angle whenever the nose pitches up or down, generating a **restoring force** that pushes the nose back. This is automatic **pitch stability**.
- A **vertical stabilizer** (tail fin) does the same for **yaw** whenever the vehicle sideslips.
- **Rotational damping** (resistance to tumbling) also emerges naturally — surfaces far from the center of mass move fast through the air when the vehicle spins, and the resulting forces oppose the spin.

Because it is real physics, **static stability depends on your center of mass**. An aircraft is stable when its **center of mass sits at or slightly ahead of the wing's lift center**, and unstable when the mass is too far aft — exactly like a real plane (and a real RC model). See [Flying Well](#flying-well) below.

> The old artificial high-speed angular stabilization is **gone** for builds using this model. If your plane feels twitchy or won't settle, it is a **balance** problem, not the engine fighting you — move mass forward or add tail area.

### Control surfaces & authority

Control surfaces ([Ailerons](components/miscellaneous/Aileron.md) used as ailerons, elevators, or rudders) are mounted on hinges and **deflect in real time**. The engine re-evaluates a deflected surface's aerodynamics **at its current angle every frame**, so:

- A deflected elevator immediately changes the airflow over the tail and pitches the aircraft.
- Authority scales with the surface's **area**, its **distance from the center of mass** (lever arm), and **air density × speed²**.

> **For strong control:** make control surfaces **large** and mount them **far from the center of mass**. An elevator at the very tail has far more pitch authority than one near the wing. Faster, denser air gives more authority — controls go soft at low speed and high altitude.

### Damage-aware aerodynamics

Battle damage changes how a surface flies. As a panel is deformed or holed (and increasingly as it is destroyed):

- It **sheds lift** — a wrecked wing stops flying.
- It **loses streamlining and pressure recovery**, and **drags more** (it sheds a turbulent wake).

Because lift and drag are computed per-surface, **asymmetric damage** has the right effect: a wing shot up on one side both **rolls** the aircraft (lift loss on that side) and **yaws** it (extra drag on that side). Symmetric, redundant designs survive combat better.

### Buoyancy

Buoyancy is the upward force on submerged blocks, computed per collider from the volume of fluid each block displaces.

**F<sub>buoyancy</sub> = V<sub>displaced</sub> × ρ<sub>fluid</sub> × g**

- Each block's displaced volume = its volume × its material's **volume displacement ratio** (see [Materials](#materials)).
- Damaged blocks lose almost all of their buoyancy.
- Buoyancy is applied where the blocks actually are, so uneven submersion tilts the vessel — a self-righting effect for well-shaped hulls.

### Water

Water is **not a special case**. The model samples the **fluid density at every surface** — air above the waterline, water below, blended smoothly across it — so the *same* lift-and-drag model simply produces much larger forces underwater, where the fluid is **~800× denser** than air. Nothing is hard-coded for "being in water":

- A wing becomes a **hydrofoil**: it lifts and drags underwater exactly as it does in air, only far more strongly. **Control surfaces keep working underwater**, so a submarine steers with the same fins and ailerons a plane uses.
- **Drag is enormous** and grows with the square of speed, so a body entering water decelerates hard and a buoyant hull is naturally held back instead of rocketing out — no artificial damping required.
- **Rotational damping** comes straight from the same model: surfaces far from the center of mass move fast through the dense fluid when the craft turns or tumbles, so boats and submarines settle naturally.

> Because the forces scale with density, **hitting water at speed is a real impact**. A fast belly-flop loads the whole contacting face far past what the structure can take and **crumples or destroys** it, exactly like hitting solid ground — so enter the water at a shallow angle and slow down first.

### Re-entry heating

Moving fast through air heats forward-facing surfaces toward the **stagnation (recovery) temperature**, which rises with the square of speed. It is gentle at supersonic speeds but **explosive at re-entry speeds**, and each material burns up past its own thermal limit — so a heat shield, a steep-but-survivable re-entry angle, and bleeding off speed high up all matter.

## Blocks and Materials

### Materials

Material choice affects **mass** and **buoyancy** — and therefore **balance** — but **not lift or drag**:

| Material | Mass (per block unit) | Volume Displacement (buoyancy) |
|----------|----------------------|--------------------------------|
| **Composite** | 0.25 | 0.20 × occupancy |
| **Concrete** | 10.0 | 0.25 × occupancy |
| **Steel** | 1.0 | 0.01 × occupancy |
| **Aluminium** | 0.5 | 0.01 × occupancy |
| **Glass** | 1.0 | 0.02 × occupancy |
| **Lead** | 150.0 | 1.00 × occupancy |
| **Titanium** | 0.6 | 0.01 × occupancy |

- **Lead** is dense and fully displacing — ideal as **nose ballast** to move your center of mass forward (or as keel weight in a boat), but it sinks.
- **Composite** is light with moderate displacement — the best general floater.
- **Steel/Aluminium/Titanium** barely displace fluid — strong and light, but contribute almost no buoyancy.

> Because material does not change aerodynamics, you choose materials for **strength, weight, heat resistance, and balance** — not for flight performance.

### Block shapes

Slopes, corners, and pyramids occupy half a cube and are lighter. Aerodynamically they matter because they let you **taper** surfaces — turning a blunt, draggy face into a slender, streamlined one. Use them on noses and wing edges.

### Frame beams

Frame beams (the structural bars at frame edges) are **aerodynamically invisible** — no lift, no drag, no buoyancy. Use them freely for internal structure.

## Aerodynamic Components

### Aileron

The [Aileron](components/miscellaneous/Aileron.md) is a hinged control surface used as an aileron, elevator, or rudder. Input is a value from `-1.0` to `+1.0` (rotation −45° to +45°) via its data port.

- It computes its **own** control force and is **excluded from the main shape field**, so it never double-counts and always delivers full authority even when surrounded by structure.
- You can build the fixed part of a wing or tail from blocks (which the field handles) and put **ailerons at the trailing edge** for control.

### Propeller

The [Propeller](components/propulsion/Propeller.md) generates thrust in air or water and is excluded from the shape field (it has its own model). Key behaviors: thrust scales with fluid density and disc area; **ground effect** boosts thrust up to **+50%** near terrain; spinning blades create **gyroscopic** resistance to reorientation; thrust is capped at **100,000 N**.

### Thruster & RCS

Chemical [Thrusters](components/propulsion/thruster/SmallThruster.md) are unaffected by aerodynamics and work the same in atmosphere and vacuum. [RCS](components/propulsion/RCS.md) thrusters lose nearly all effectiveness in dense fluids (attenuation ≈ e<sup>−ρ×4</sup>) — they are for space.

## Flying Well

### Building wings

- Make the wing **geometrically thin** — a broad, flat planform a block or two thick. Thinner cross-section = cleaner lift.
- Give it **span and chord**; a long, broad wing lifts more and stalls more gently.
- **Material and block count don't matter** for lift — build for strength and weight.
- Taper the **leading and trailing edges** with slopes to cut drag.

### Balancing for stable flight

This is the single most important thing for a plane that flies well:

- Keep the **center of mass at or slightly ahead of the wings**. Add dense mass (e.g. **lead** or heavy components) toward the **nose** to pull it forward — real aircraft carry their engine up front for exactly this reason.
- A **tail-heavy** aircraft (mass too far aft) is unstable: it pitches and yaws divergently and is exhausting to fly.
- Mount **horizontal stabilizers** well behind the center of mass for pitch stability, and a **vertical fin** for yaw stability. More tail area and a longer tail boom = more stability.
- If a build won't settle down, **move mass forward** or **add tail area** before blaming the controls.

### Control authority

- Bigger control surfaces, mounted **farther from the center of mass**, give more authority.
- Put **elevators at the extreme tail** for pitch, **rudders on the fin** for yaw, **ailerons at the wingtips** for roll.
- Authority falls at **low speed** and **high altitude** (thin air) — keep speed up on approach.

### Reducing drag

- **Streamline** noses and edges with slopes — slender shapes have dramatically less drag.
- Keep the vehicle **compact**; spread-out structures present more frontal area.
- **Interior blocks are free** — only the outer shell is scanned, so internal layout never adds drag.

### Watercraft

- Use **composite** for the hull (best buoyancy-to-weight); use **lead low in the keel** for stability.
- **Wide, flat hulls** are the most stable — water damping does the rest.
- **Steel/aluminium** barely float; use them above the waterline.

### Surviving combat

- **Symmetry and redundancy:** asymmetric wing damage rolls *and* yaws you, so duplicate critical lifting and control surfaces across both sides.
- Expect a damaged wing to **lose lift and drag more** — keep speed and altitude in reserve.

### Performance

The shape field is cached and only rebuilt when the build changes or takes damage, and its cost is bounded regardless of size or block count. You never pay a per-frame penalty for detail or interior fill — so build as large and as detailed as you like.
