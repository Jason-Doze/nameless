FROM node:16

RUN apt update && apt install -y sudo curl

# Set the working directory as nameless
WORKDIR /nameless

# Copy the nameless directory
COPY package*.json /.

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

