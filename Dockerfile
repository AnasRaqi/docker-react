# two sections 
FROM node:16-alpine as builder 
WORKDIR "/app"
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# we dont need to run anything for starting nginx, it starts by default. 