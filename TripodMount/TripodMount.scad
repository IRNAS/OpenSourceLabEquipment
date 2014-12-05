// Designed for use with Hama "Star 61" Tripod

// Tripod mount is designed for mounting custom objects on a standard photographic tripod with removable base plate. It is designed to be 3D printed and assembled from two pieces. The top can be modified to fit any object.

// To assemble, use M3x20mm screws, they tap into the plastic of the palte directly.


//Dimensions of the attachment base defined here
base_lower_wl=43.5; // lower width
base_upper_wl=36; // upper width
base_h=9; // height of the base
base_h_flat=2; // height of the flat side

base_screw_head_dia=8; // diameter of the mounting screw
base_screw_head_h=4; // depth of screw head countersunk
base_screw_dia=3; // diameter of the screw
screw_l=25; // length of the screw
screw_dist=20; // distance between screws

// Dimensions of the upper part - plate
plate_wl=50; // size of the plate
plate_h=5; // thickness of the plate
// Attached to the plate is the mounting 

// Payload mount definition, custom for every use-case, note that holes for screws may be cut into the mount, depending on the screw length defined.
payload_cube_wl=20;

module payload_mount(){
			translate([-payload_cube_wl/2,-payload_cube_wl/2,0])
			difference(){
				cube(size = [payload_cube_wl,payload_cube_wl,payload_cube_wl], center=false);
				//groove for the laser
				translate([payload_cube_wl/2,payload_cube_wl/2,payload_cube_wl])
				rotate([90,0,0])
				cylinder(h=payload_cube_wl+0.1,r=14/2,center=true,$fn=20);
				//zip tie hole
				translate([payload_cube_wl/2,payload_cube_wl/2,7.5])
				rotate([0,90,0])
				cylinder(h=payload_cube_wl+0.1,r=6/2,center=true,$fn=20);
	
			}
}

// Function for creating a pyramid
module pyramid(w, l, h) {
	mw = w/2;
	ml = l/2;
	polyhedron(points = [
			[0, 0, 0],
			[w, 0, 0],
			[0, l, 0],
			[w, l, 0],
			[mw, ml, h]
		], triangles = [
			[4, 1, 0],
			[4, 3, 1],
			[4, 2, 3],
			[4, 0, 2],
			//base
			[0, 1, 2],
			[2, 1, 3]
		]);
}

// Creating a base for the tripod mount
module base(){
	translate([-base_lower_wl/2,-base_lower_wl/2,0])
	intersection(){
		union(){
			cube(size = [base_lower_wl,base_lower_wl,base_h_flat], center = false);
			translate([0,0,base_h_flat])
			pyramid(base_lower_wl,base_lower_wl,(base_lower_wl*(base_h-base_h_flat))/(base_lower_wl-base_upper_wl));
		}
		cube(size = [base_lower_wl,base_lower_wl,base_h], center = false);
	}
}

// A model of the screw
module sunk_screw(){
	translate([0,0,base_screw_head_h/2])
	cylinder(h=base_screw_head_h,r=base_screw_head_dia/2,center=true,$fn=20);
	translate([0,0,screw_l/2])
	cylinder(h=screw_l,r=base_screw_dia/2,center=true,$fn=20);
}

// Cutting the holes for the screws in the base
module base_with_screws(){
	translate([0,0,-base_h])
	difference(){
		base();
		for (i = [0,90,180,270]){
			rotate([0,0,i+45])
			translate([screw_dist/2,0,0])
			sunk_screw();
		}
	}
}

// Creating the plate and cutting the holes for screws
module plate(){
	difference(){
		union(){
			translate([-plate_wl/2,-plate_wl/2,0])
			cube(size = [plate_wl,plate_wl,plate_h], center=false);
			translate([0,0,plate_h])
			payload_mount();
		}
		translate([0,0,-base_screw_head_h-base_h])
		for (i = [0,90,180,270]){
			rotate([0,0,i+45])
			translate([screw_dist/2,0,0])
			sunk_screw();
		}
	}
}

// Finally building parts, translate function there to shift the objects for export

plate();
translate([0,-50,base_h])
base_with_screws();

		
