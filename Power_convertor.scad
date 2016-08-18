$fn = 300;

power_convertor ();

module power_convertor () {
    color ([0, 0.5, 0, 1]) {
        difference () {
            translate ([-9, 0, 0]) {
                cube ([18, 26.2, 1]);
            }
            translate ([4.25, 24.5, -0.5]) {
                cylinder (h = 2, d = 1.4);
            }
            translate ([-4.25, 24.5, -0.5]) {
                cylinder (h = 2, d = 1.4);
            }
        }
    }
    color ([0.1, 0.1, 0.1, 1]) {
        translate ([-2.3, 6.7, 1]) {
            difference () {
                cylinder (h = 4.6, d = 5.6);
                difference () {
                    translate ([0, 0, 1]) {
                        cylinder (h = 2.6, d = 6.6);
                    }
                    translate ([0, 0, 0.5]) {
                        cylinder (h = 3.6, d = 3.5);
                    }
                }
            }
        }
        translate ([-1, 10, 0.5]) {
            cube ([2, 4, 2.5]);
        }
    }
    color ([0.8, 0.4, 0, 1]) {
        for (i = [1: 0.65: 3.6]) {
            translate ([-2.3, 6.7, i + 1]) {
                rotate_extrude () {
                    translate ([2.08, 0]) {
                        circle (d = 0.65);
                    }
                }
            }
        }
    }
    color ([1, 1, 1, 1]) {
        translate ([-6.5, 5, 0.7]) {
            rotate ([0, 0, 90]) {
                text ("Mobile Booster", size = 1.5);
            }
        }
    }
}