#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────
# Catabolic Solutions — One-Command Deploy Script
# Usage:  ./deploy.sh user@your-server.com
# ─────────────────────────────────────────────────────────

REMOTE="${1:?Usage: ./deploy.sh user@your-server}"
SITE_DIR="/var/www/catabolicsolutions.com"

echo "🚀 Deploying Catabolic Solutions to ${REMOTE}..."

# 1. Ensure remote directory exists
ssh "$REMOTE" "sudo mkdir -p ${SITE_DIR} && sudo chown \$(whoami):\$(whoami) ${SITE_DIR}"

# 2. Upload site files
rsync -avz --delete \
  index.html \
  favicon.ico \
  "$REMOTE:${SITE_DIR}/"

# 3. Set permissions
ssh "$REMOTE" "sudo chown -R www-data:www-data ${SITE_DIR} && sudo chmod -R 755 ${SITE_DIR}"

echo ""
echo "✅ Deploy complete!"
echo "   Next steps:"
echo "   1. Copy nginx config:  sudo cp catabolicsolutions.nginx /etc/nginx/sites-available/catabolicsolutions.com"
echo "   2. Enable site:        sudo ln -sf /etc/nginx/sites-available/catabolicsolutions.com /etc/nginx/sites-enabled/"
echo "   3. Test & reload:      sudo nginx -t && sudo systemctl reload nginx"
echo "   4. Enable HTTPS:       sudo certbot --nginx -d catabolicsolutions.com -d www.catabolicsolutions.com"
