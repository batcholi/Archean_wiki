<p align="center">
  <img src="ThrottleLever.png" />
</p>

|Composant|`ThrottleLever`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Masse**|1 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|25 x 25 x 50 cm|
#
---

# Description
Le ThrottleLever est un type de commande qui envoie en continu une valeur analogique en fonction de la position du levier. La valeur de sortie est mappée sur une plage configurable (par défaut `-1.0` à `+1.0`).

# Usage
Le levier est contrôlé avec la souris en maintenant la touche `F` et en déplaçant la `souris vers le haut/bas`.

> - Il y a une résistance au centre du levier pour aider à trouver la position centrale précise.
> - Il est possible de configurer les valeurs **Min** et **Max** du levier, ainsi que la fonction **snap-to-center** depuis le menu de configuration accessible avec la touche `V`.
> - Le ThrottleLever peut être contrôlé depuis un autre composant via son port de données en activant le mode "Allow IO Input" dans le menu de configuration.
