$fn = 300;
wheel_diameter = 31;

mouse_support (wheel_diameter);

module mouse_support (wheel_diameter) {
    translate ([-2, -2, 0]) {
        cube ([4, 4, 3.5]);
    }
    difference () {
        union () {
            translate ([0, 0, wheel_diameter / 2 - 11]) {
                sphere (d = 8);
            }
            translate ([0, 0, 3]) {
                cylinder (d = 8, h = wheel_diameter / 2 - 14);
            }
        }
        translate ([-4, -4, 0]) {
            cube ([8, 8, 3.5]);
        }
        translate ([0, 0, 1]) {
            rotate_extrude (convexity = 20) {
                translate ([4, 0, 0]) {
                    rotate ([0, 0, 45]) {
                        square (3);
                    }
                }
            }
        }
    }
}