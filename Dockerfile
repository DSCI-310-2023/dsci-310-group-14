from rocker/tidyverse

#tagname - latest
#install packages
#running the image - docker run -d -e 8787:8787 -v ${PWD}:/home/rstudio

RUN R -e "install.packages('remotes')"
RUN R -e "install.packages('GGally', repos='http://cran.rstudio.com/')"
RUN R -e "remotes::install.packages('tidymodels', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('themis', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('kknn', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('testthat', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('here', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('bookdown', repos='http://cran.rstudio.com/')"
