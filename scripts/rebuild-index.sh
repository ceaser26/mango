#!/usr/bin/env bash
set -euo pipefail

mkdir -p sites

{
  echo '<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">'
  echo '<title>Mango Sites</title><style>body{font-family:Inter,system-ui,Arial;background:#0b1020;color:#e9eefc;margin:0;padding:32px}a{color:#8ab4ff}li{margin:8px 0}.meta{opacity:.75}</style></head><body>'
  echo '<h1>Mango Website Deployments</h1><p class="meta">Auto-generated index of deployed site folders.</p><ul>'
  find sites -mindepth 1 -maxdepth 1 -type d | sort | while read -r d; do
    b=$(basename "$d")
    echo "<li><a href=\"./sites/$b/\">$b</a></li>"
  done
  echo '</ul></body></html>'
} > index.html
