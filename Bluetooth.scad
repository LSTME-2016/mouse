$fn = 300;

bluetooth ();

module bluetooth () {
    color ([0.1, 0.3, 0.5, 1]) {
        translate ([-8.5, 0, 0]) {
            cube ([17, 37.7, 1.1]);
        }
    }
    color ([0.1, 0.1, 0.1, 1]) {
        translate ([-3.5, 18, 0.5]) {
            cube ([9, 9, 3.6]);
        }
        translate ([-3.5, 10.5, 0.5]) {
            cube ([9, 6, 3.6]);
        }
    }
    translate ([0, 1.5, 1.1])
    rotate ([180, 0, 0]) {
        for (i = [0: 2.54: 2.54 * 3]) {
            color ([0.8, 0.8, 0.8, 1]) {
                translate ([i - 2.54 * 1.5, 0, -4.75]) {
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
                translate ([i - 2.54 * 1.5, 0, -2]) {
                    rotate ([0, 0, 45]) {
                        cylinder (h = 2, d = 2.7, $fn = 4);
                    }
                }
            }
        }
        color ([0.1, 0.1, 0.1, 1]) {
            translate ([-3, -0.6, -1.6]) {
                cube ([6, 1.2, 2]);
            }
        }
    }
}