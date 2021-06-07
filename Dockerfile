FROM rocker/verse:4.1.0
RUN apt-get update && \
    apt-get install vim && \
    apt-get install git
    
# Install image manipulation library
RUN apt-get install libmagick++-dev

# R packages
RUN install2.r magick \
               here \
               furrr \
               pkgdown \
               anytime \
               ggthemes \
               bookdown \
               optparse

RUN apt-get install wget
RUN wget https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb
RUN sudo dpkg -i rstudio-server-1.4.1717-amd64.deb
RUN sudo apt -f install
