#include "units.inc"

global_settings {
ambient_light <1,1,1>
}

#declare EarthRad = 6378.14*km;
#macro quake(lat, long, mag, depth)
#declare lat_c = 90-lat;
#declare long_c = long;
sphere{<EarthRad*sin(radians(lat_c))*sin(radians(long_c)),EarthRad*sin(radians(lat_c))*cos(radians(long_c)),EarthRad*cos(radians(lat_c))>,200*km
pigment{rgb <1,1,0>}}
#end

quake(-18,47,0,0)

#declare Earth=object{
    union{
    sphere { <0,0,0>, 6378.14*km 
        texture {  
            pigment { image_map {gif "earthmap1k.gif" map_type 1}}
        }
        rotate <90,0,0>
        rotate <0,0,-90>
    }
    //object{Moon translate 384400*km*x rotate 1/27.32166*c*z }
    }
}

object{Earth}

//light_source {-10020*z rgb 1 shadowless}

#declare q=1;
light_source {  <1, 1, 1>*100000                  
  color rgb <1,1,1>*q    }
light_source {  <-1, 1, 1>*100000                  
  color rgb <1,1,1>*q    }
light_source {  <1, -1, 1>*100000                    
  color rgb <1,1,1>*q    }
light_source {  <1, 1, -1>*100000                    
  color rgb <1,1,1>*q    }
light_source {  <-1, -1, 1>*100000                     
  color rgb <1,1,1>*q    }
light_source {  <-1, 1, -1>*100000                    
  color rgb <1,1,1>*q    }
  
camera {      
  location <000*km,60000*km,0000*km>
  look_at  <0,0,0>  
  angle 20
  right  x*image_width/image_height
     }
     
