$fn = 300;

HC_SR04 ();

module HC_SR04 () {
    color ([0.1, 0.1, 0.4, 1]) {
        difference () {
            translate ([-22.75, 0, 0]) {
                cube ([45.5, 1.6, 20.6]);
            }
            translate ([-21.5, -0.5, 1.25]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 2.6, d = 1.5);
                }
            }
            translate ([21.5, -0.5, 1.25]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 2.6, d = 1.5);
                }
            }
            translate ([-21.5, -0.5, 19.35]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 2.6, d = 1.5);
                }
            }
            translate ([21.5, -0.5, 19.35]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 2.6, d = 1.5);
                }
            }
        }
    }
    difference () {
        color ([0.8, 0.8, 0.8, 1]) {
            translate ([13, 1.1, 10.3]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 12.75, d = 15.9);
                }
            }
            translate ([-13, 1.1, 10.3]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 12.75, d = 15.9);
                }
            }
        }
        color ([0.1, 0.1, 0.1, 1]) {
            translate ([13, 13.75, 10.3]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 0.6, d = 12.9);
                }
            }
            translate ([-13, 13.75, 10.3]) {
                rotate ([270, 0, 0]) {
                    cylinder (h = 0.6, d = 12.9);
                }
            }
        }
    }
    translate ([0, 0, 1.5]) {
        rotate ([270, 0, 0]) {
            for (i = [0: 2.54: 2.54 * 3]) {
                color ([0.8, 0.8, 0.8, 1]) {
                    translate ([i - 2.54 * 1.5, 0, -4.75]) {
                        rotate ([0, 0, 45]) {
                            cylinder (h = 6.75, d = 0.63 * sqrt (2),
                                      $fn = 4);
                        }
                        translate ([0, -0.32, 0]) {
                            rotate ([270, 45, 0]) {
                                cylinder (h = 7, d = 0.63 * sqrt (2),
                                          $fn = 4);
                            }
                        }
                    }
                }
                color ([0.1, 0.1, 0.1, 1]) {
                    translate ([i - 2.54 * 1.5, 0, -2]) {
                        rotate ([0, 0, 45]) {
                            cylinder (h = 2, d = 2.7, $fn = 4);
                        }
                    }
                }
            }
            color ([0.1, 0.1, 0.1, 1]) {
                translate ([-3, -0.6, -1.6]) {
                    cube ([6, 1.2, 2]);
                }
            }
        }
    }
}