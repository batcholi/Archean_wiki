# N-Body-Physik

## Einleitung
Archean unterstützt zwei Arten von Physik für Entitäten, die sich außerhalb der Atmosphäre eines Himmelskörpers befinden:

- **Dominante Gravitationsphysik (Standard)**: Der Himmelskörper mit dem größten Gravitationseinfluss wirkt auf die Entität.
- **N-Body-Physik**: Alle Himmelskörper wirken auf die Entität.

## Warum ist N-Body-Physik nicht standardmäßig aktiviert?
**N-Body-Physik** bietet eine realistischere Simulation für Spieler mit fortgeschrittenem Wissen über Weltraumphysik, die eine zusätzliche Herausforderung suchen. In der Realität verlassen sich Raumfahrtagenturen auf Supercomputer, um Satelliten- und Sondenbahnen zu berechnen und bei Bedarf anzupassen. In *Archean* müssen Spieler diese Berechnungen manuell durchführen, eingeschränkt durch die begrenzte Rechenleistung eines **XenonCode**-Computers.

Ein einzigartiges Problem in *Archean* ist die Nähe des Mondes zur Erde in dieser Ära, was es nahezu unmöglich macht, eine stabile Umlaufbahn um die Erde zu erreichen, ohne stark von der Mondgravitation beeinflusst zu werden. Mit der **dominanten Gravitationsphysik** können sich Spieler jedoch auf die Erdgravitation konzentrieren und den Mondeinfluss im Erdorbit ignorieren.

## Konfiguration
Um N-Body-Physik zu aktivieren, musst du die Datei `Archean-data/server/ARCHEAN_celestial.ini` bearbeiten und den Wert von `nbody` auf `yes` setzen.

---
## Zusätzliche Informationen
Bei Verwendung von N-Body-Physik empfehlen wir nicht die Nutzung des [NavInstrument](/components/navigation/NavInstrument.md), das für die native Verwendung mit der dominanten Gravitationsphysik konzipiert ist. Es ist möglich, es mit N-Body-Physik zu verwenden, aber es wird ungenaue Informationen liefern und deine Umlaufbahn wird nicht stabil sein.
