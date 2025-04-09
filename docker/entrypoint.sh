#!/bin/sh

set -e
cd packages/backend

# Check if user admin ya fue creado
if [ ! -f /automatisch/storage/.admin_created ]; then
  echo "⏳ Creando usuario admin (primera vez)..."
  yarn db:migrate
  node scripts/create-user.js
  touch /automatisch/storage/.admin_created
else
  echo "✅ Usuario admin ya existe. Iniciando servicio..."
fi

yarn start
