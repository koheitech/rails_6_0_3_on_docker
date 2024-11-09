FROM ruby:3.0

# Install dependencies
RUN apt-get update && apt-get install -y \
    vim            \
    zsh            \
    sqlite3        \
    nodejs         \
    npm &&         \
    npm install -g yarn
    
RUN gem install rails -v 6.0.3

# Copy the config files to the container
COPY ./myconfig /root

# Set the default shell to zsh
SHELL ["/bin/zsh", "-c"]
RUN chsh -s /bin/zsh

# Set working directory
WORKDIR /root/myworkdir

# Copy the current directory contents into the container at /myapp
COPY ./myworkdir /root/myworkdir

EXPOSE 3000