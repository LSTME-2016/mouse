$fn = 300;

FEETECH_FS90R_Micro_Servo ();
mounting_hub ();

module FEETECH_FS90R_Micro_Servo () {
    color ([0, 0.4, 0.6, 0.9]) {
        translate ([-5.9, 0, 0]) {
            cube ([11.8, 22.8, 22.3]);
        }
        difference () {
            translate ([-5.875, -4.7, 15.5]) {
                cube ([11.75, 32.2, 2.4]);
            }
            translate ([0, -2.35, 15]) {
                cylinder (h = 3.4, d = 2.1);
                translate ([0, 27.5, 0]) {
                    cylinder (h = 3.4, d = 2.1);
                }
            }
            translate ([-0.6, -5.2, 15]) {
                cube ([1.2, 3, 3.4]);
            }
            translate ([-0.6, 25.45, 15]) {
                cube ([1.2, 3, 3.4]);
            }
        }
        translate ([0, 5.9, 0.5]) {
            cylinder (h = 26.1, d = 11.8);
        }
    }
    color ([1, 1, 1, 1]) {
        translate ([0, 5.9, 26.5]) {
            cylinder (h = 2.4, d = 4.7);
        }
    }
}

module mounting_hub () {
    dh = 4;
    
    color ([1, 1, 1, 1]) {
        translate ([0, 5.9, 29.4]) {
            rotate ([0, 0, $t * -360]) {
                difference () {
                    union () {
                        translate ([0, 0, -2.25]) {
                            cylinder (h = 3.75, d = 6.9);
                        }
                        hull () {
                            cylinder (h = 1.5, d = 6);
                            translate ([0, 15.95 - dh / 2, 0]) {
                                cylinder (h = 1.5, d = dh);
                            }
                            translate ([0, -15.95 + dh / 2, 0]) {
                                cylinder (h = 1.5, d = dh);
                            }
                        }
                    }
                    translate ([0, 0, -2.75]) {
                        cylinder (h = 2.25, d = 4.8);
                    }
                    translate ([0, 0, 0.5]) {
                        cylinder (h = 2.25, d = 4.8);
                    }
                    translate ([0, 0, -2.75]) {
                        cylinder (h = 5, d = 2.4);
                    }
                    for (i = [0: 2: 10]) {
                        translate ([0, -14.45 + i, -0.5]) {
                            cylinder (h = 2.5, d = 1);
                        }
                        translate ([0, 14.45 - i, -0.5]) {
                            cylinder (h = 2.5, d = 1);
                        }
                    }
                }
            }
        }
    }
}