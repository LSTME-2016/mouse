$fn = 300;

ir_receiver ();

module ir_receiver () {
    color ([0.1, 0.1, 0.1, 1]) {
        difference () {
            translate ([-7.875, 0, 0]) {
                cube ([15.75, 19.3, 1.6]);
            }
            translate ([5.1, 16.65, -0.5]) {
                cylinder (h = 2.6, d = 2.1);
            }
            translate ([-5.1, 16.65, -0.5]) {
                cylinder (h = 2.6, d = 2.1);
            }
        }
        translate ([0, 13.3, 6.1]) { 
            sphere (d = 5);
        }
    }
    color ([0.7, 0.7, 0.7, 1]) {
        translate ([-3, 9.8, 2.6]) {
            cube ([6, 3.5, 7]);
        }
        for (i = [-2.86: 2.54: 2.86]) {
            translate ([i, 11.5, -0.5]) {
                cube ([0.63, 0.63, 5]);
            }
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
}