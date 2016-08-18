use <Holes.scad>;

$fn = 300;

batteries_housing ();

module batteries_housing () {
    translate ([-18.5, 0, 0]) {
        color ([0.1, 0.1, 0.1, 1]) {
            difference () {
                union () {
                    cube ([37, 53, 7.75]);
                    hull () {
                        translate ([4.75, 0, 7.75]) {
                            rotate ([270, 0, 0]) {
                                cylinder (h = 53, d = 9.5);
                            }
                        }
                        translate ([32.25, 0, 7.75]) {
                            rotate ([270, 0, 0]) {
                                cylinder (h = 53, d = 9.5);
                            }
                        }
                    }
                }
                translate ([2.65, 2.15, 1]) {
                    cube ([31.7, 48.7, 12.5]);
                }
                translate ([7.25, 26, -0.5]) {
                    hole_for_screw_M3 (5);
                    translate ([23, 0, 0]) {
                        hole_for_screw_M3 (5);
                    }
                }
            }
        }
        for (i = [7.125: 11.375: 29.875]) {
            translate ([i, 4.5, 6.625]) {
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