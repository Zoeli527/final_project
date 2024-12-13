FROM rocker/r-ubuntu as base

RUN mkdir /report

RUN mkdir -p renv
COPY Dockerfile Dockerfile
COPY Makefile Makefile
COPY README.md README.md
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY code code
COPY raw_data raw_data
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN apt-get update && apt-get install -y r-base
RUN R -e "install.packages('renv', repos='https://cran.r-project.org'); renv::restore()"
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"