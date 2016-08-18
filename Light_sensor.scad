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
}