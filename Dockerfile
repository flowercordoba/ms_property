# Usa una imagen base liviana
FROM node:20-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia solo package.json y package-lock.json para instalar dependencias primero (cache optimizado)
COPY package*.json ./

# Instala dependencias
RUN npm install

# Copia el resto de los archivos del proyecto
COPY . .

# Expone el puerto (ajústalo si es diferente)
EXPOSE 3000

# Comando por defecto (puedes sobreescribirlo)
CMD ["npm", "run", "start:dev"]
