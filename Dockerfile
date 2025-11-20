# --- STAGE 1: Build ---
FROM node:18-alpine AS builder

WORKDIR /app

# Устанавливаем зависимости
COPY package.json package-lock.json* ./
RUN npm install

# Копируем весь проект
COPY . .

# Билдим проект
RUN npm run build



# --- STAGE 2: Production ---
FROM node:18-alpine AS runner

WORKDIR /app

# Отключаем телеметрию Next.js
ENV NEXT_TELEMETRY_DISABLED=1

# Копируем только нужное из builder
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

EXPOSE 3000

CMD ["npm", "start"]
