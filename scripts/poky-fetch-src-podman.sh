#!/bin/bash
# git clone https://github.com/openmaptiles/openmaptiles.git -b master
git clone https://github.com/OSSystems/meta-browser.git -b master
cd OSSystems
make
make start-db
make download area=albania
make import-osm
make import-wikidata
make import-sql        
