use <Holes.scad>;

$fn = 300;
batteries_distance = -32;
chassis_diameter = 92.5;
side = 10;
spacing = 2.5;

wicket_for_batteries (batteries_distance, side, spacing);

module wicket_for_batteries (batteries_distance, side, spacing) {
    color ([1, 1, 0, 1]) {
        difference () {
            union () {
                translate ([-17, -1.5, 0]) {
                    cube ([34, 60.5, 2]);
                }
                translate ([8, 58.5, 1]) {
                    cube ([8, 2.5, 1]);
                }
                translate ([-16, 58.5, 1]) {
                    cube ([8, 2.5, 1]);
                }
                difference () {
                    hull () {
                        translate ([0, -7.5, 0]) {
                            cylinder (h = 2, d = 10);
                        }
                        translate ([-5, 0, 0]) {
                            cube ([10, 2, 2]);
                        }
                    }
                    translate ([0, -7.5, -0.5]) {
                        hole_for_screw_M3 (3);
                    }
                }
            }
            mash (batteries_distance, side, spacing);
        }
    }
}

module mash (batteries_distance, side, spacing) {
    n = ceil((chassis_diameter / 2 - side / 2 - spacing) / 
             (side + spacing));
    shift = side / 2 + (side + spacing) * n;                 
    
    difference () {
        translate ([0, -batteries_distance, 0]) {
            rotate ([0, 0, 45]) {
                translate ([-shift, -shift, -0.5]) {
                    for (i = [0: 1: n * 2]) {
                        for (j = [0: 1: n * 2]) {
                            translate ([i * (side + spacing),
                                        j * (side + spacing), 0]) {
                                cube ([side, side, 5]);
                            }
                        }
                    }
                }
            }
        }
//protect_of_gripping
        hull () {
            translate ([0, -7.5, 0]) {
                cylinder (h = 2, d = 10);
            }
            translate ([-5, 0, 0]) {
                cube ([10, 2, 2]);
            }
        }
//protect_of_frame
        difference () {
            translate ([-17.5, -2, -0.5]) {
                cube ([35, 65, 3]);
            }
            translate ([-13, 2, -1]) {
                cube ([26, 53.5, 4]);
            }
        }
    }
}