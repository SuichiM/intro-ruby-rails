# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash 
RUN apt install -y nodejs

# Configure the main process to run when running the image
CMD ["tail", "-f", "/dev/null"]