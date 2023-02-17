from jupyter/r-notebook

#tagname - dsci_310_jupyter_packages
#install packages
RUN R -e "install.packages('tidyverse', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('GGally', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidymodels', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('themis', repos='http://cran.rstudio.com/')"
