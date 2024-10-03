# Application (Serveur Node)
FROM node:20.9.0-alpine as build-env
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build 

# Serveur nginx
FROM nginx:alpine
COPY --from=build-env /app/dist /usr/share/nginx/html


EXPOSE 80