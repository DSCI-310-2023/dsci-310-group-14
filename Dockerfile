from jupyter/r-notebook

#tagname - dsci_310_jupyter_packages
#install packages
#running the image - docker run -p 8888:8888 -v ${PWD}:/home/jovyan/work dsci_310_jupyter_packages
RUN R -e "install.packages('tidyverse', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('GGally', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidymodels', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('themis', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('kknn', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('testthat', repos='http://cran.rstudio.com/')"
