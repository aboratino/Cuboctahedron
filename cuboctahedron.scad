////////////////////////////////////////////////////////
//
//  Cuboctahedron Node
//
//  Print 12 for a full set.
//
//  You will also need 24 sticks of identical length.
//  Actual length does not matter, you can scale 
//  the cuboctahedron to any size.
//
//  2018 Anthony Boratino
//
////////////////////////////////////////////////////////

// Node variables
nq = 90;        // Node quality
sq = 90;        // Node quality
nodesz = 7.5;   // ball size

// Hole variables
holeLen = 20;       // hole length
holeWidth = 4;      // stick width ( 4=4mm)
holeOffset = 3.5;   // hole offsets from center

// Invisible Stick for holes
module hole( ) 
{
    cylinder(h = holeLen, 
             d = holeWidth, 
             $fn = sq);
}

// Create the node
// The holes needed are drilled at 45 degrees from top down.
// Two pairs of holes 180 degress apart.
// Each hole 90 degress apart.
difference()
{
    rotate([0, -45, 0])
        difference()
        {
            rotate([0, 0, 0]) translate([ 0, 0, 0 ]) 
            sphere(nodesz, $fn =nq);
            
            /// negative holes
            rotate([-45, 0, 0]) translate([0, 0, 3.5]) hole();
            rotate([+45, 0, 0]) translate([0, 0, 3.5]) hole();
            rotate([ 45,90, 0]) translate([0, 0, 3.5]) hole();
            rotate([-45,90, 0]) translate([0, 0, 3.5]) hole();
        }
    // flatten top and bottom of node for quicker printing / less material
    translate([0,0,-10.5]) cube([15,15,20],center=true);
    translate([0,0,16.5]) cube([15,15,20],center=true);
}