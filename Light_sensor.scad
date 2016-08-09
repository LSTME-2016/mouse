$fn = 300;

light_sensor ();

module light_sensor () {
    color ([0, 0.4, 0, 1]) {
        difference () {
            translate ([-15.875, 0, 0]) {
                cube ([31.75, 7.62, 1]);
            }
            translate ([-13.335, 3.81, -0.5]) {
                cylinder (h = 2, d = 3);
            }
            translate ([13.335, 3.81, -0.5]) {
                cylinder (h = 2, d = 3);
            }
        }
    }
    color ([0.1, 0.1, 0.1, 1]) {
        translate ([-9.525, 4, 1.5]) {
            cube ([2.5, 2.5, 2], center = true);
        }
        translate ([9.525, 4, 1.5]) {
            cube ([2.5, 2.5, 2], center = true);
        }
        translate ([0, 4.5, 1.5]) {
            cube ([2.5, 2.5, 2], center = true);
        }
    }
}