use <Motor.scad>;

$fn = 200;
wheel_diameter = 31;
dh = 4.7;

translate ([0, 0, 2.1]) {
    rotate ([180, 0, 0]) {
        //mounting_hub ();
    }
}
wheel (wheel_diameter);

module wheel (wheel_diameter) {
    color ([0.1, 0.1, 0.1, 1]) {
        difference () {
            cylinder (h = 4, d1 = wheel_diameter,
                      d2 = wheel_diameter * 14.5 / 14);
            translate ([0, 0, -0.5]) {
                cylinder (h = 5, d = 7.7);
                hull () {
                    cylinder (h = 2.7, d = 7.7);
                    translate ([0, 14.3 - dh / 2, 0]) {
                        cylinder (h = 2.7, d = dh);
                    }
                    translate ([0, -14.3 + dh / 2, 0]) {
                        cylinder (h = 2.7, d = dh);
                    }
                }
            }
            difference () {
                translate ([0, 0, -0.5]) {
                    cylinder (h = 5, d = wheel_diameter * 11 / 14);
                }
                translate ([-4.5, -wheel_diameter * 3 / 7, 0]) {
                    cube ([9, wheel_diameter * 6 / 7, 4]);
                }
                translate ([0, 0, -1]) {
                    cylinder (h = 6, d = wheel_diameter * 6 / 14);
                }
            }
            for (i = [0: 2: 10]) {
                if (i == 2 || i == 6) {
                    translate ([0, -14.45 + i, 1]) {
                        cylinder (h = 3.5, d = 1.9);
                    }
                    translate ([0, 14.45 - i, 1]) {
                        cylinder (h = 3.5, d = 1.9);
                    }
                }
            }
            translate ([0, 0, 2]) {
                rotate_extrude () {
                    translate ([wheel_diameter / 2 + 0.25, 0]) {
                        circle (d = 2);
                    }
                }
            }
        }
    }
}