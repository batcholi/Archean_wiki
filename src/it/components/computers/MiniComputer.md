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

Il MiniComputer è un componente progettato per eseguire programmi XenonCode per controllare altri componenti.
È una variante più piccola del [Computer](Computer.md) e non dispone di uno schermo integrato.

# Usage
Essendo completamente simile in termini di funzionalità al Computer, il suo utilizzo è quasi identico.

La differenza principale è che il MiniComputer non ha uno schermo integrato e quindi non può visualizzare un BIOS con l'elenco dei programmi disponibili.

Se contiene un solo programma, questo verrà caricato automaticamente. Se si desidera avere più programmi, è necessario creare un BIOS personalizzato creando un file "main.xc" per caricare il programma desiderato.

`main.xc`:
```xc
init
	load_program("rover") ; this will load the file "rover.main.xc"
```
