from rocker/tidyverse

#tagname - latest
#install packages
#running the image - docker run -d -e 8787:8787 -v ${PWD}:/home/rstudio

RUN R -e "install.packages('GGally', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidymodels', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('themis', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('kknn', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('testthat', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('here', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('bookdown', repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages('bookdown', repos='http://cran.rstudio.com/')"

RUN Rscript -e "remotes::install_version('devtools','2.4.3')"
RUN Rscript -e "devtools::install_github('DSCI-310/dsci-310-group-14-pkg')"
