#r.avaflow start script for parab_

g.region -d

r.in.gdal -o --overwrite input=DEM_5m.asc output=DEM_5m
r.in.gdal -o --overwrite input=rel_rst_5m.asc output=rel_rst_5m

g.region -s rast=

r.avaflow -a -t -e -v prefix=parab phases=s gravity=9.81 limiter=1 layers=0 controls=0,0,1,0,0,0,0,0,0,2,0 elevation=DEM_5m hrelease=rel_rst_5m density=200 friction=35,8.810732986,0.05  basal=-7.0,0.0 dynfric=0.0,-0.6 special=0.05,0.0,0.0,1,10,1,1,4,1,200000 time=10.0,400.0 

g.region -d
