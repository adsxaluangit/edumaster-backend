#!/bin/bash
# =================================================================
# Script cai dat HTTPS lan dau cho ptnl.mic1.edu.vn
# Chay tren Linux server: bash setup-https.sh your@email.com
# =================================================================

DOMAIN="ptnl.mic1.edu.vn"
EMAIL="${1:-admin@mic1.edu.vn}"

echo "======================================================"
echo " Cai dat HTTPS cho $DOMAIN"
echo " Email: $EMAIL"
echo "======================================================"

# BUOC 1: Comment tam thoi block HTTPS de nginx khoi dong duoc
echo ""
echo "[1/5] Tat tam thoi block SSL trong nginx config..."
sed -i 's/^server {$/###SERVER_SSL_START###/' nginx-proxy/default.conf
sed -i '/###SERVER_SSL_START###/,/^}$/{ s/^/# / }' nginx-proxy/default.conf

# Cach don gian hon: tao file chi HTTP
cat > /tmp/nginx-http-only.conf << 'EOF'
server {
    listen 80;
    server_name ptnl.mic1.edu.vn www.ptnl.mic1.edu.vn;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 200 'Dang cai SSL...';
        add_header Content-Type text/plain;
    }
}
EOF

cp nginx-proxy/default.conf nginx-proxy/default.conf.backup
cp /tmp/nginx-http-only.conf nginx-proxy/default.conf

# BUOC 2: Khoi dong nginx-proxy voi chi HTTP
echo ""
echo "[2/5] Khoi dong Nginx Proxy (HTTP only)..."
docker compose up -d nginx-proxy
sleep 3

# BUOC 3: Lay chung chi SSL tu Let's Encrypt
echo ""
echo "[3/5] Lay chung chi SSL cho $DOMAIN..."
docker compose run --rm certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email \
  -d "$DOMAIN"

# Kiem tra ket qua
if [ $? -ne 0 ]; then
    echo ""
    echo "THAT BAI khi lay cert! Kiem tra lai:"
    echo "  1. Domain $DOMAIN co tro ve IP nay khong?"
    echo "     curl http://$DOMAIN/.well-known/acme-challenge/test"
    echo "  2. Port 80 co mo khong?"
    echo "     ufw allow 80 && ufw allow 443"
    exit 1
fi

echo ""
echo "OK! Da lay cert thanh cong!"

# BUOC 4: Phuc hoi file nginx day du (co HTTPS)
echo ""
echo "[4/5] Kich hoat HTTPS trong nginx config..."
cp nginx-proxy/default.conf.backup nginx-proxy/default.conf

# BUOC 5: Restart nginx de load cert moi
echo ""
echo "[5/5] Restart Nginx Proxy voi HTTPS..."
docker compose restart nginx-proxy
sleep 2

# Khoi dong tat ca services
docker compose up -d

echo ""
echo "======================================================"
echo " HOAN THANH! Kiem tra:"
echo "   https://$DOMAIN"
echo ""
echo " Xem trang thai cert:"
echo "   docker compose run --rm certbot certificates"
echo "======================================================"
