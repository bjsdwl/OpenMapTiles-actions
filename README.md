root@node-1:/home/tileserver-gl# docker run --rm -it -v $(pwd):/data -p 9090:8080 scanlidocker/tileserver-gl-light:v4.2.0 --mbtiles ./data/tiles.mbtiles

cat tiles-mbtiles.tar.gz.aa >> tiles-mbtiles.tar.gz

gunzip tiles-mbtiles.tar.gz

tar xvf tiles-mbtiles.tar
