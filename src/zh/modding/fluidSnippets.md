# 流体代码片段

以下是一些演示在 XenonCode modding 中使用流体的示例脚本。

在以下示例中，我们使用 Slider 宏来控制组件。这可以保持原样作为用户界面，也可以替换为其他输入源（例如 Throttle 组件、开关按钮等）。
```xc
#INFO slider "slider" 0 -1 1 "throttle"
```

用于创建这些示例的组件有一个名为 "fluid-in" 的流体输入端口和一个名为 "fluid-out" 的流体输出端口。
这些示例仅供参考，可以根据你的需要进行调整。


### Bridge
```xc
push_fluid($port:text, $molecule:text, $mass:number, $temperature:number)
    if $port == "fluid-in"
        $mass -= push_fluid("fluid-out", $molecule, $mass, $temperature)
    elseif $port == "fluid-out"
        $mass -= push_fluid("fluid-in", $molecule, $mass, $temperature)
```

### Infinite source
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

### Pump (100kg/s)
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

### Valve
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

### One way Valve
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
