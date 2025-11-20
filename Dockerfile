# ---------- Stage 1: Build ----------
FROM node:20-alpine AS builder

WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm install

# Копируем весь проект
COPY . .

# Получаем переменные окружения
ARG NEXT_PUBLIC_SUPABASE_URL
ARG NEXT_PUBLIC_SUPABASE_ANON_KEY

# Передаём переменные в окружение build
ENV NEXT_PUBLIC_SUPABASE_URL=$NEXT_PUBLIC_SUPABASE_URL
ENV NEXT_PUBLIC_SUPABASE_ANON_KEY=$NEXT_PUBLIC_SUPABASE_ANON_KEY

# Собираем Next.js (обязательно standalone)
RUN npm run build


# ---------- Stage 2: Run ----------
FROM node:20-alpine AS runner

WORKDIR /app
ENV NODE_ENV=production

# Копируем standalone сервер
COPY --from=builder /app/.next/standalone ./

# Копируем статику
COPY --from=builder /app/.next/static ./public/_next/static
COPY --from=builder /app/public ./public

# Cloud Run работает через порт 8080
ENV PORT=8080
EXPOSE 8080

CMD ["node", "server.js"]
