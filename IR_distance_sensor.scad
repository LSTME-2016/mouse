use <Holes.scad>;

$fn = 300;

ir_distance_sensor ();

module ir_distance_sensor () {
    color ([0.1, 0.1, 0.4, 1]) {
        difference () {
            translate ([-6.95, 0, 0]) {
                cube ([13.9, 31.4, 1.6]);
            }
            translate ([0, 8.35, -0.5]) {
                hole_for_screw_M3 (2.6);
            }
        }
    }
    color ([0.1, 0.1, 1, 1]) {
        translate ([-1, 13, 1.1]) {
            cube ([7, 7, 5]);
        }
    }
    translate ([0, 2, 1.6]) {
        rotate ([180, 0, 0]) {
            for (i = [0: 2.54: 5.08]) {
                color ([0.8, 0.8, 0.8, 1]) {
                    translate ([i - 2.54, 0, -4.75]) {
                        rotate ([0, 0, 45]) {
                            cylinder (h = 6.75, d = 0.63 * sqrt (2),
                                      $fn = 4);
                        }
                        translate ([0, -0.32, 0]) {
                            rotate ([270, 45, 0]) {
                                cylinder (h = 7, d = 0.63 * sqrt (2),
                                          $fn = 4);
                            }
                        }
                    }
                }
                color ([0.1, 0.1, 0.1, 1]) {
                    translate ([i - 2.54, 0, -2]) {
                        rotate ([0, 0, 45]) {
                            cylinder (h = 2, d = 2.7, $fn = 4);
                        }
                    }
                }
            }
            color ([0.1, 0.1, 0.1, 1]) {
                translate ([-2.55, -0.6, -1.6]) {
                    cube ([5.1, 1.2, 2]);
                }
            }
        }
    }
    color ([1, 1, 1, 0.3]) {
        translate ([-4.2, 31.5, 2.5]) {
            rotate ([270, 0, 0]) {
                led_diode ();
            }
        }
    }
    color ([0.1, 0.1, 0.1, 1]) {
        translate ([4.2, 31.5, 2.5]) {
            rotate ([270, 0, 0]) {
                led_diode ();
            }
        }
    }
}

module led_diode () {
    cylinder (h = 6.3, d = 5);
    translate ([0, 0, 6.3]) {
        sphere (d = 5);
    }
}