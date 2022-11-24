#!/bin/bash
git clone https://github.com/openmaptiles/openmaptiles.git -b master
cd openmaptiles
make
make start-db
make download area=albania
make import-osm
make import-wikidata
make import-sql        
