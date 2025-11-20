# ----- Stage 1: Build -----
FROM node:18-alpine AS builder

WORKDIR /app

# Устанавливаем зависимости
COPY package*.json ./
RUN npm install

# Копируем остальное приложение
COPY . .

# Собираем Next.js в standalone режиме
RUN npm run build

# ----- Stage 2: Run -----
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# Копируем собранное приложение
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./public/_next/static
COPY --from=builder /app/public ./public

# Cloud Run использует порт 8080
ENV PORT=8080
EXPOSE 8080

# Стартуем сервер
CMD ["node", "server.js"]
