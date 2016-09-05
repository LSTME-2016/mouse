use <Holes.scad>;

$fn = 30;
maximum_diameter = 35;
minimum_diameter = 22;

hub_for_ultrasonic_sensor ();

module hub_for_ultrasonic_sensor () {
    color ([1, 1, 0, 1]) {
        difference () {
            union () {
                translate ([-12, 0, 13.3]) {
                    rotate ([270, 22.5, 0]) {
                        cylinder (h = 2, d = maximum_diameter,
                                  $fn = 8);
                    }
                }
                translate ([12, 0, 13.3]) {
                    rotate ([270, 22.5, 0]) {
                        cylinder (h = 2, d = maximum_diameter,
                                  $fn = 8);
                    }
                }
                translate ([-10, 0, 13.3 - maximum_diameter / 2 *
                            cos (22.5)]) {
                    cube ([20, 2, maximum_diameter * cos (22.5)]);
                }
            }
            translate ([-12, -0.5, 13.3]) {
                rotate ([270, 22.5, 0]) {
                    cylinder (h = 3, d = minimum_diameter, $fn = 8);
                }
            }
            translate ([12, -0.5, 13.3]) {
                rotate ([270, 22.5, 0]) {
                    cylinder (h = 3, d = minimum_diameter, $fn = 8);
                }
            }
            translate ([-10, -0.5, 13.3 - minimum_diameter / 2 *
                        cos (22.5)]) {
                cube ([20, 3, minimum_diameter * cos (22.5)]);
            }
            translate ([0, 0, 3]) {
                translate ([-21.4, -0.5, 1.5]) {
                    rotate ([270, 0, 0]) {
                        hole_for_screw_M1_2 (3);
                    }
                }
                translate ([21.4, -0.5, 1.5]) {
                    rotate ([270, 0, 0]) {
                        hole_for_screw_M1_2 (3);
                    }
                }
                translate ([-21.4, -0.5, 19.35]) {
                    rotate ([270, 0, 0]) {
                        hole_for_screw_M1_2 (3);
                    }
                }
                translate ([21.4, -0.5, 19.35]) {
                    rotate ([270, 0, 0]) {
                        hole_for_screw_M1_2 (3);
                    }
                }
            }
        }
        difference () {
            translate ([-4, 0, 13.3 - maximum_diameter / 2 *
                        cos (22.5)]) {
                cube ([8, 10, 3]);
            }
            translate ([0, 6, 12.8 - maximum_diameter / 2 *
                        cos (22.5)]) {
                hole_for_screw_M3 (4);
            }
        }
    }
}