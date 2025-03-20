#!/bin/bash

REPO_MS_PROPERTY="git@github.com:proyecto-mg/ms_property.git"

echo "Verificando y clonando proyecto ms_property si no existe..."
if [ ! -d "./ms_property" ] || [ ! -f "./ms_property/package.json" ]; then
  if [ -d "./ms_property" ] && [ ! -f "./ms_property/package.json" ]; then
    echo "Directorio ms_property existe pero sin package.json. Eliminando..."
    rm -rf ./ms_property
  fi

  echo "Clonando repositorio ms_property desde $REPO_MS_PROPERTY ..."
  git clone $REPO_MS_PROPERTY ms_property
  cd ms_property
  git checkout develop

  echo "Instalando dependencias de ms_property..."
  npm install

  echo "Proyecto ms_property clonado y listo."
  cd ..
else
  echo "ms_property ya existe localmente. Ejecutando npm install para asegurar dependencias..."
  cd ms_property
  npm install
  cd ..
fi
