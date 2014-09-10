use <24byj48.scad>

stepper_spacing=71.5; // from the mount corner
bracket_w=115;
bracket_offset=20;
bracket_t=15;
bracket_w_inner=8;
base_w=15;
n_w=7.2;
n_z=2.5;
screw_w=4.5;
module screw_nut_uncut(nut_depth, nut_length,nut_thick) {
	translate([0,0,-nut_length])
	cylinder(h=nut_length,d=screw_w*2,center=false,$fn=res);
	cylinder(h=nut_length,d=screw_w,center=false,$fn=res);
	translate([0,n_w/2,nut_depth+nut_thick/2-0.01])
	cube(size=[n_w,n_w*2,nut_thick], center=true);
}

module steppers(){
	translate([-stepper_spacing,9,-16])
	rotate(a=[0,0,180]){
		stepper_mounted(n_l=45,n_rot1=0,n_rot2=-0,n_d=20,screw=0, res=30);
		cylinder(h=80,d=28,center=false,$fn=res);
	}
	translate([-9,stepper_spacing,-16])
	rotate(a=[0,0,-90]){
		stepper_mounted(n_l=45,n_rot1=0,n_rot2=0,n_d=20,screw=0, res=30);
		cylinder(h=80,d=28,center=false,$fn=res);
	}
}

module lens(){
	translate([-40,40,0])
	cylinder(h=50,r=25,center=true,$fn=res);
}

module bracket(){
	difference(){
		union(){
			translate([-bracket_w/2+bracket_offset,bracket_w/2-bracket_offset,bracket_t/2])
			cube(size=[bracket_w,bracket_w,bracket_t], center=true);
			translate([-bracket_w/2+bracket_offset,-bracket_offset/2,bracket_offset])
			cube(size=[bracket_w,bracket_offset,base_w+bracket_t], center=true);
		}
		translate([-bracket_w+(bracket_w-bracket_w_inner)/2,bracket_w-(bracket_w-bracket_w_inner)/2,bracket_t/2])
		difference(){		
			cube(size=[bracket_w-bracket_w_inner,bracket_w-bracket_w_inner,bracket_t+1], center=true);
			difference(){
				translate([(bracket_w-bracket_w_inner)/4,-(bracket_w-bracket_w_inner)/4,0])
				cube(size=[(bracket_w-bracket_w_inner)/2,(bracket_w-bracket_w_inner)/2,bracket_t+1], center=true);
				cylinder(h=50,r=(bracket_w-bracket_w_inner)/2,center=true,$fn=res);
			}
		}
		//lens();
	}
}

module screws(){
	translate([0,-5,21])
	rotate(a=[90,0,0]){
		//KM200 mounting
		translate([-30,0,0])
		screw_nut_uncut(3, 45,n_z);
		translate([-40,0,0])
		screw_nut_uncut(3, 45,n_z);
		translate([-54,0,0])
		screw_nut_uncut(3, 45,n_z);
		//mounting holes
		translate([-(40-50),0,0])
		screw_nut_uncut(3, 45,n_z);
		translate([-(40+50),0,0])
		screw_nut_uncut(3, 45,n_z);
	}
}

//lens();

difference(){
	bracket();
	screws();
	steppers();
}