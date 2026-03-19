<p align="center">
    <img src="Numpad.png" />
</p>

|Composant|`Numpad`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Masse**|1 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|25 x 25 x 25 cm|
#
---
# Description
Le Numpad est un composant qui fournit un pavé numérique tactile pour envoyer des valeurs numériques à d'autres composants.

# Usage
Vous pouvez saisir une valeur numérique en utilisant les boutons tactiles du pavé numérique en appuyant sur la touche `F`, et elles seront affichées sur l'écran du Numpad mais ne deviendront effectives/mises à jour que lorsque le bouton de confirmation (vert) sera pressé.

Le bouton jaune permet de supprimer le dernier chiffre saisi, tandis que le bouton rouge permet de tout effacer.

> - Si la valeur actuelle est négative, vous pouvez la rendre positive en appuyant sur le bouton tactile `-`.
> - Lorsque le bouton de confirmation est pressé, un `1` est envoyé sur le canal 1 pendant 1 tick, sinon `0` est envoyé.
