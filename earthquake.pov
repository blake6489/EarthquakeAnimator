#include "UNITS.INC"

#declare Earth=object{
    union{
    sphere { <0,0,0>, 6378.14*km 
        texture {  
            pigment { /*image_map {jpeg "earth.jpg" once}*/}
        }
        //rotate c*z
    }
    //object{Moon translate 384400*km*x rotate 1/27.32166*c*z }
    }
}

#declare q=2;
light_source {  <1, 1, 1>*10000                  
  color rgb <1,1,1>*q    }
light_source {  <-1, 1, 1>*10000                  
  color rgb <1,1,1>*q    }
light_source {  <1, -1, 1>*10000                    
  color rgb <1,1,1>*q    }
light_source {  <1, 1, -1>*10000                    
  color rgb <1,1,1>*q    }
light_source {  <-1, -1, 1>*10000                     
  color rgb <1,1,1>*q    }
light_source {  <-1, 1, -1>*10000                    
  color rgb <1,1,1>*q    }
  
camera {      
  location <695001*km,6441*km,0>
  look_at  <99999999999999999999999,0,0>  
  angle 0.0001
  right  x*image_width/image_height
     }
     
