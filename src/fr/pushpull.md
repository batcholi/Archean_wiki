# Push & Pull

Dans Archean, les objets et les fluides ne se déplacent pas d'eux-mêmes. Chaque transfert entre deux composants suit un modèle **Push/Pull** : un côté doit activement initier l'action, et l'autre côté doit l'accepter.

Comprendre ce système est essentiel pour construire des installations fonctionnelles. La page wiki de chaque composant indique son mode Push/Pull dans le tableau d'informations en haut.

## Les trois rôles

### Initiate
Un composant qui **initie** une action démarre activement le transfert. Il poussera des objets/fluides vers ce qui est connecté à sa sortie, ou tirera depuis ce qui est connecté à son entrée.

### Accept
Un composant qui **accepte** une action est passif. Il peut recevoir un push ou répondre à un pull, mais il n'initiera jamais un transfert de lui-même.

### Forward
Un composant qui **transmet** une action la fait passer de l'autre côté. Il ne stocke rien — il relaie simplement l'action push ou pull d'un port à l'autre.

> Les transmetteurs sont transparents : si quelque chose pousse dans un côté d'un Bridge, le Bridge pousse dans ce qui se trouve de l'autre côté. Idem pour les pulls.

## Fonctionnement

- **Push** : La source envoie des objets/fluides vers la destination. La source décide *quoi* et *quand* envoyer.
- **Pull** : La destination demande des objets/fluides à la source. La destination décide *quoi* et *quand* récupérer.

Une connexion ne fonctionne que lorsqu'un côté **initie** et que l'autre côté **accepte** (ou transmet à quelque chose qui accepte). Deux composants passifs connectés ensemble ne transféreront jamais rien.

---

## Une erreur courante

Considérez cette configuration : **Mining Drill → Container → Crusher**

Le Mining Drill **initie un push**, donc les roches arrivent dans le Container. Mais le Container ne fait qu'**accepter** — il ne poussera jamais rien vers l'extérieur de lui-même. Et le Crusher ne fait qu'**accepter les push** — il ne tirera pas non plus depuis le Container. Résultat : les roches s'accumulent dans le Container et rien n'atteint le Crusher.

### Solutions

**Mining Drill → Crusher → Container**
Le Mining Drill pousse les roches vers le Crusher, qui les accepte, les traite, et pousse les minerais résultants vers le Container.

**Mining Drill → Container → Item Conveyor → Crusher → Container**
L'[Item Conveyor](components/items/ItemConveyor.md) est un **initiateur** — il tire activement depuis le premier Container et pousse vers le Crusher. C'est utile quand vous voulez tamponner les roches ou contrôler le débit.

---

## Lire les pages des composants

Chaque page de composant affiche son mode Push/Pull dans le tableau d'informations :

| Mode | Signification |
|---|---|
| `Initiate Push` | Pousse activement vers sa sortie |
| `Initiate Pull` | Tire activement depuis son entrée |
| `Initiate Push/Pull` | Fait activement les deux |
| `Accept Push` | Reçoit passivement les push |
| `Accept Pull` | Répond passivement aux pull |
| `Accept Push/Pull` | Fait passivement les deux |
| `Accept Push/Pull -> Forwards action to other side` | Relaie les actions à travers |

Certains composants combinent les rôles — par exemple, le Crusher **accepte les push** sur son entrée (roches entrant) et **initie un push** sur sa sortie (minerais sortant).
