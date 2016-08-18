use <Holes.scad>;

$fn = 300;

wicket_for_batteries ();

module wicket_for_batteries () {
    color ([1, 1, 0, 1]) {
        translate ([-17, 0, 0]) {
            cube ([34, 52, 2]);
        }
        translate ([5, 51.5, 1]) {
            cube ([8, 2.5, 1]);
        }
        translate ([-13, 51.5, 1]) {
            cube ([8, 2.5, 1]);
        }
        difference () {
            hull () {
                translate ([0, -5, 0]) {
                    cylinder (h = 2, d = 10);
                }
                translate ([-5, 0, 0]) {
                    cube ([10, 2, 2]);
                }
            }
            translate ([0, -5, -0.5]) {
                hole_for_screw_M3 (3);
            }
        }
    }
}