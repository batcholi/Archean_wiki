# Pressurization

Pressurization in Archean allows you to create sealed compartments that can hold gases at different pressures than the surrounding environment. This is essential for building spacecraft cabins, submarines, airships, or custom fuel tanks.

## How It Works

### The Volume Component

The [Volume](components/fluids/Volume.md) component is the core of the pressurization system. When placed inside a build and scanned, it uses a **voxel-based algorithm** to detect the boundaries of the enclosed space.

1. **Scanning**: Click the `Scan` button on the Volume component to analyze the surrounding space
2. **Propagation**: The system expands in all directions (X, Y, Z) until it hits solid/airtight blocks
3. **Status**: 
   - **AIRTIGHT** (green): The compartment is completely sealed
   - **LEAK** (red): There's an opening to the outside

> Each Volume component only detects the compartment it is placed in. You need separate Volume components for each isolated compartment.

### Airtight Components

Not all components seal a volume. Only components marked as **airtight** act as walls for pressurization. These include:

| Category | Airtight Components |
|----------|---------------------|
| **Joints** | Small Hinge, Small Pivot, Linear Track |
| **Bridges** | Data Bridge, Fluid Bridge, Item Bridge, Low/High Voltage Bridge |
| **Junctions** | Fluid Junction, Item Junction |
| **Storage** | Container, Small Container |
| **Docking** | Dockable Door |
| **Other** | Passive Radiator, Aileron, Mini Router... |

Regular building blocks (frames, panels) are also airtight by default.

## Joints and Pressurization

Joints ([Small Hinge](components/joints/SmallHinge.md), [Small Pivot](components/joints/SmallPivot.md), [Linear Track](components/joints/LinearTrack.md)) have a special behavior:

- **When aligned** (neutral position, value = 0): The joint is airtight and seals the volume
- **When moved** (any other position): The joint breaks the seal, causing a leak

This allows you to create **functional doors and hatches**:

1. Build a door frame with blocks
2. Place a Small Hinge or Small Pivot
3. Build the door panel on the joint's movable part
4. When the joint returns to position 0, the compartment seals

> **Important**: When a joint moves, the Volume component automatically re-scans to detect if the seal is broken.

## Dockable Doors

The [Dockable Door](components/docking/DockableDoor.md) has integrated pressurization management:

- **Closed**: Acts as an airtight seal
- **Open**: Allows gas transfer between:
  - The inside compartment and outside environment (if not docked)
  - Two docked compartments (if docked with another Dockable Door)

When two spacecraft dock and open their Dockable Doors, their atmospheres mix and equalize pressure.

## Fluid Port - The Key Interface

The [Fluid Port](components/fluids/FluidPort.md) is the **essential component** for interacting with pressurized volumes. It's the only way to programmatically inject or extract fluids from a sealed compartment.

### How It Works

The Fluid Port acts as a **bridge** between the fluid system (pumps, tanks, pipes) and a pressurized volume:

- **Position matters**: The port's nozzle must be **physically inside** the pressurized volume to interact with it
- **Automatic detection**: It automatically detects if it's inside a scanned volume or in the ambient environment
- **Bidirectional**: Can both push fluids into and pull fluids from a volume

### Physical Limitations

The Fluid Port has hard-coded physical limits:

| Property | Value |
|----------|-------|
| **Maximum flow rate** | 1.0 m³/s |
| **Flow calculation** | Limited by `min(requested_mass / density, 1.0 m³/s × deltaTime)` |

This means:
- Dense fluids (liquids) transfer more mass per second than light fluids (gases)
- You cannot instantly fill or empty a volume - it takes time
- Multiple Fluid Ports can be used in parallel to increase total flow rate

### Usage Scenarios

#### Filling a Custom Fuel Tank
1. Build a sealed compartment with a Volume component
2. Place a Fluid Port with its nozzle **inside** the volume
3. Connect the Fluid Port to a Fluid Pump and a fuel source (tank, electrolyzer, etc.)
4. The pump pushes fuel through the Fluid Port into your custom tank

#### Extracting from a Volume
1. Place a Fluid Port inside the pressurized volume
2. Connect it to a pump configured to pull
3. The fluid composition inside the volume is extracted proportionally

#### Cabin Life Support
1. Create a sealed cabin with a Volume component
2. Place a Fluid Port inside for injecting breathable atmosphere
3. Connect to an oxygen source and pump
4. Use a second Fluid Port to vent CO2 or maintain pressure

### Environment Detection

When the Fluid Port is **not** inside a pressurized volume, it interacts with the **ambient environment**:
- On Earth: Pulls atmospheric air (N2, O2 mix)
- In water: Pulls H2O
- In space: Nothing to pull (vacuum)

Press `V` on a Fluid Port to see:
- Current environment density (kg/m³)
- Environment composition (percentage by volume)

## Gas Physics

The pressurization system simulates realistic gas behavior:

### Properties Tracked
- **Pressure** (Pascals/kPa)
- **Temperature** (Kelvin)
- **Density** (kg/m³)
- **Composition** (O2, N2, H2, CH4, H2O, etc.)
- **Liquid Level** (for storing liquids)

### Gas Transfer
- Gases flow from high pressure to low pressure
- Transfer rate depends on the pressure difference and opening size
- Temperature is averaged when gases mix

### Leaks
When a compartment has a leak:
- Gas escapes to (or enters from) the environment
- The transfer continues until pressures equalize
- In space (vacuum), all gas will eventually escape

## Building Tips

### Creating a Sealed Cabin

1. Build an enclosed space with blocks on all sides
2. Place a Volume component inside
3. Click `Scan` - if it shows **AIRTIGHT**, you're done
4. If it shows **LEAK**, check for gaps in your structure

### Common Leak Sources

- Missing blocks in corners or edges
- Joints that aren't at position 0
- Open Dockable Doors
- Components that aren't airtight placed in walls

### Multiple Compartments

For complex builds with multiple sealed areas:
- Place one Volume component per compartment
- Each will track its own pressure and composition
- Connected volumes (sharing space) will automatically transfer gases between them

### Using Volumes as Fuel Tanks

The Volume component can store any fluid, not just breathable air:
- Fill with liquid O2, H2, CH4, or H2O
- Use with [Fluid Pumps](components/fluids/fluidPump/FluidPump.md) to extract fuel
- The irregular shape of your build becomes your tank shape