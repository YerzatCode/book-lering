# ----- Stage 1: Build -----
FROM node:20-alpine AS builder

WORKDIR /app

# Установка зависимостей
COPY package*.json ./
RUN npm install

# Копируем весь проект
COPY . .

# Собираем Next.js (обязательно в standalone)
RUN npm run build

# ----- Stage 2: Runner -----
FROM node:20-alpine AS runner

WORKDIR /app
ENV NODE_ENV=production

# Копируем standalone сборку
COPY --from=builder /app/.next/standalone ./

# Копируем статику
COPY --from=builder /app/.next/static ./public/_next/static
COPY --from=builder /app/public ./public

# Cloud Run использует порт 8080
ENV PORT=8080
EXPOSE 8080

# Запуск standalone-сервера
CMD ["node", "server.js"]
