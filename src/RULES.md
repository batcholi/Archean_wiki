# Wiki Translation Rules

## General Principles

- The English version (`en/`) is the reference. All other languages are translations of it.
- The visual structure and layout of each page must remain identical across all languages (same headings, same images, same tables, same order).
- File names and directory structure must be identical across all languages. Only the text content is translated.

## What must NOT be translated

### Component names
All in-game component names stay in English, regardless of the target language.
Examples: Low Voltage Battery, High Voltage Junction, Fluid Pump, Solar Panel, Mining Drill, Crusher, Router, Data Bridge, Docking Port, etc.

### Tool names
All tool names stay in English.
Examples: Constructor Tool, Destructor Tool, Paint Tool, Dashboard Tool, Blueprint Tool, Label Tool, Spool Tool, RockRake Tool, Ore Scanner Tool, etc.

### XenonCode terms
All programming-related terms from XenonCode stay in English: variable names, function names, type names, keywords, code examples.

### Steam / platform terms
Terms related to Steam or platform features stay in English.
Examples: Workshop, Blueprint, Achievement, etc.

### Technical terms
In-game technical terms and UI labels stay in English when they appear as proper nouns or identifiers.
Examples: BIOS, HUD, RCS, RTG, N-Body, etc.

### SUMMARY.md sidebar titles
The sidebar link titles for components and tools must match the in-game English names. Section headers (like "Gameplay & Mechanics", "Components", "Tools") may be translated.

## What SHOULD be translated

- Page body text: descriptions, explanations, tutorials, instructions.
- Section headers within pages (h1, h2, h3...) when they are generic, **except** headers used as keys by the in-game documentation parser (see below).
- SUMMARY.md section group titles (e.g., "Gameplay & Mechanics" → "Mécaniques de jeu", "Components" → "Composants").
- Alt text for images if it contains descriptive text.

### Markdown headers used as parser keys
The in-game documentation system parses the raw `.md` files and uses specific headers as keys to extract content (e.g., for tooltips). These headers must stay in English in all languages. The text below them is translated, but the header itself is not.
Example: `## Description` must remain `## Description` in all languages.

## Formatting rules

- Keep the same Markdown structure: same heading levels, same lists, same code blocks.
- Keep all image paths identical (images are shared, not translated).
- Keep all internal links pointing to the same file names (file names are identical across languages).
- Do not add or remove content compared to the English version.
