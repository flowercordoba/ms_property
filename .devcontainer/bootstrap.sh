#!/bin/bash

REPO_MS_PROPERTY="git@github.com:proyecto-mg/ms_property.git"
PROJECT_DIR="./ms_property"

echo "Verificando existencia del proyecto ms_property..."

if [ ! -d "$PROJECT_DIR" ]; then
  echo "No se encontró el proyecto. Clonando desde $REPO_MS_PROPERTY ..."
  git clone $REPO_MS_PROPERTY ms_property
  cd ms_property || exit
  git checkout develop

  echo "Instalando dependencias de ms_property..."
  npm install

  echo "Proyecto ms_property clonado, dependencias instaladas y listo para usar."
  cd ..
else
  echo "El proyecto ms_property ya existe."

  cd ms_property || exit

  if [ ! -f "package.json" ]; then
    echo "⚠️  El directorio existe pero no contiene package.json. Verifica tu repositorio."
    exit 1
  fi

  if [ ! -d "node_modules" ]; then
    echo "No se encontraron las dependencias. Instalando..."
    npm install
  else
    echo "Las dependencias ya están instaladas."
  fi

  echo "Proyecto ms_property listo para trabajar."
  cd ..
fi
