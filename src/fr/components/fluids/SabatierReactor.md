<p align="center">
<img src="SabatierReactor.png" />
</p>

|Component|`SabatierReactor`|
|---|---|
|**Module**|`ARCHEAN_chemical`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Accept Push/Initiate Push|
#
---

# Description
Le Sabatier Reactor est un composant qui permet la conversion du dioxyde de carbone (CO2) et de l'hydrogene (H2) en methane (CH4).

# Usage
Le Sabatier Reactor necessite une alimentation electrique haute tension et consomme jusqu'a 10 kW en fonctionnement. Il capture le CO2 directement depuis l'air ambiant autour de lui, ce qui signifie qu'il doit etre place dans un environnement contenant du CO2 pour fonctionner.

Pour demarrer le processus de conversion, connectez simplement une source d'hydrogene a son port d'entree jaune. Le methane produit peut ensuite etre collecte depuis le port de sortie rouge.

### Production
Le Sabatier Reactor peut traiter jusqu'a 0,1 kg d'hydrogene par seconde, fournissant 0,2 kg de methane par seconde.

> Le Sabatier Reactor libere de l'eau (H2O) dans son environnement pendant la reaction. Cette eau n'est generalement pas visible, mais dans un volume scelle, elle commencera a s'accumuler.
