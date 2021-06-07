docker run -e \
PASSWORD=rstudio -p 8787:8787 \
--mount type=bind,source="$(pwd)"/.,target=/home/rstudio/ojoseso \
 ojoseco
 
 # Para actualizar:
 # docker build -t ojoseco:latest ojoseco/
