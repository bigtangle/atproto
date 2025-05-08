# Use the official Node.js 18 Alpine base image for efficiency
FROM node:18-alpine AS builder

# Install system dependencies
RUN apk add --no-cache git python3 make g++

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Create and set the working directory
WORKDIR /app

# Clone the ATProto repository (or you could COPY from local)
# Alternatively, use COPY for local development
COPY . .
# Install dependencies using pnpm
RUN pnpm install --frozen-lockfile

# Build the project
RUN pnpm build

# Create runtime image
FROM node:18-alpine

# Install runtime dependencies if needed
RUN apk add --no-cache bash
# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

 COPY --from=builder /app .

# Expose default ports
# PDS (Personal Data Server) typically runs on 2583
EXPOSE 2583

EXPOSE 2584


# Entrypoint - adjust based on which service you want to run
WORKDIR /app/packages/dev-env
CMD ["pnpm", "run", "all"]
