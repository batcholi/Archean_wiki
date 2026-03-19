<p align="center">
  <img src="ToggleButton.png" />
</p>

|Composant|`ToggleButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Masse**|1 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|25 x 25 x 25 cm|
#
---

# Description
L'interrupteur envoie en continu une valeur lorsqu'il est activé ou désactivé. Par défaut, il envoie `1` lorsqu'il est allumé et `0` lorsqu'il est éteint, mais des valeurs personnalisées peuvent être configurées.

# Usage
La touche `F` est utilisée pour basculer le ToggleButton.

## Configuration
Dans le menu de configuration accessible avec la touche `V` :

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Rend le bouton utilisable des deux côtés |
| **Allow IO Input** | Permet de contrôler le bouton depuis un autre composant via son port de données |
| **Off Value** | La valeur envoyée lorsque le bouton est éteint (par défaut : `0`) |
| **On Value** | La valeur envoyée lorsque le bouton est allumé (par défaut : `1`) |
