$fn = 100;
high_of_hole = 1;

//hole_for_base (high_of_hole);
//hole_for_screw_M2 (high_of_hole);
//hole_for_screw_M2_5 (high_of_hole);
//hole_for_screw_M3 (high_of_hole);
//hole_for_shaft (high_of_hole);

module hole_for_base (high_of_hole) {
    cylinder (h = high_of_hole, d = 8);
}

module hole_for_screw_M1_2 (high_of_hole) {
    cylinder (h = high_of_hole, d = 1.6);
}

module hole_for_screw_M2 (high_of_hole) {
    cylinder (h = high_of_hole, d = 2.8);
}

module hole_for_screw_M2_5 (high_of_hole) {
    cylinder (h = high_of_hole, d = 3.3);
}

module hole_for_screw_M3 (high_of_hole) {
    cylinder (h = high_of_hole, d = 3.9);
}

module hole_for_shaft (high_of_hole) {
    cylinder (h = high_of_hole, d = 4.9);
}