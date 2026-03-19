# Éditeur de nœuds visuels
L'éditeur de nœuds de l'IDE XenonCode offre une large gamme de nœuds pour vous aider à créer des scripts et des programmes.

Il est suffisamment complet pour gérer des tâches complexes et est aussi plus facile à appréhender pour les débutants. Pour des possibilités encore plus avancées, vous pouvez aussi utiliser [XenonCode](documentation.md) en mode texte (code).

---
## Génération de code

Le système de nœuds visuels générera toujours automatiquement du code en arrière-plan au fur et à mesure que vous faites des modifications.
Le code est généré chaque fois qu'un nœud terminal `output`, `print` ou `execute` est ajouté, et il se propagera en arrière à travers les dépendances d'entrée.
Cela signifie qu'ajouter un nœud d'entrée ne générera aucun code, mais ajouter un nœud de sortie générera le code pour les deux nœuds lorsque vous les connecterez ensemble.

---
## Liste des nœuds

Voici la liste des différents types de nœuds disponibles dans l'éditeur, avec leurs descriptions si nécessaire :

`Constant Number` Définit une valeur numérique constante.

`Constant Text` Définit une valeur textuelle constante.

`Variable Number` Définit une valeur numérique variable qui peut être définie et réinitialisée par un autre nœud.

`Variable Text` Définit une valeur textuelle variable qui peut être définie et réinitialisée par un autre nœud.

`Comment` Permet d'afficher un bloc de commentaire dans votre script.

---
### Input
`By Alias` Utilise un nœud de sortie d'un composant en utilisant son alias lors de la communication via un Router.

`0,1,2,3...` Utilise un nœud de sortie d'un composant actuellement connecté à un port de l'ordinateur. Lorsque vous connectez un composant à un port, il est automatiquement détecté par l'ordinateur.

---
### Output
`Print (Console log)` Affiche un nombre/texte dans la console de l'ordinateur.

`By Alias` Utilise un nœud d'entrée d'un composant en utilisant son alias lors de la communication via un Router.

`0,1,2,3...` Utilise un nœud d'entrée d'un composant actuellement connecté à un port de l'ordinateur. Lorsque vous connectez un composant à un port, il est automatiquement détecté par l'ordinateur.

---
### Math
Les nœuds Math peuvent avoir plus de deux entrées, vous permettant d'enchaîner plusieurs valeurs dans une seule opération.

`Add` Retourne l'addition de deux ou plusieurs valeurs.

`Subtract` Retourne la soustraction de deux ou plusieurs valeurs.

`Multiply` Retourne le produit de deux ou plusieurs valeurs.

`Divide` Retourne la division de deux ou plusieurs valeurs.

`Absolute` Retourne la valeur absolue d'un nombre.

`Negative` Retourne la valeur négative d'un nombre.

`Modulo` Retourne le reste de la division de deux nombres.

`Floor` Retourne la valeur arrondie à l'entier inférieur.

`Ceil` Retourne la valeur arrondie à l'entier supérieur.

`Round` Retourne la valeur arrondie à l'entier le plus proche.

`Fract` Retourne la partie décimale d'un nombre.

`Sign` Retourne le signe d'un nombre.

`Pow` Retourne la puissance de deux nombres.

`Log` Retourne le logarithme d'un nombre.

`Sqrt` Retourne la racine carrée d'un nombre.

`Clamp` Retourne la valeur d'un nombre limitée entre un minimum et un maximum.

`Step` Retourne 0 si la valeur est inférieure à un seuil et 1 si elle est supérieure.

`Smoothstep` Retourne une interpolation lisse bornée entre deux valeurs basée sur un ratio.

`Lerp` Retourne une interpolation linéaire entre deux valeurs basée sur un ratio.

`Sin` Retourne le sinus d'un angle (donné en radians).

`Cos` Retourne le cosinus d'un angle (donné en radians).

`Tan` Retourne la tangente d'un angle (donné en radians).

`Asin` Retourne l'angle arcsinus en radians d'un nombre.

`Acos` Retourne l'angle arccosinus en radians d'un nombre.

`Atan` Retourne l'angle arctangente en radians d'un nombre.

---
### Boolean
Les valeurs booléennes sont représentées comme des valeurs numériques. 0 signifie Faux, toute autre valeur signifie Vrai.
Les nœuds booléens peuvent avoir plus de deux entrées, vous permettant d'enchaîner plusieurs conditions dans une seule opération.

`And` Retourne 1 si toutes les valeurs sont évaluées comme Vrai.

`Or` Retourne 1 si l'une des valeurs est évaluée comme Vrai.

`Xor` Retourne 1 si un nombre impair de valeurs est évalué comme Vrai.

`Not` Retourne l'opposé d'une valeur booléenne donnée.

---
### Compare
`Equal` Compare si deux valeurs sont égales et retourne un booléen (0 ou 1).

`Greater` Compare si une valeur est supérieure à une autre et retourne un booléen (0 ou 1).

`Lesser` Compare si une valeur est inférieure à une autre et retourne un booléen (0 ou 1).

---
### Functions
`Expression` Permet d'écrire une expression mathématique plus avancée en utilisant les fonctions XenonCode et/ou l'algèbre.

`Switch` Retourne différentes valeurs selon la valeur d'entrée.

`Counter` Retourne un compteur qui s'incrémente à chaque appel. La valeur initiale, le minimum et le maximum peuvent être définis.

`Pulse` Retourne 1 lorsque sa valeur d'entrée a changé.

`PulseToggle` Retourne un booléen qui bascule entre Vrai/Faux chaque fois que sa valeur d'entrée a changé.

`Text` Permet d'écrire une expression textuelle plus avancée.

`PID Controller` Retourne une valeur de contrôle PID basée sur l'erreur, l'intégrale de l'erreur et la dérivée de l'erreur.

`Unit Converter` Convertit une valeur entre des unités physiques courantes de la même catégorie. Catégories supportées : Angle (Radians, Degrés), Rotation (RPS, RPM), Vitesse (m/s, km/h, mph, ft/s, nœuds), Température (Kelvin, Celsius, Fahrenheit), Pression (Pascal, bar, psi, atm), Force (Newton, lbf, kgf).

---
### Execution
`Statement` Permet d'écrire une instruction XenonCode pure comme un appel de fonction. Doit sortir vers un nœud Conditional ou Execute.

`Conditional` Considère l'instruction donnée seulement si la condition donnée est évaluée comme Vrai. Peut être enchaîné avec d'autres conditionnels.

`Execute` Exécute les instructions connectées dans l'ordre de haut en bas.

`Include` Inclut un autre script XenonCode dans le script courant. Assurez-vous que vos nœuds de variables et de constantes ont des noms uniques.

---
### Timing

`Time` Retourne le timestamp Unix courant en unités de secondes, avec des décimales à la précision de la microseconde.

`Delay` Retourne un booléen 1 après un délai donné en secondes après que l'entrée Set a reçu un changement de 1 à 0.

`Blinker` Retourne un booléen alternant entre 0 et 1 changeant à chaque intervalle de temps défini en secondes.

`Smooth` Retourne une valeur interpolant de la cible précédente (ou 0) à la valeur cible actuelle avec une durée donnée en secondes après que l'entrée Start a reçu un changement de 1 à 0.
