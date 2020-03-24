# InterActiveShinyMap

this is what the web app looks like

https://mredsolo.shinyapps.io/InterActiveShinyMap/



Use the below script to assist in setting up AWS instance of a server.
click the raw button to see the real script.


#!/bin/bash
#this is an install script for AWS Redhat free EC2 instance.
#if you want to update lunix 
#yum -y update

#if you will be using R library ‘leaflet’ remove the ‘#’ from the line below.
#yum install -y libpng-devel 

#other libraries you may want to install in linux. Just remove the ‘#’
#for the library you want to install
#yum install -y nginx 
#yum install -y gdebi-core 
#yum install -y apache2-utils 
#yum install -y pandoc 
#yum install -y pandoc-citeproc 
#yum install -y libssl-dev 
#yum install -y libcurl4-gnutls-dev 
#yum install -y libcairo2-dev 
#yum install -y libgdal-dev 
#yum install -y libgeos-dev yum install -y libxml2-dev 
#yum install -y libxt-dev 
#yum install -y ibv8-dev

#Note: if you use the free version of AWS and need to use the R library ‘readr’, you will have to create swap file
#see link the link below for 4Gb of swap. 
#https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/

#install R
yum install -y R

#install RStudio-Server 1.2.5033 (2017-07-20)
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.5033-x86_64.rpm
yum install -y --nogpgcheck rstudio-server-rhel-1.2.5033-x86_64.rpm
rm rstudio-server-rhel-1.2.5033-x86_64.rpm

#install shiny and other packages you may need
R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
#install other R packages
#sudo su - -c "R -e \"install.packages(c('rmarkdown', 'shinydashboard', 'shinyjs'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('shinydashboard'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('shinyjs'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('dplyr'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('tidyr'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('readr'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('tidyr'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('lazyeval'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('stringr'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('ggthemes'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('ggExtra'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('magrittr'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('viridis'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('gridExtra'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('lubridate'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('fasttime'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('data.table'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('sp'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('rgdal'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('rgeos'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('adehabitatHR'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('geojsonio'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('maptools'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('leaflet'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('highcharter'), repos='http://cran.rstudio.com/')\""
#sudo su - -c "R -e \"install.packages(c('DT'), repos='http://cran.rstudio.com/')\""


#install shiny-server 1.5.13.944 (2020-03-21)
get https://download3.rstudio.org/centos6.3/x86_64/shiny-server-1.5.13.944-x86_64.rpm
yum install -y --nogpgcheck shiny-server-1.5.13.944-x86_64.rpm
rm shiny-server-1.4.2.786-rh5-x86_64.rpm

#update redhat
yum install -y curl-devel

#set up user of shiny studio. Be sure to replace ‘myusername’ with your own 
#username and replace ‘thisismypassword’ with your own password
useradd myusername 
echo myusername:thisismypassword | chpasswd
