# Erste Schritte

## Einen Mod erstellen

Mods werden innerhalb des Spiels erstellt, im **Mods**-Tab unter **Local Mods**.

### 1. Einen Vendor-Namen reservieren
Klicke auf **Reserve Vendor Name**, um einen eindeutigen Vendor-Identifikator zu wählen. Dieser Name muss **3 bis 12 alphanumerische Zeichen** lang sein und wird automatisch in **GROSSBUCHSTABEN** umgewandelt. Dieser Name ist permanent und kann später nicht mehr geändert werden.

### 2. Einen neuen Mod erstellen
Sobald dein Vendor-Name reserviert ist, gib einen Mod-Namen im Feld **Create New Mod** ein. Der Mod-Name muss **3 bis 12 alphanumerische Zeichen** lang sein und wird automatisch in **Kleinbuchstaben** umgewandelt. Klicke auf **Create New Mod**, um den Mod-Ordner zu generieren.

## Mod-Ordnerstruktur

Nach dem Erstellen eines Mods wird folgende Ordnerstruktur generiert:

```
Archean/Archean-data/mods/
└── MYVENDOR_mymod/
    ├── config.yaml              <- Crafting-Rezepte (optional)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- 3D-Modell
    │   │   ├── main.xc (optional)                <- XenonCode-Skript
    │   │   └── MyComponent1.png                  <- Vorschaubild
    │   └── MyComponent2/
    │       ├── ...
```

Jede Komponente befindet sich in ihrem eigenen Unterordner innerhalb von `components/`. Der Name des Unterordners muss mit dem in Blender definierten Entity-Root-Namen übereinstimmen.

> Ein Mod kann mehrere Komponenten enthalten.

## Eine Komponente erstellen

Eine Komponente benötigt mindestens ein **3D-Modell**, das aus Blender exportiert wurde. XenonCode-Skripting und Crafting-Rezepte sind optional.

| Schritt | Beschreibung | Seite |
|------|-------------|------|
| **3D-Modell** (erforderlich) | Erstelle und exportiere das 3D-Modell mit dem Archean Blender Plugin | [3D-Modellierung mit Blender](blender.md) |
| **XenonCode-Skript** (optional) | Füge Verhalten mit einem `main.xc`-Skript hinzu: Bildschirme, Animationen, Physik, Audio, Ports... | [Funktionalität mit XenonCode](xenoncode.md) |
| **Crafting-Rezepte** (optional) | Definiere, wie deine Komponente über `config.yaml` hergestellt, recycelt oder verarbeitet wird | [Crafting-Rezepte](config.md) |

## Veröffentlichung

Sobald dein Mod fertig ist, kannst du ihn direkt aus dem **Local Mods**-Tab im Steam Workshop veröffentlichen, indem du bei deinem Mod auf **Publish** klickst. Das Vendor-Präfix des Mods muss mit deinem reservierten Vendor-Namen übereinstimmen.
