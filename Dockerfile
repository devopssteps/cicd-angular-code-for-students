FROM node:20 AS builder
RUN npm install -g @angular/cli@17
WORKDIR /project-1
COPY . .
RUN npm install && ng build -c production

FROM nginx:1.25
EXPOSE 80
COPY --from=builder /project-1/dist/website-project-1 /usr/share/nginx/html 
