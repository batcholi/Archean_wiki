<p align="center">
  <img src="DashboardTool.png" />
</p>

|Item|`DashboardTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
The Dashboard Tool is used to design dashboards with smaller components in a more flexible manner. It allows you to place screens, buttons, LEDs, labels, and other elements on surfaces to create custom control panels and displays.

# Usage
Press `C` to open the radial menu and select the element you want to place.

Press `V` to open the GetInfo menu of an element and access additional options.

## Available Elements

### Screens

| Type | Resolution | Max Size |
|------|------------|----------|
| Standard Screen | 2 pixels/cm (200 px/m) | 4 m |
| HD Screen | 6 pixels/cm (600 px/m) | 50 cm |

HD Screens provide 3x higher pixel density for more detailed displays but are limited to 50 cm.

Screens update every 20 ms.

**GetInfo options (`V`):**
- **Matte**: Toggle between glossy and matte surface

### Labels
Labels function like screens but with a resolution of 5 pixels/cm (500 px/m) and a maximum size of 1 m.

Labels update every 500 ms, making them better suited for static or slow-changing text displays.

**GetInfo options (`V`):**
- **Text**: Enter the text to display (multiline supported)
- **Text Align**: Center, Left, Right, Top, Bottom, Top Left, Bottom Left, Top Right, Bottom Right
- **Text Size**: 1 to 8
- **Color picker**: Set the text color

### Buttons

#### [PushButton](../components/controllers/PushButton.md)
Sends a signal when pressed.

**GetInfo options (`V`):**
- **Single Pulse**: When enabled, sends only one pulse per press instead of continuous signal while held

#### [ToggleButton](../components/controllers/ToggleButton.md)
Switches between on/off states when clicked.

**GetInfo options (`V`):**
- **Allow IO input**: Accept input signals to control the state
- **Horizontal**: Toggle horizontal orientation

#### ArrowButton
Directional button with rotation options.

**GetInfo options (`V`):**
- **Rotation**: 0-3 (90° increments)
- **Single Pulse**: Same as PushButton

### LED
LEDs can be clicked like push buttons and can display custom colors.

**GetInfo options (`V`):**
- **Single Pulse (press)**: Send only one pulse per click
- **Color From Input**: Receive color value from data channel instead of using the configured color
- **Color picker**: Set the LED color

## Adding Components to Dashboards
Any component can be placed on a dashboard at arbitrary positions and orientations. This allows embedding instruments, sensors, or other components directly into your dashboard design.

## Programming
For information on programming dashboard screens with XenonCode, see the [Dashboard XenonCode documentation](../xenoncode/dashboard.md).
