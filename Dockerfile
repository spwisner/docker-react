# Section to install dependencies and build
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build --> Wanted directory

# Run Step
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html