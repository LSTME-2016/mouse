use <Holes.scad>;
use <Wicket_for_batteries.scad>;

$fn = 300;
batteries_distance = -22;
height_of_columns = 12.8;
chassis_diameter = 98;
wheel_diameter = 31;
width_of_mouse = 102.5;

chassis_down (batteries_distance, chassis_diameter, wheel_diameter);
chassis_up (batteries_distance, chassis_diameter, width_of_mouse);
//wicket (batteries_distance);
mash () {


module mash () {
    
}

module columns (height_of_columns, chassis_diameter) {
    rotate ([0, 0, 45]) {
        translate ([chassis_diameter / 2 - 6, 0, 3.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
    rotate ([0, 0, 135]) {
        translate ([chassis_diameter / 2 - 6, 0, 3.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
    rotate ([0, 0, 299]) {
        translate ([chassis_diameter / 2 - 6, 0, 3.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
    rotate ([0, 0, 241]) {
        translate ([chassis_diameter / 2 - 6, 0, 3.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
}

module hole_for_batteries (batteries_distance) {
    translate ([0, batteries_distance - 0.5, 16]) {
        rotate ([0, 180, 0]) {
            translate ([-18.5, 0, 0]) {
                hull () {
                    translate ([4.75, 0, 7.75]) {
                        rotate ([270, 0, 0]) {
                            cylinder (h = 54, d = 10.55);
                        }
                    }
                    translate ([32.25, 0, 7.75]) {
                        rotate ([270, 0, 0]) {
                            cylinder (h = 54, d = 10.55);
                        }
                    }
                }
            }
        }
    }
}

module hub_for_motor () {
    difference () {
        translate ([-2.5, -13.9, -0.5]) {
            cube ([4, 27.8, 4.5]);
        }
        translate ([-3, -9.4, -1]) {
            cube ([5, 18.8, 5.5]);
        }
        translate ([-0.5, -11.9, -1]) {
            cube ([5, 23.8, 5.5]);
        }
    }
    difference () {
        translate ([13, -18.6, -0.5]) {
            cube ([7.4, 37.2, 11.5]);
        }
        translate ([12.5, -11.9, -1]) {
            cube ([8.4, 23.8, 13.5]);
        }
        translate ([15, -16.8, -1]) {
            cube ([3.4, 33.2, 13.5]);
        }
        translate ([12.5, -13.75, 5.9]) {
            rotate ([0, 90, 0]) {
                hole_for_screw_M2 (8.4);
            }
        }
        translate ([12.5, 13.75, 5.9]) {
            rotate ([0, 90, 0]) {
                hole_for_screw_M2 (8.4);
            }
        }
    }
}

module hub_for_power_convertor () {
    difference () {
        translate ([6.1, -46.25, 3.5]) {
            cube ([9, 22.5, 8.5]);
        }
        translate ([5.6, -42, 3]) {
            cube ([10, 14, 4]); 
        }
        translate ([5.6, -42, 3]) {
            cube ([4.25, 14, 9.5]); 
        }
        translate ([5.6, -44.25, 8.75]) {
            cube ([7.75, 18.5, 1.5]); 
        }
        translate ([11.4, -30.75, 3]) {
            cylinder (h = 9.5, d = 2);
        }
        translate ([11.4, -39.25, 3]) {
            cylinder (h = 9.5, d = 2);
        }
    }
}

module hub_for_switch (chassis_diameter) {
    rotate  ([0, 0, 315]) {
        difference () {
            translate ([-6.61, -chassis_diameter / 2 + 0.8, 3.5]) {
                cube ([13.22, 6.4, 7.48]);
            }
            translate ([-4.61, -chassis_diameter / 2 + 0.3, 3]) {
                cube ([9.22, 4.5, 5.98]);
            }
            translate ([-4.61, -chassis_diameter / 2 + 0.3, 3]) {
                cube ([0.65, 5.1, 5.98]);
            }
            translate ([3.96, -chassis_diameter / 2 + 0.3, 3]) {
                cube ([0.65, 5.1, 5.98]);
            }
            translate ([-7.11, -chassis_diameter / 2 + 4.8, 5.39]) {
                cube ([14.22, 3.5, 2.2]);
            }
        }
    }
}

module chassis_down (batteries_distance, chassis_diameter,
                     wheel_diameter) {
    color ([1, 1, 0, 1]) {
        difference () {
            union () {
                cylinder (h = 2, d = chassis_diameter);
                translate ([0, chassis_diameter / 2 - 17.5,
                            15 - wheel_diameter / 2]) {
                    translate ([-13.5, 3.85, 0]) {
                        cylinder (h = wheel_diameter / 2 - 14.5,
                                  d = 4);
                    }
                    translate ([13.5, 3.85, 0]) {
                        cylinder (h = wheel_diameter / 2 - 14.5,
                                  d = 4);
                    }
                }
            }
            translate ([-13.5, chassis_diameter / 2 - 13.65,
                        14.5 - wheel_diameter / 2]) {
                hole_for_screw_M2 (wheel_diameter / 2 - 10);
            }
            translate ([13.5, chassis_diameter / 2 - 13.65,
                        14.5 - wheel_diameter / 2]) {
                hole_for_screw_M2 (wheel_diameter / 2 - 10);
            }
            translate ([4.5, batteries_distance + 51.5, 1]) {
                cube ([9, 3, 1.5]);
            }
            translate ([-13.5, batteries_distance + 51.5, 1]) {
                cube ([9, 3, 1.5]);
            }
            translate ([0, batteries_distance, -0.5]) {
                hull () {
                    translate ([0, -5, 0]) {
                        cylinder (h = 3, d = 11);
                    }
                    translate ([-5.5, 0, 0]) {
                        cube ([11, 2, 3]);
                    }
                }
            }
            translate ([-17.5, batteries_distance - 0.5, -0.5]) {
                cube ([35, 53, 3]);
            }
            hole_for_batteries (batteries_distance);
            rotate ([0, 0, 45]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
            rotate ([0, 0, 135]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
            rotate ([0, 0, 241]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
            rotate ([0, 0, 299]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
        }
        translate ([0, chassis_diameter / 2 - 5, 0]) {
            support (wheel_diameter);
        }
        translate ([0, 5 - chassis_diameter / 2, 0]) {
            support (wheel_diameter);
        }
    }
}

module chassis_up (batteries_distance, chassis_diameter,
                   width_of_mouse) {
    color ([1, 1, 0, 1]) {
        difference () {
            translate ([0, 0, 2]) {
                cylinder (h = 2, d = chassis_diameter);
            }
            translate ([-13.5, chassis_diameter / 2 - 13.65,
                        14.5 - wheel_diameter / 2]) {
                hole_for_screw_M2 (wheel_diameter / 2 - 10);
            }
            translate ([13.5, chassis_diameter / 2 - 13.65,
                        14.5 - wheel_diameter / 2]) {
                hole_for_screw_M2 (wheel_diameter / 2 - 10);
            }
            translate ([-16.35, batteries_distance + 1.5, -0.5]) {
                cube ([32.7, 49, 5]);
            }
            translate ([0, batteries_distance - 5, 1.5]) {
                hole_for_screw_M3 (3);
            }
            hole_for_batteries (batteries_distance);
            rotate ([0, 0, 45]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
            rotate ([0, 0, 135]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
            rotate ([0, 0, 241]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
            rotate ([0, 0, 299]) {
                translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                    hole_for_screw_M3 (5);
                }
            }
        }
        translate ([width_of_mouse / 2 - 29.5, -5.4, 4]) {
            hub_for_motor ();
        }
        translate ([-width_of_mouse / 2 + 29.5, -5.4, 4]) {
            rotate ([0, 0, 180]) {
                hub_for_motor ();
            }
        }
        translate ([0, -chassis_diameter / 2 + 49, 0]) {
            hub_for_power_convertor ();
        }
        hub_for_switch (chassis_diameter);
        columns (height_of_columns, chassis_diameter);
    }
}

module support (wheel_diameter) {
    rotate ([180, 0, 0]) {
        cylinder (h = wheel_diameter / 2 - 13, d1 = 8, d2 = 5);
        translate ([0, 0, wheel_diameter / 2 - 13]) {
            sphere (d = 5);
        }
    }
}

module wicket (batteries_distance) {
    translate ([0, batteries_distance, 0]) {
        wicket_for_batteries ();
    }
}