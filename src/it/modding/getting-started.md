# Getting Started

## Creating a Mod

Le mod vengono create dall'interno del gioco, nella scheda **Mods** sotto **Local Mods**.

### 1. Reserve a Vendor Name
Clicca **Reserve Vendor Name** per scegliere un identificativo vendor unico. Questo nome deve essere composto da **3 a 12 caratteri alfanumerici** e viene automaticamente convertito in **MAIUSCOLO**. Questo nome e' permanente e non puo' essere cambiato successivamente.

### 2. Create a New Mod
Una volta riservato il tuo vendor name, inserisci un nome per la mod nel campo **Create New Mod**. Il nome della mod deve essere composto da **3 a 12 caratteri alfanumerici** e viene automaticamente convertito in **minuscolo**. Clicca **Create New Mod** per generare la cartella della mod.

## Mod Folder Structure

Dopo aver creato una mod, viene generata la seguente struttura di cartelle:

```
Archean/Archean-data/mods/
└── MYVENDOR_mymod/
    ├── config.yaml              <- Ricette di crafting (opzionale)
    ├── components/
    │   ├── MyComponent1/
    │   │   ├── MyComponent1 (.bin, .gltf, etc.)  <- Modello 3D
    │   │   ├── main.xc (optional)                <- Script XenonCode
    │   │   └── MyComponent1.png                  <- Miniatura
    │   └── MyComponent2/
    │       ├── ...
```

Ogni componente si trova nella propria sotto-cartella all'interno di `components/`. Il nome della sotto-cartella deve corrispondere al nome Entity Root definito in Blender.

> Una mod puo' contenere piu' componenti.

## Creating a Component

Un componente richiede come minimo un **modello 3D** esportato da Blender. Lo scripting XenonCode e le ricette di crafting sono opzionali.

| Passaggio | Descrizione | Pagina |
|------|-------------|------|
| **Modello 3D** (richiesto) | Crea ed esporta il modello 3D usando il plugin Archean per Blender | [3D modeling with Blender](blender.md) |
| **Script XenonCode** (opzionale) | Aggiungi comportamenti con uno script `main.xc`: schermi, animazioni, fisica, audio, porte... | [Functionality with XenonCode](xenoncode.md) |
| **Ricette di crafting** (opzionale) | Definisci come il tuo componente viene craftato, riciclato o lavorato tramite `config.yaml` | [Crafting Recipes](config.md) |

## Publishing

Una volta che la tua mod e' pronta, puoi pubblicarla su Steam Workshop direttamente dalla scheda **Local Mods** cliccando **Publish** sulla tua mod. Il prefisso vendor della mod deve corrispondere al tuo vendor name riservato.
