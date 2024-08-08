FROM node:16-alpine as builder
WORKDIR /opt/app
COPY package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]


FROM nginx
COPY --from=builder /opt/app/build /usr/share/nginx/html
