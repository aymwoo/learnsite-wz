FROM mono:latest

# Install XSP4 for running ASP.NET WebForms applications
RUN apt-get update && apt-get install -y \
    mono-xsp4 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Adjust web.config connection string to point to docker-compose database service (learnsite-db)
RUN sed -i "s/Data Source=127.0.0.1;Initial Catalog=learnsite;/Data Source=learnsite-db;Initial Catalog=learnsite;/g" web.config

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["entrypoint.sh"]
