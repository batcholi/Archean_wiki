# Physique N-Body

## Introduction
Archean supporte deux types de physique pour les entités situées en dehors de l'atmosphère d'un corps céleste :

- **Physique à gravité dominante (Par défaut)** : Le corps céleste ayant la plus grande influence gravitationnelle affectera l'entité.
- **Physique N-Body** : Tous les corps célestes affecteront l'entité.

## Pourquoi la physique N-Body n'est-elle pas activée par défaut ?
La **physique N-Body** offre une simulation plus réaliste, destinée aux joueurs ayant des connaissances avancées en physique spatiale qui souhaitent un défi supplémentaire. En réalité, les agences spatiales s'appuient sur des supercalculateurs pour calculer les trajectoires des satellites et des sondes et les ajuster si nécessaire. Dans *Archean*, les joueurs doivent effectuer ces calculs manuellement, limités par la puissance de calcul restreinte d'un ordinateur **XenonCode**.

Un problème unique dans *Archean* est la proximité de la Lune par rapport à la Terre à cette époque, rendant pratiquement impossible l'obtention d'une orbite stable autour de la Terre sans être fortement influencé par la gravité lunaire. Cependant, avec la **physique à gravité dominante**, les joueurs peuvent se concentrer sur la gravité terrestre et ignorer l'influence de la Lune lorsqu'ils sont en orbite autour de la Terre.

## Configuration
Pour activer la physique N-Body, vous devez modifier le fichier `Archean-data/server/ARCHEAN_celestial.ini` et définir la valeur de `nbody` à `yes`.

---
## Informations complémentaires
Lors de l'utilisation de la physique N-Body, nous ne recommandons pas d'utiliser le [NavInstrument](/components/navigation/NavInstrument.md) qui est conçu pour fonctionner nativement avec la physique à gravité dominante. Il est possible de l'utiliser avec la physique N-Body, mais il retournera des informations inexactes et votre orbite ne sera pas stable.

