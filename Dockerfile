# Dockerfile

# Use a imagem oficial do Node.js como imagem base
FROM node:14

# Instale o Nginx
RUN apt-get update && \
    apt-get install -y nginx

# Copie o arquivo de configuração do Nginx para o diretório de configuração
COPY nginx.conf /etc/nginx/nginx.conf

# Crie e defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências da aplicação
RUN npm install

# Copie o restante dos arquivos da aplicação para o diretório de trabalho
COPY . .

# Exponha a porta 3000, que é a porta padrão para aplicações Node.js
EXPOSE 3000

# Comando para iniciar a aplicação quando o contêiner for iniciado
CMD ["npm", "start"]

