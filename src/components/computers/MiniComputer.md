<p align="center">
  <img src="MiniComputer.png" />
</p>

|Component|`MiniComputer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Mass**|5 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 50 cm|
#
---

# Description

The MiniComputer is a component designed to run XenonCode programs to control other components.
It is a smaller variant of the [Computer](Computer.md) and does not have a built-in screen.

# Usage
Being completely similar in terms of features to the Computer, its usage is almost identical.

The main difference is that the MiniComputer does not have a built-in screen and therefore cannot display a BIOS that lists the available programs.

If it contains only one program, it will be loaded automatically. If you want to have multiple programs, you must make a custom BIOS by creating a "main.xc" file to load the program of your choice.

`main.xc`:
```xc
init
	load_program("rover") ; this will load the file "rover.main.xc"
```
