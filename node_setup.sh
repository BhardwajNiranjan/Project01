#!/bin/bash 
cd /etc/nginx/conf.d/
sudo touch conf1.conf
sudo cat > conf1.conf << EOF
server {
    listen 80;
    server_name your_domain_name;
    location / {
        proxy_pass http://localhost:3000; # Change this to your Node.js app port
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF
sudo systemctl restart nginx
sudo systemctl reload nginx
line_number=60 
script_path="/etc/nginx/nginx.conf"
if grep -qE "^\\s*#${line_number}" "$script_path"; 
  then
     sudo sed -i "${line_number}s/^# //" "$script_path"
     echo " Line ${line_number} uncommented."
  else
     sudo sed -i "${line_number}s/^/# /" "$script_path"
     echo " Line ${line_number} commented."
fi