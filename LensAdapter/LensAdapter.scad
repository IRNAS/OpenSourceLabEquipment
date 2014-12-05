// Mounting adapter for 25mm lens to be inserted in the 40mm aperture of an IR camera. Dimensions can be adjusted for other uses. There is a lip for the inserted 

// Note the outside has a varying diameter, so the mounc can be firmly pushed into a roudn opening.

outer_top = 39.5; // outer diameter top
outer_bottom = 40.5; // outer diameter bottom
inner = 25.5; // inner diameter
inner_lip = 24; // inner diameter to form a lip
inner_lip_thick = 0.5; // thickness of the lip
thick = 5; // thickness

res = 100; //resolution of the part


difference(){
	// main cylinder to form the outer edge
	cylinder(h=thick,r1=outer_bottom/2,r2=outer_top/2,center=true,$fn=res);
	// make two holes, for the lens and smaller one for the lip
	translate([0,0,inner_lip_thick])
	cylinder(h=thick-inner_lip_thick*2,r=inner/2,center=true,$fn=res);
	cylinder(h=thick,r=inner_lip/2,center=true,$fn=res);
}