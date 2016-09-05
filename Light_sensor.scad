$fn = 300;

light_sensor ();

module light_sensor () {
    color ([0, 0.4, 0, 1]) {
        difference () {
            translate ([-15.95, 0, 0]) {
                cube ([31.90, 7.7, 1]);
            }
            translate ([-13.5, 3.85, -0.5]) {
                cylinder (h = 2, d = 2.2);
            }
            translate ([13.5, 3.85, -0.5]) {
                cylinder (h = 2, d = 2.2);
            }
        }
    }
    color ([0.1, 0.1, 0.1, 1]) {
        translate ([-9.525, 4, -0.5]) {
            cube ([2.5, 2.5, 2], center = true);
        }
        translate ([9.525, 4, -0.5]) {
            cube ([2.5, 2.5, 2], center = true);
        }
        translate ([0, 4.5, -0.5]) {
            cube ([2.5, 2.5, 2], center = true);
        }
    }
    translate ([0, 1.2, 1]) {
        rotate ([180, 0, 0]) {
            for (i = [0: 2.54: 4 * 2.54]) {
                color ([0.8, 0.8, 0.8, 1]) {
                    translate ([i - 2.54 * 2, 0, -9.8]) {
                        rotate ([0, 0, 45]) {
                            cylinder (h = 11.3, d = 0.63 * sqrt (2),
                                      $fn = 4);
                        }
                    }
                }
                color ([0.1, 0.1, 0.1, 1]) {
                    translate ([i - 2.54 * 2, 0, -2]) {
                        rotate ([0, 0, 45]) {
                            cylinder (h = 2, d = 2.7, $fn = 4);
                        }
                    }
                }
            }
            color ([0.1, 0.1, 0.1, 1]) {
                translate ([-2.54 * 2, -0.6, -1.6]) {
                    cube ([2.54 * 4, 1.2, 2]);
                }
            }
        }
    }
}