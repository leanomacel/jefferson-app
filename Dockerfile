# Dockerfile

# Use uma imagem base oficial do Node.js.
FROM node:18-alpine

# Defina o diretório de trabalho dentro do container
WORKDIR /opt/app

# Copie os arquivos de dependência e instale-as com npm
COPY package.json package-lock.json* ./
RUN npm ci

# Copie o resto dos arquivos da aplicação
COPY . .

# Construa a interface de administração do Strapi
# A flag --no-optimization é opcional, mas pode acelerar o build em desenvolvimento
ENV NODE_ENV=development
RUN npm run build

# Exponha a porta que o Strapi usa
EXPOSE 1337

# Comando para iniciar a aplicação em modo de desenvolvimento com npm
CMD ["npm", "run", "develop"]