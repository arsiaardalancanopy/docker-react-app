
FROM node:12.2.0-alpine
  
RUN mkdir /app
COPY . /app


WORKDIR /app

#We expose all Node.js binaries to our PATH environment variable and copy our projects package.json to the app directory
ENV PATH /app/node_modules/.bin:$PATH

# Copying the JSON file rather than the whole working directory allows us to take advantage of Docker’s cache layers.
COPY package.json /app/package.json
    
    
RUN npm install
    
    
RUN npm install react-scripts@3.0.1 -g
    

CMD ["npm", "start"]
"Dockerfile" 22L, 466C