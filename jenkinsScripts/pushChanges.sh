#!/bin/sh

# Personalizar el mensaje del commit
COMMIT_MSG="Pipeline ejecutada por $1. Motivo: $2"

# Configurar el acceso a GitHub
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Configurar el usuario y correo de Git
git config --global user.name "$1"
git config --global user.email "jenkins@pipeline.local"

# Preparar los cambios para el commit
git add README.md

# Crear el commit con el mensaje proporcionado
git commit -m "$COMMIT_MSG" || echo "Nada que commitear."

# Hacer push a la rama especificada (main en tu caso)
git push origin HEAD:main || {
     echo "Error al hacer push. Intentando hacer pull con rebase..."
     git pull --rebase origin main
     git push origin HEAD:main
}

exit 0
