#!/bin/bash
git clone https://github.com/openmaptiles/openmaptiles.git
cd OpenMapTiles
make
make start-db
make download area=albania
make import-osm
make import-wikidata
make import-sql        
