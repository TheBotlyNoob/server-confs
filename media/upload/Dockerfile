FROM node:22-alpine AS build
WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npx tsc -p tsconfig.json

FROM node:22-alpine
WORKDIR /app

COPY package.json .
RUN npm install --omit=dev

COPY --from=build /app/dist ./dist
COPY --from=build /app/index.html .

EXPOSE 3000
CMD ["node", "dist/web.js"]
