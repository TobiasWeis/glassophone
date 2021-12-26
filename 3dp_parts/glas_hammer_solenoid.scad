// arduino solenoid music
$fn = 32;

// dimensions solenoid: 20, 12.3, 12.3

servo_offset=63;

difference(){
    union(){
        difference(){
            //cube([20,12.5, 3]);
            translate([-6,0,0])
            cube([119, 12.5, 3]);
            
            hull(){
                translate([6.5,2.5,-1])
                cylinder(r=1.25, h=10);
                translate([6.5,3.5,-1])
                cylinder(r=1.25, h=10);
            }
            
            hull(){
                translate([20-3.5,12.5-2.5,-1])
                cylinder(r=1.25, h=10);
                translate([20-3.5,12.5-3.5,-1])
                cylinder(r=1.25, h=10);
            }
        }

        // anschlag
        translate([-6,0,3])
        difference(){
            cube([1, 12.5, 12.5]);
            
            translate([-1, 12.5/2, 12.5/2])
            rotate([0,90,0])
            cylinder(r=3, h=10);
            
            translate([-.5,12.5/2-3,12.5/2])
            cube([2, 6, 8]);
        }
        
        
        // seiten anschlag
        translate([-6,-1,0])
        cube([10,1,15.5]);
        
        translate([-6,12.5,0])
        cube([10,1,15.5]);
        
        // servo-kupplung
        translate([servo_offset,12.5/2,3])
        cylinder(r=5, h=5);
    }
    
    // servo-kupplung
    translate([servo_offset,12.5/2,-1])
    cylinder(r=2.75, h=20);
    
    // gegengewicht
    translate([104,12.5/2,-1])
    cylinder(r=4.5, h=20);
}

// servo-D
translate([servo_offset-2.5,12.5/2+2.25,3])
cube([5,0.5,5]);