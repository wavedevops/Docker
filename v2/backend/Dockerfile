
# Stage 1: Build

FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json .

RUN npm install

COPY *.js .


# Stage 2: Production

FROM node:20-alpine

ENV DB_HOST=mysql

WORKDIR /app

# Create non-root user
RUN addgroup -S expense && \
    adduser -S expense -G expense

# Copy only production dependencies
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules

# Copy application code
COPY --from=builder --chown=expense:expense /app/*.js ./

USER expense

EXPOSE 8080

ENTRYPOINT ["node", "index.js"]
