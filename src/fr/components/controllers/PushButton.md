<p align="center">
  <img src="PushButton.png" />
</p>

|Composant|`PushButton`|
|---|---|
|**Module**|`ARCHEAN_hid`|
|**Masse**|1 kg|
|[**Taille**](# "Basée sur l'occupation du composant dans une grille fixe de 25 cm.")|25 x 25 x 25 cm|
#
---

# Description
Le PushButton envoie en continu une valeur de `1` tant qu'il est pressé, sinon `0`.

# Usage
Le bouton est activé avec la touche `F` et reste actif tant que la touche est maintenue enfoncée.

## Configuration
Dans le menu de configuration accessible avec la touche `V` :

| Option | Description |
|--------|-------------|
| **Dual-Sided** | Rend le bouton utilisable des deux côtés |
| **Single Pulse** | Lorsqu'activé, le bouton envoie `1` pendant un seul tick puis se réinitialise immédiatement à `0`, au lieu de rester actif tant qu'il est maintenu |
