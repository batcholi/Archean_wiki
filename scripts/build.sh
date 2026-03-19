#!/bin/bash
cd `dirname $0`/..

# Read languages from languages.json (single source of truth)
LANGS=$(python3 -c "
import json
with open('languages.json') as f:
	langs = json.load(f)
for l in langs:
	print(l['code'])
")

if [ -z "$LANGS" ]; then
	echo "No languages found in languages.json"
	exit 1
fi

# Ensure en/ exists (it's the base)
if [ ! -d "src/en" ]; then
	echo "Error: src/en/ directory not found"
	exit 1
fi

# Generate theme/lang-data.js from languages.json
python3 -c "
import json
with open('languages.json') as f:
	langs = json.load(f)
with open('theme/lang-data.js', 'w') as out:
	out.write('var WIKI_LANGUAGES = ' + json.dumps(langs, ensure_ascii=False) + ';\n')
"

# Clean previous build
rm -rf book

# Build each language
for lang in $LANGS; do
	# Create language directory if it doesn't exist
	mkdir -p "src/$lang"

	# Copy SUMMARY.md from en/ if missing
	if [ ! -f "src/$lang/SUMMARY.md" ]; then
		cp "src/en/SUMMARY.md" "src/$lang/SUMMARY.md"
	fi

	# Fallback: fill missing files from en/
	if [ "$lang" != "en" ]; then
		echo "Filling missing files for $lang from en/"
		cp -rn src/en/* "src/$lang/"
	fi

	echo "Building language: $lang"
	sed -i "s|^src = \"src/.*\"|src = \"src/$lang\"|" book.toml
	~/.cargo/bin/mdbook build -d "book/$lang"
done

# Reset to default (en)
sed -i "s|^src = \"src/.*\"|src = \"src/en\"|" book.toml

# Generate root redirect page
python3 -c "
import json
with open('languages.json') as f:
	langs = json.load(f)
codes = [l['code'] for l in langs]
html = '''<!DOCTYPE html>
<html>
<head>
	<meta charset=\"UTF-8\">
	<title>Archean Wiki</title>
	<script>
		var savedLang = localStorage.getItem('archean-wiki-lang') || 'en';
		window.location.replace(savedLang + '/index.html');
	</script>
</head>
<body>
	<p>Redirecting...</p>
</body>
</html>'''
with open('book/index.html', 'w') as f:
	f.write(html)
"

echo "Build complete for: $LANGS"
