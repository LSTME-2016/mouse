use <Holes.scad>;

difference () {
    cube ([10, 10, 3]);
    translate ([5, 5, -0.5]) {
        hole_for_screw_M3 (4);
    }
}