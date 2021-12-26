// all inner dimensions
$fn=32;

length=88.5;
depth=63;
height=47;

thickness = 4;

module box(){
    difference(){
        cube([length+2*thickness, depth+2*thickness, height+thickness]);
        translate([thickness,thickness,thickness+0.01])
        cube([length, depth, height+thickness]);
        
        translate([length-thickness-5,depth+3*thickness,6+8.5+thickness])
        rotate([90,0,0])
        cylinder(r=6, h=20);
        
        translate([thickness+29,depth+3*thickness,5.1+8.5+thickness])
        rotate([90,0,0])
        cylinder(r=5.1, h=20);
        
        // usb
        translate([2*thickness+length-4.5,thickness+21.7-11/2,thickness+height-33-9])
        cube([5, 11, 9]);
        
        translate([-0.1, (2*thickness+depth)/2+-10, height/3])
        rotate([90,0,90])
        linear_extrude(1)
        scale([2.5, 2.5])
        text("T");
        
        translate([-0.1, (2*thickness+depth)/2+-15.82, height/3-7])
        rotate([90,0,90])
        linear_extrude(1)
        scale([2.5, 2.5])
        text("W");
        
        translate([2*thickness+length-0.99, (2*thickness+depth)/2-6, height/1.5])
        rotate([90,0,90])
        linear_extrude(1)
        scale([1.5, 1.5])
        text("T");
        
        translate([2*thickness+length-0.99, (2*thickness+depth)/2-9.5, height/1.5-4])
        rotate([90,0,90])
        linear_extrude(1)
        scale([1.5, 1.5])
        text("W");
        
        translate([2.5*thickness,1.99, height/2])
        rotate([90,0,0])
        linear_extrude(2)
        scale([0.9, 0.9])
        text("PROSTOFON");
    }
}

module top(){
    difference(){
        cube([length+2*thickness, depth+2*thickness, 3]);
        
        translate([7.5,18.2,-.5])
        cube([60, .5, thickness+1]);
        
        for ( i = [1 : 9] ){
            translate([7.5*i, 18.2, -.5])
            cube([.5, 30, thickness+1]);
        }
                
        translate([length+2*thickness-6.5-11, 37.5-3.5, -.5])
        cube([9,5,thickness+1]);
        
        translate([2*thickness,depth - 2*thickness, 2.1])
        linear_extrude(2)
        scale([0.9, 0.9])
        text("PROSTOFON");
        
        translate([.5+7.5, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("C");
        
        translate([15.5, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("D");
        
        translate([23, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("E");
        
        translate([30.5, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("F");
        
        translate([38, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("G");
        
        translate([45.5, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("A");
        
        translate([53, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("H");        
        
        translate([60.5, 10, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("C'");  

       // mode
        translate([76, 25, 2.1])
        linear_extrude(2)
        scale([0.6, 0.6])
        text("A M");  
        
        // copyright
        
    }
   
}

module schrauben(){
    translate([2*thickness+length-2.5,2.5,height+thickness-19.9])
    cylinder(r=1, h=100);
    
    // kopf
    translate([2*thickness+length-2.5,2.5,height+thickness+13-2.9])
    cylinder(r=3.6/2, h=3);
    
    
    translate([2.5,2.5,height+thickness-19.9])
    cylinder(r=1, h=100);
    // kopf
    translate([2.5,2.5,height+thickness+13-2.9])
    cylinder(r=3.6/2, h=3);
    
    translate([2*thickness+length-2.5,2*thickness+depth-2.5,height+thickness-19.9])
    cylinder(r=1, h=100);
    // kopf
    translate([2*thickness+length-2.5,2*thickness+depth-2.5,height+thickness+13-2.9])
    cylinder(r=3.6/2, h=3);
    
    translate([2.5,2*thickness+depth-2.5,height+thickness-19.9])
    cylinder(r=1, h=100);
    // kopf
    translate([2.5,2*thickness+depth-2.5,height+thickness+13-2.9])
    cylinder(r=3.6/2, h=3);
}


difference(){
    box();
    schrauben();
}

/*
difference(){    
    translate([0,0,60]) top();
    schrauben();
}*/