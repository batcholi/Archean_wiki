<p align="center">
    <img src="Keyboard.png" />
</p>

|Composant|`Keyboard`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Masse**|2 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|50 x 25 x 25 cm|
#
---
# Description
Le Keyboard est un composant qui fournit un clavier tactile pour envoyer des valeurs alphanumériques à d'autres composants.

# Usage
Vous pouvez saisir une valeur alphanumérique en utilisant les boutons tactiles du clavier en appuyant sur la touche `F`, et elles seront affichées sur l'écran du Keyboard mais ne deviendront effectives/mises à jour que lorsque le bouton de confirmation (vert) sera pressé.

Le bouton jaune permet de supprimer le dernier caractère saisi, tandis que le bouton rouge permet de tout effacer.

> - `^` Permet de basculer entre les minuscules et les majuscules
> - `!?` Affiche les caractères spéciaux
> - Lorsque le bouton de confirmation est pressé, un `1` est envoyé sur le canal 1 pendant 1 tick, sinon `0` est envoyé.
