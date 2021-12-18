$fn=64;

function point_from_angle(angle_deg, r) = 
    [r*cos(angle_deg), r*sin(angle_deg)];
    
r_hammer = 70;
r_glass_outer = 40;
r_glass = 69/2;

height_bottom = 2;


module kranz(){
    difference(){
        cylinder(r=90, h=height_bottom);
        
        for ( i = [0 : 45 : 360] ){
        p = point_from_angle(i, r_hammer+r_glass_outer);
        translate([p[0], p[1], -.1]){
            cylinder(r=r_glass, h=10);
            //translate([0,0,10])
            //cylinder(r=r_glass_outer, h=5);
        }
    }
    }
}

difference(){
    union(){
        difference(){
            kranz();
            translate([0,0,-0.1])
            scale([0.9, 0.9, 1.5])
            kranz();
        }
        
        
        translate([0,0,height_bottom/2])
        difference(){
            cube([150, 40, height_bottom], center=true);
            
            translate([50,0,-0.1])
            cube([50, 30, height_bottom+1], center=true);
            
            translate([-50,0,-0.1])
            cube([50, 30, height_bottom+1], center=true);
        }
        
        translate([0,0,height_bottom/2])
        difference(){
            cube([40, 150, height_bottom], center=true);
            translate([0,50,-0.1])
            cube([30, 50, height_bottom+1], center=true);        
            
            translate([0,-50,-0.1])
            cube([30, 50, height_bottom+1], center=true);
        }
    
        translate([0,0,40+height_bottom])
        difference(){
            cube([40,40,80], center=true);
            
            translate([0,0,-5])
            cube([32,32,90], center=true);
            
            translate([0,0,-10])
            cube([50,15,60], center=true);
            
            translate([0,0,-10])
            cube([15,50,60], center=true);
            
            translate([0,0,40.01-5])
            cube([36,36,10], center=true);
            
            translate([0,0,40.01-5])
            cube([50,15,10], center=true);
            
            translate([0,0,40.01-5])
            cube([15,50,10], center=true);
        }
    }



}