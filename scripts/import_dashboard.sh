#!/usr/bin/env bash
# Import all dashboards into Grafana
GRAFANA_URL="${GRAFANA_URL:-http://localhost:3000}"
GRAFANA_USER="${GRAFANA_USER:-admin}"
GRAFANA_PASS="${GRAFANA_PASS:-admin}"
DATASOURCE_ID="${DATASOURCE_ID:-1}"

for f in dashboards/*.json; do
    echo "Importing: $f"
    # Wrap in Grafana import format
    PAYLOAD=$(python3 -c "
import json, sys
with open(sys.argv[1]) as f: dash = json.load(f)
dash['id'] = None
print(json.dumps({'dashboard': dash, 'overwrite': True, 'folderId': 0, 'inputs': []}))
" "$f")
    CODE=$(curl -s -o /dev/null -w "%{http_code}"         -X POST "$GRAFANA_URL/api/dashboards/import"         -u "$GRAFANA_USER:$GRAFANA_PASS"         -H "Content-Type: application/json"         -d "$PAYLOAD")
    echo "  HTTP $CODE: $f"
done
