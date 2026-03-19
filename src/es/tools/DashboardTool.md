<p align="center">
  <img src="DashboardTool.png" />
</p>

|Item|`DashboardTool`|
|---|---|
|**Module**|`ARCHEAN_build`|

# Description
El Dashboard Tool se utiliza para disenar paneles de control con componentes mas pequenos de forma mas flexible. Te permite colocar pantallas, botones, LEDs, etiquetas y otros elementos en superficies para crear paneles de control y visualizaciones personalizadas.

# Usage
Presiona `C` para abrir el menu radial y seleccionar el elemento que deseas colocar.

Presiona `V` para abrir el menu GetInfo de un elemento y acceder a opciones adicionales.

## Available Elements

### Screens

| Tipo | Resolucion | Tamano maximo |
|------|------------|----------|
| Standard Screen | 2 pixeles/cm (200 px/m) | 4 m |
| HD Screen | 6 pixeles/cm (600 px/m) | 50 cm |

Las pantallas HD proporcionan 3 veces mas densidad de pixeles para visualizaciones mas detalladas, pero estan limitadas a 50 cm.

Las pantallas se actualizan cada 20 ms.

**Opciones de GetInfo (`V`):**
- **Matte**: Alternar entre superficie brillante y mate

### Labels
Los Labels funcionan como pantallas pero con una resolucion de 5 pixeles/cm (500 px/m) y un tamano maximo de 1 m.

Los Labels se actualizan cada 500 ms, lo que los hace mas adecuados para visualizaciones de texto estatico o que cambia lentamente.

**Opciones de GetInfo (`V`):**
- **Text**: Introduce el texto a mostrar (multilinea soportada)
- **Text Align**: Center, Left, Right, Top, Bottom, Top Left, Bottom Left, Top Right, Bottom Right
- **Text Size**: 1 a 8
- **Color picker**: Establece el color del texto

### Buttons

#### [PushButton](../components/controllers/PushButton.md)
Envia una senal cuando se presiona.

**Opciones de GetInfo (`V`):**
- **Single Pulse**: Cuando esta activado, envia solo un pulso por pulsacion en lugar de una senal continua mientras se mantiene presionado

#### [ToggleButton](../components/controllers/ToggleButton.md)
Alterna entre estados encendido/apagado cuando se hace clic.

**Opciones de GetInfo (`V`):**
- **Allow IO input**: Aceptar senales de entrada para controlar el estado
- **Horizontal**: Alternar orientacion horizontal

#### ArrowButton
Boton direccional con opciones de rotacion.

**Opciones de GetInfo (`V`):**
- **Rotation**: 0-3 (incrementos de 90°)
- **Single Pulse**: Igual que PushButton

### LED
Los LEDs se pueden pulsar como botones y pueden mostrar colores personalizados.

**Opciones de GetInfo (`V`):**
- **Single Pulse (press)**: Enviar solo un pulso por clic
- **Color From Input**: Recibir el valor de color desde un canal de datos en lugar de usar el color configurado
- **Color picker**: Establecer el color del LED

### Trim
El Trim es un elemento decorativo que se puede colocar con una precision de 1 cm y redimensionar en incrementos de 1 cm hasta 4 m. Util para agregar separacion visual o bordes al diseno de tu panel de control.

## Adding Components to Dashboards
Cualquier componente se puede colocar en un dashboard en posiciones y orientaciones arbitrarias. Esto permite incrustar instrumentos, sensores u otros componentes directamente en el diseno de tu panel de control.

## Programming
Para informacion sobre la programacion de pantallas de dashboard con XenonCode, consulta la [documentacion de Dashboard en XenonCode](../xenoncode/dashboard.md).
