# Core image to build on
FROM openanalytics/r-base

# Author information
MAINTAINER Krzysztof Słomczyński "krzysztofslomczynski@gmail.com"

# System libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0

# Basic Shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos = 'https://cloud.r-project.org/')"

# Copy the app to the image
RUN mkdir /root/id
COPY app/id /root/id
RUN rm /root/id/Dockerfile

# Make sure that Shiny app will run on the port expected by ShinyProxy
# and that one will be able to connect to the app from the outside world
COPY cfg/Rprofile.site /usr/lib/R/etc

# Expose port 3838 to the outside world
EXPOSE 3838

# Run app
CMD ["R", "-e", "shiny::runApp('/root/id')"]
