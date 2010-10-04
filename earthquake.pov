#include "units.inc"
#include "colors.inc"

global_settings {
ambient_light <1,1,1>
}

#declare frame_date=1973+(frame_number)/(12*31);

#declare EarthRad = 6378.14*km;

#macro toSphere(lat,long,depth)
#declare lat_c = 90-lat;
#declare long_c = long;
<EarthRad*sin(radians(lat_c))*sin(radians(long_c)),EarthRad*sin(radians(lat_c))*cos(radians(long_c)),EarthRad*cos(radians(lat_c))>
#end

#macro toMercator(lat,long,depth)
<40075.16*km/2*lat/180,40075.16*km/2*long/180,0>
#end

#macro quake(year,m,d,utc,lat, long, mag, depth)
	#if(  frame_date<year+(((m-1)*31)+d)/(12*31)+0.001 & frame_date>year+(((m-1)*31)+d)/(12*31)-0.001  )
		sphere{
			//toSphere(lat,long,depth),
			toMercator(lat,long,depth),
			mag*km*10
			pigment{rgbft CHSV2RGB(<(depth/400)*360,1,1>)}
			//pigment{rgb <depth/400,min(depth/200,0.9),min(depth/80,0.9)>}
		}
	#end
#end

#declare quakes=object{
	union{
	#include "data1.inc"
	}
}

#declare EarthGlobe=object{
	union{
		sphere { <0,0,0>, EarthRad 
			texture {  
				pigment { image_map {tiff "color_etopo1_ice_full.tif" map_type 1}}
			}
			rotate <90,0,0>
			rotate <0,0,-90>
		}
		object{quakes}
	}	
}

#declare EarthMercator=object{
	union{
	/*box{<1,1,-1>,<0,0,0>
		pigment{image_map {tiff "color_etopo1_ice_low.tif" once}}
		rotate <0,0,90>
		rotate <0,180,0>
		translate <-0.5,-0.5,-1>
		scale 40075.16*km/2*x	
		scale 40075.16*km*y
	}*/
	object{quakes}
	/*text {
		ttf "timrom.ttf" "POV-RAY 3.0" 1*km, -1*km
		pigment { Red }
		scale 0.01
		rotate 180*y-90*z
		translate 40075*km/100*x+40075*km/10*y
		
	}*/
	}
}

//object{EarthGlobe}
object{EarthMercator}

//light_source {-10020*z rgb 1 shadowless}

#declare q=1;
light_source {  <0, 0, 1>*1000000                  
color rgb <1,1,1>*q    shadowless}
/*light_source {  <-1, 1, 1>*100000                  
color rgb <1,1,1>*q    shadowless}
light_source {  <1, -1, 1>*100000                    
color rgb <1,1,1>*q    shadowless}
light_source {  <1, 1, -1>*100000                    
color rgb <1,1,1>*q    shadowless}
light_source {  <-1, -1, 1>*100000                     
color rgb <1,1,1>*q    shadowless}
light_source {  <-1, 1, -1>*100000                    
color rgb <1,1,1>*q    shadowless}*/

camera {      
	location <00000*km,-00000*km,200000*km>
	look_at  <0,0,0>  
	angle 12
	rotate <0,0,-90>
	right  x*image_width/image_height
	}

