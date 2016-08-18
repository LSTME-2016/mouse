$fn = 300;

FEETECH_FS90R_Micro_Servo ();
translate ([0, 0, 29.15]) {
    mounting_hub ();
}

module FEETECH_FS90R_Micro_Servo () {
    color ([0, 0.4, 0.6, 0.9]) {
        translate ([-5.9, -5.9, 0]) {
            cube ([11.8, 22.8, 22.3]);
        }
        difference () {
            translate ([-5.875, -4.7 - 5.9, 15.5]) {
                cube ([11.75, 32.2, 2.4]);
            }
            translate ([0, -2.35 - 5.9, 15]) {
                cylinder (h = 3.4, d = 2.1);
                translate ([0, 27.5, 0]) {
                    cylinder (h = 3.4, d = 2.1);
                }
            }
            translate ([-0.6, -5.2 - 5.9, 15]) {
                cube ([1.2, 3, 3.4]);
            }
            translate ([-0.6, 25.45 - 5.9, 15]) {
                cube ([1.2, 3, 3.4]);
            }
        }
        translate ([0, 0, 0.5]) {
            cylinder (h = 26.1, d = 11.8);
        }
    }
    color ([1, 1, 1, 1]) {
        translate ([0, 0, 26.5]) {
            cylinder (h = 2.4, d = 4.7);
        }
    }
}

module mounting_hub () {
    dh = 4;
    
    color ([1, 1, 1, 1]) {
        rotate ([0, 0, $t * -360]) {
            difference () {
                union () {
                    translate ([0, 0, -1.75]) {
                        cylinder (h = 4.2, d = 6.8);
                    }
                    hull () {
                        cylinder (h = 2, d = 7);
                        translate ([0, 13.8 - dh / 2, 0]) {
                            cylinder (h = 2, d = dh);
                        }
                        translate ([0, -13.8 + dh / 2, 0]) {
                            cylinder (h = 2, d = dh);
                        }
                    }
                }
                difference () {
                    translate ([0, 0, 2]) {
                        cylinder (h = 0.95, d = 7.8);
                    }
                    translate ([0, 0, 1.5]) {
                        cylinder (h = 1.95, d = 5.4);
                    }
                }
                translate ([0, 0, -2.25]) {
                    cylinder (h = 2.9, d = 4.8);
                }
                translate ([0, 0, 1.25]) {
                    cylinder (h = 1.7, d = 4.8);
                }
                translate ([0, 0, -2.75]) {
                    cylinder (h = 5, d = 2.4);
                }
                for (i = [0: 2: 8]) {
                    translate ([0, -12.45 + i, -0.5]) {
                        cylinder (h = 3, d = 1);
                    }
                    translate ([0, 12.45 - i, -0.5]) {
                        cylinder (h = 3, d = 1);
                    }
                }
            }
        }
    }
}