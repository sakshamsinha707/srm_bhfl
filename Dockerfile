FROM node:22-alpine

WORKDIR /app/backend

ENV NODE_ENV=production
ENV PORT=8080

COPY backend/package.json backend/package-lock.json ./
RUN npm ci --omit=dev

COPY backend ./

EXPOSE 8080

CMD ["npm", "start"]
