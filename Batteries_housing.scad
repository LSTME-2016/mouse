use <Holes.scad>;

$fn = 300;

batteries_housing ();

module batteries_housing () {
    translate ([-18.5, 0, 0]) {
        color ([0.1, 0.1, 0.1, 1]) {
            difference () {
                union () {
                    cube ([37, 52, 9.375]);
                    hull () {
                        translate ([3.125, 0, 9.375]) {
                            rotate ([270, 0, 0]) {
                                cylinder (h = 52, d = 6.25);
                            }
                        }
                        translate ([33.875, 0, 9.375]) {
                            rotate ([270, 0, 0]) {
                                cylinder (h = 52, d = 6.25);
                            }
                        }
                    }
                }
                translate ([5, 2, 1]) {
                    cube ([27, 48, 12.5]);
                }
                translate ([7.25, 26, -0.5]) {
                    hole_for_screw_M3 (5);
                    translate ([22.5, 0, 0]) {
                        hole_for_screw_M3 (5);
                    }
                }
            }
        }
        for (i = [7.125: 11.375: 29.875]) {
            translate ([i, 3.9, 6.625]) {
                battery ();
            }
        }
    }
}

module battery () {
    color ([1, 0, 0, 1]) {
        rotate ([270, 0, 0]) {
            cylinder (h = 44.2, d = 10.25);
        }
    }
}