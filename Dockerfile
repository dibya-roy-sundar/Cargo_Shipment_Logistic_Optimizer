# Use Alpine Linux as base image
FROM alpine:latest

# Install required tools: g++, ttyd, bash
RUN apk add --no-cache build-base bash ttyd

# Set working directory
WORKDIR /app

# Copy your C++ source code and assets into container
COPY . .

# Compile your C++ code
RUN g++ -o main main.cpp

# Use TTYD to serve a bash shell that runs your program
CMD ["ttyd", "-p", "7681", "bash", "-c", "./main"]
