<p align="center">
    <img src="BlueprintTool.png" />
</p>

|Item|`BlueprintTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
The Blueprint Tool allows you to save a copy of a build. Blueprints are saved in the `(Client Settings)/blueprints` folder in `.json` format, one per blueprint with its respective name.

With this system, you can transfer your builds to other worlds or servers, share them with friends or simply duplicate a build.

# Usage

## Scanning a Build
1. **Left-click** to enter Scan Mode (range: 100 meters)
2. Aim at the build you want to save
3. **Hold Left-click** for one second to scan and save the blueprint
4. Enter a name in the popup dialog

### Updating an Existing Blueprint
To update an existing blueprint, simply enter the exact same name as an existing blueprint. The **Create** button will change to **Update**, allowing you to overwrite the previous version while preserving the Steam Workshop ID if published.

## Spawning a Blueprint
1. **Right-click** to open the blueprints interface
2. Use the **search bar** to filter blueprints by name
3. Select a blueprint from the **Local** or **Steam Workshop** tab
4. Click **Spawn** to enter placement mode

### Placement Controls

#### Free Placement (new build)
| Action | Control |
|--------|---------|
| Confirm spawn | **Hold Left-click** (2 seconds) |
| Rotate | **Mouse wheel** |
| Snap to ground and set static | **Hold Shift** |
| Cancel | **Right-click** |

#### On an Existing Build
When aiming at an existing build, **quick press Left-click** to attach the blueprint and enter **Gizmo mode**:

| Action | Control |
|--------|---------|
| Translate / Rotate | **Gizmo handles** (drag) |
| Toggle mouse look | **Right-click** |
| Confirm spawn | **Hold Left-click** away from gizmo (2 seconds), or **Spawn** button |
| Cancel | **Right-click** (when not in mouse look) |

### Spawning in Space
When in space near an existing build, you can spawn blueprints the same way as [creating a new build](ConstructorTool.md#creating-a-build-in-space).

## Steam Workshop
- Click **Publish** next to a local blueprint to upload it to Steam Workshop
- A built-in screenshot tool is available when publishing

# Notes
- In Adventure mode, required items are displayed with their status (green = available, red = missing, orange = mod not active)
- If an [OwnerPad](../components/miscellaneous/OwnerPad.md) has been added, you must have the "Build" permission to save a blueprint
