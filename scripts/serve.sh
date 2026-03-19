cd `dirname $0`/..

# Build all languages first
bash scripts/build.sh

# Serve the book/ directory on port 3000
echo "Serving at http://localhost:3000"
python3 -m http.server 3000 -d book
