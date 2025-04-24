# Use Alpine Linux as base image
FROM alpine:latest

# Install build tools and ttyd
RUN apk add --no-cache build-base git ttyd

# Set working directory
WORKDIR /app

# Copy the source files
COPY . .

# Compile the C++ program
RUN g++ -o main main.cpp

# Run the program through ttyd on port 7681
CMD ["ttyd", "-p", "7681", "./main"]
