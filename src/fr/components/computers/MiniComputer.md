<p align="center">
  <img src="MiniComputer.png" />
</p>

|Composant|`MiniComputer`|
|---|---|
|**Module**|`ARCHEAN_computer`|
|**Masse**|5 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|25 x 25 x 50 cm|
#
---

# Description

Le MiniComputer est un composant conçu pour exécuter des programmes XenonCode afin de contrôler d'autres composants.
C'est une variante plus compacte du [Computer](Computer.md) et il ne dispose pas d'écran intégré.

# Usage
Étant complètement similaire en termes de fonctionnalités au Computer, son utilisation est quasiment identique.

La principale différence est que le MiniComputer ne possède pas d'écran intégré et ne peut donc pas afficher de BIOS listant les programmes disponibles.

S'il ne contient qu'un seul programme, celui-ci sera chargé automatiquement. Si vous souhaitez avoir plusieurs programmes, vous devez créer un BIOS personnalisé en créant un fichier "main.xc" pour charger le programme de votre choix.

`main.xc`:
```xc
init
	load_program("rover") ; this will load the file "rover.main.xc"
```
