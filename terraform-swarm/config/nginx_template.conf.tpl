server {
    listen 80;
    server_name _;

    location / {
        return 404;
    }
}

server {
    listen 80;
    server_name ${frontend_domain};

    location / {
        proxy_pass http://${frontend_service_name}:4502;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {
    listen 80;
    server_name ${backend_domain};

    location / {
        proxy_pass http://${backend_service_name}:4501;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
