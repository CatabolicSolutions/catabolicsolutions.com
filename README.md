# Catabolic Solutions — Website

Single-page application for [catabolicsolutions.com](https://catabolicsolutions.com/).

## What's Here

- **`index.html`** — The entire SPA (CSS, JS, page templates, SVG icons all inline)
- **`deploy.sh`** — One-command deploy script
- **`catabolicsolutions.nginx`** — Nginx server config (SPA routing, caching, security headers)

## Deploy

```bash
# Deploy to production
./deploy.sh user@your-server

# Or manually:
rsync -avz index.html favicon.ico user@server:/var/www/catabolicsolutions.com/
```

## Setup

1. Copy `catabolicsolutions.nginx` to `/etc/nginx/sites-available/`
2. Enable the site and reload nginx
3. (Optional) Set up HTTPS with certbot or Cloudflare Origin CA
