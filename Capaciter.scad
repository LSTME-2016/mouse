$fn = 300;

Hitano_1000uF ();

module Hitano_1000uF () {
    color ([0.1, 0.15, 0.1, 1]) {
        difference () {
            cylinder (h = 13.5, d = 10.2);
            translate ([0, 0, 3.8]) {
                rotate_extrude () {
                    translate ([7.25, 0]) {
                        circle (d = 5);
                    }
                }
            }
        }
    }
}