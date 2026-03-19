# Fluid Snippets

Hier sind einige Beispiel-XenonCode-Skripte, die die Fluid-Nutzung beim Modding mit XenonCode demonstrieren.

In den folgenden Beispielen verwenden wir ein Slider-Makro, um die Komponenten zu steuern. Dies kann so in der Benutzeroberfläche belassen oder durch eine andere Eingabequelle ersetzt werden (zum Beispiel eine Throttle-Komponente, einen Schalter, etc.).
```xc
#INFO slider "slider" 0 -1 1 "throttle"
```

Die Komponente, die zum Erstellen dieser Beispiele verwendet wurde, hat einen Fluid-Eingangsport namens "fluid-in" und einen Fluid-Ausgangsport namens "fluid-out".
Diese Beispiele dienen als Referenz und können an deine Bedürfnisse angepasst werden.


### Bridge
```xc
push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
    if $port == "fluid-in"
        $mass -= push_fluid("fluid-out", $molecule, $mass, $temperature)
    elseif $port == "fluid-out"
        $mass -= push_fluid("fluid-in", $molecule, $mass, $temperature)
```

### Unendliche Quelle
```xc
pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number)
    if $port == "fluid-in"
        $compositionOut.O2 = $maxMass
        $temperatureOut = 300
```

### Tank
```xc
const $tankCapacity = 50 ; kilograms
const $tankBasePushRate = 1 ; kilograms per second
const $tankEmptyWeight = 20 ; kilograms

storage var $tankComposition = ""
storage var $tankTemperature = 0 ; Kelvin
storage var $tankContentMass = 0 ; kilograms

accept_push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
    var $availableCapacity = max(0, $tankCapacity - $tankContentMass)
    var $pushed = min($mass, $availableCapacity)
    if $port == "fluid-in" && $pushed > 0 
        $tankComposition.$molecule += $pushed
        $tankTemperature = ($tankTemperature * $tankContentMass + $temperature * $pushed) / ($tankContentMass + $pushed)
        $tankContentMass += $pushed
        $mass -= $pushed

accept_pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number)
    if $port == "fluid-out" && $tankContentMass > 0
        foreach $tankComposition ($molecule ,$mass)
            var $massRatio = $mass / $tankContentMass
            var $pushed = min($massRatio * $maxMass, $mass)
            $compositionOut.$molecule += $pushed
            $tankComposition.$molecule -= $pushed
            $tankContentMass -= $pushed
        $temperatureOut = $tankTemperature

accept_pull_fluid_potential($port:text, $potential:number)
    if $port == "fluid-out"
        $potential = if($tankContentMass > 0, 1, 0)

accept_push_fluid_potential($port:text, $potential:number)
    if $port == "fluid-in"
        $potential = if($tankContentMass < $tankCapacity, 1, 0)

tick
    if $tankContentMass > 0
        foreach $tankComposition ($molecule ,$mass)
            var $massRatio = $mass / $tankContentMass
            var $consume = min($massRatio * $tankBasePushRate * delta_time, $mass)
            var $pushed = push_fluid("fluid-out", $molecule, $consume, $tankTemperature)
            $tankComposition.$molecule -= $pushed
            $tankContentMass -= $pushed
    set_mass($tankContentMass + $tankEmptyWeight)
```

### Pumpe (100kg/s)
```xc
tick
    var $throttle = get_info("slider")
    if $throttle > 0
        var $potential = pull_fluid_potential("fluid-in")
        var $pulled = pull_fluid("fluid-in", 100 * $throttle * $potential * delta_time)
        var $composition = $pulled.composition
        var $temperature = $pulled.temperature
        foreach $composition ($molecule ,$mass)
            push_fluid("fluid-out", $molecule, $mass:number, $temperature:number)
    elseif $throttle < 0
        var $potential = pull_fluid_potential("fluid-out")
        var $pulled = pull_fluid("fluid-out", -100 * $throttle * $potential * delta_time)
        var $composition = $pulled.composition
        var $temperature = $pulled.temperature
        foreach $composition ($molecule ,$mass)
            push_fluid("fluid-in", $molecule, $mass:number, $temperature:number)
```

### Ventil
```xc
accept_push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
    var $open = get_info("slider")
    if $open <= 0
        return
    if $port == "fluid-in"
        var $requested = $mass * $open
        var $pushed = push_fluid("fluid-out", $molecule, $requested, $temperature)
        $mass -= $pushed
    elseif $port == "fluid-out"
        var $requested = $mass * $open
        var $pushed = push_fluid("fluid-in", $molecule, $requested, $temperature)
        $mass -= $pushed

accept_pull_fluid_potential($port:text, $potential:number)
    var $open = get_info("slider")
    if $port == "fluid-out"
        $potential = pull_fluid_potential("fluid-in") * $open
    elseif $port == "fluid-in"
        $potential = pull_fluid_potential("fluid-out") * $open

accept_push_fluid_potential($port:text, $potential:number)
    var $open = get_info("slider")
    if $port == "fluid-in"
        $potential = push_fluid_potential("fluid-out") * $open
    elseif $port == "fluid-out"
        $potential = push_fluid_potential("fluid-in") * $open

accept_pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number)
    var $open = get_info("slider")
    if $open <= 0
        return
    var $requested = $maxMass * $open
    if $port == "fluid-out"
        var $pulled = pull_fluid("fluid-in", $requested)
        $compositionOut = $pulled.composition
        $temperatureOut = $pulled.temperature
    elseif $port == "fluid-in"
        var $pulled = pull_fluid("fluid-out", $requested)
        $compositionOut = $pulled.composition
        $temperatureOut = $pulled.temperature
```

### Einweg-Ventil
```xc
accept_push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
    var $open = get_info("slider")
    if $open <= 0
        return
    if $port == "fluid-in"
        var $requested = $mass * $open
        var $pushed = push_fluid("fluid-out", $molecule, $requested, $temperature)
        $mass -= $pushed

accept_pull_fluid_potential($port:text, $potential:number)
    var $open = get_info("slider")
    if $port == "fluid-out"
        $potential = 0
    elseif $port == "fluid-in"
        $potential = pull_fluid_potential("fluid-out") * $open

accept_push_fluid_potential($port:text, $potential:number)
    var $open = get_info("slider")
    if $port == "fluid-in"
        $potential = push_fluid_potential("fluid-out") * $open
    elseif $port == "fluid-out"
        $potential = 0

accept_pull_fluid($port:text, $maxMass:number, $compositionOut:text, $temperatureOut:number)
    var $open = get_info("slider")
    if $open <= 0
        return
    var $requested = $maxMass * $open
    if $port == "fluid-in"
        var $pulled = pull_fluid("fluid-out", $requested)
        $compositionOut = $pulled.composition
        $temperatureOut = $pulled.temperature
```
