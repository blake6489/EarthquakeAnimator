#include "units.inc"

global_settings {
ambient_light <1,1,1>
}

#declare EarthRad = 6378.14*km;

#macro quake(year,m,d,utc,lat, long, mag, depth)
#declare lat_c = 90-lat;
#declare long_c = long;
sphere{<EarthRad*sin(radians(lat_c))*sin(radians(long_c)),EarthRad*sin(radians(lat_c))*cos(radians(long_c)),EarthRad*cos(radians(lat_c))>,mag*mag*km
pigment{rgb <depth/400,min(depth/200,0.9),min(depth/80,0.9)>}}
#end


#include "data1.inc"

#declare Earth=object{
	
	sphere { <0,0,0>, EarthRad 
		texture {  
		    pigment { image_map {jpeg "earth.jpg" map_type 1}}
		}
		rotate <90,0,0>
		rotate <0,0,-90>
	}
	//object{Moon translate 384400*km*x rotate 1/27.32166*c*z }
	
}

object{Earth}

//light_source {-10020*z rgb 1 shadowless}

#declare q=1;
light_source {  <1, 1, 1>*100000                  
color rgb <1,1,1>*q    shadowless}
light_source {  <-1, 1, 1>*100000                  
color rgb <1,1,1>*q    shadowless}
light_source {  <1, -1, 1>*100000                    
color rgb <1,1,1>*q    shadowless}
light_source {  <1, 1, -1>*100000                    
color rgb <1,1,1>*q    shadowless}
light_source {  <-1, -1, 1>*100000                     
color rgb <1,1,1>*q    shadowless}
light_source {  <-1, 1, -1>*100000                    
color rgb <1,1,1>*q    shadowless}

camera {      
	location <200000*km,-200000*km,-200000*km>
	look_at  <0,0,0>  
	angle 3
	rotate <0,180,0>
	right  x*image_width/image_height
	}

