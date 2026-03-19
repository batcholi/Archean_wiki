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

MiniComputer — это компонент, предназначенный для запуска программ XenonCode с целью управления другими компонентами.
Он является уменьшенной версией [Computer](Computer.md) и не имеет встроенного экрана.

# Usage
По функциональности полностью аналогичен Computer, поэтому его использование практически идентично.

Основное отличие состоит в том, что MiniComputer не имеет встроенного экрана и, следовательно, не может отображать BIOS со списком доступных программ.

Если он содержит только одну программу, она будет загружена автоматически. Если вы хотите иметь несколько программ, необходимо создать собственный BIOS, создав файл "main.xc" для загрузки нужной программы.

`main.xc`:
```xc
init
	load_program("rover") ; this will load the file "rover.main.xc"
```
