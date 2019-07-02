#Stage 1 - build env.
FROM node:12.2.0-alpine as react-build
WORKDIR /usr/app
# Copying the JSON file rather than the whole working directory allows us to take advantage of Docker’s cache layers.
COPY package.json package-lock.json ./
RUN npm install 
COPY . ./
RUN npm run build

#Stage 2 - prod env.
FROM nginx:alpine
COPY --from=react-build usr/app/build usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]