use <Holes.scad>;
use <Mouse_support.scad>;
use <Switch_kcd11.scad>;
use <Wicket_for_batteries.scad>;

$fn = 300;
batteries_distance = -32;
height_of_columns = 13.3;
chassis_diameter = 92.5;
side = 10;
spacing = 2.5;
wheel_diameter = 31;
width_of_mouse = 97;

chassis (batteries_distance, chassis_diameter, wheel_diameter,
              width_of_mouse, side, spacing);
//wicket (batteries_distance);

module columns (height_of_columns, chassis_diameter) {
    rotate ([0, 0, 61]) {
        translate ([chassis_diameter / 2 - 6, 0, 2.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
    rotate ([0, 0, 119]) {
        translate ([chassis_diameter / 2 - 6, 0, 2.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
    rotate ([0, 0, 299]) {
        translate ([chassis_diameter / 2 - 6, 0, 2.5]) {
            difference () {
                cylinder (h = height_of_columns, d = 7);
                translate ([0, 0, -0.5]) {
                    hole_for_screw_M3 (height_of_columns + 1);
                }
            }
        }
    }
    rotate ([0, 0, 241]) {
        translate ([chassis_diameter / 2 - 6, 0, 2.5]) {
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
    translate ([-16.15, batteries_distance - 0.5, -0.5]) {
        cube ([32.3, 58.5, 5]);
    }
    translate ([0, batteries_distance - 7.5, 1.5]) {
        hole_for_screw_M3 (4);
    }
    translate ([-2.5, batteries_distance - 4.5, -0.5]) {
        cube ([5, 4.5, 6]);
    }
    translate ([7.5, batteries_distance + 57, 0.8]) {
        cube ([8.5, 5, 3]);
    }
    translate ([-16, batteries_distance + 57, 0.8]) {
        cube ([8.5, 5, 3]);
    }
    translate ([7.5, batteries_distance + 57, 0.8]) {
        cube ([10, 5, 1.7]);
    }
    translate ([-17.5, batteries_distance + 57, 0.8]) {
        cube ([10, 5, 1.7]);
    }
}

module hole_for_light_sensor (chassis_diameter, wheel_diameter) {
    translate ([-13.5, chassis_diameter / 2 - 13.65,
                14.5 - wheel_diameter / 2]) {
        hole_for_screw_M2 (wheel_diameter / 2 - 10);
    }
    translate ([13.5, chassis_diameter / 2 - 13.65,
                14.5 - wheel_diameter / 2]) {
        hole_for_screw_M2 (wheel_diameter / 2 - 10);
    }
    translate ([-6.8, chassis_diameter / 2 - 18, -0.5]) {
        cube ([13.6, 3.5, 5]);
    }
}

module holes_for_columns (chassis_diameter) {
    rotate ([0, 0, 61]) {
        translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
            hole_for_screw_M3 (5);
        }
    }
    rotate ([0, 0, 119]) {
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

module holes_for_support () {
    translate ([-2.3, -2.3, -0.5]) {
        cube ([4.6, 4.6, 5]);
    }
}

module hub_for_capaciter (width_of_mouse) {
    translate ([-width_of_mouse / 2 + 24.25, 12, 2.5]) {
        difference () {
            union () {
                translate ([-4, 0.5, 0]) {
                    cube ([8, 6, 3]);
                }
                translate ([0, 0.5, 6.1]) {
                    rotate ([270, 0, 0]) {
                        cylinder (h = 6, d = 14);
                    }
                }
            }
            translate ([-8, 0.1, 9]) {
                cube ([15, 9, 7]);
            }
            difference () {
                translate ([0, 0.1, 6.5]) {
                    rotate ([270, 0, 0]) {
                        cylinder (h = 9, d = 10.5);
                    }
                }
                translate ([0, 3.8, 6.5]) {
                    rotate ([270, 0, 0]) {
                        rotate_extrude () {
                            translate ([7.5, 0]) {
                                circle (d = 5);
                            }
                        }
                    }
                }
            }
        }
    }
}

module hub_for_motor () {
    difference () {
        translate ([-2, -13.65, -0.5]) {
            cube ([4, 27.3, 4.5]);
        }
        translate ([-3, -9.4, -1]) {
            cube ([5, 18.8, 5.5]);
        }
        translate ([0, -11.65, -1]) {
            cube ([5, 23.3, 5.5]);
        }
    }
    difference () {
        translate ([13.5, -18.6, -0.5]) {
            cube ([6.9, 37.2, 11.5]);
        }
        translate ([12.5, -11.75, -1]) {
            cube ([8.4, 23.5, 13.5]);
        }
        translate ([15.65, -16.6, -1]) {
            cube ([3, 33.2, 13.5]);
        }
        translate ([12.5, -13.75, 6.7]) {
            rotate ([0, 90, 0]) {
                hole_for_screw_M2 (8.4);
            }
        }
        translate ([12.5, 13.75, 6.7]) {
            rotate ([0, 90, 0]) {
                hole_for_screw_M2 (8.4);
            }
        }
    }
}

module hub_for_switch () {
    rotate ([0, 0, 130]) {
        translate ([-7.5, -chassis_diameter / 2 + 5, 2.5]) {
            difference () {
                translate ([-1, 0, 0]) {
                    cube ([17, 8, 12.5]);
                }
                translate ([0.5, 0.5, 1.7]) {
                    cube ([14, 9, 9.1]);
                }
                translate ([0.85, -0.5, 1.7]) {
                    cube ([13.3, 9, 8.6]);
                }
                translate ([0.85, -0.5, 1.45]) {
                    cube ([0.7, 9, 9.1]);
                }
                translate ([13.45, -0.5, 1.45]) {
                    cube ([0.7, 9, 9.1]);
                }
            }
        }
    }
}

module chassis (batteries_distance, chassis_diameter,
                     wheel_diameter, width_of_mouse, side,
                     spacing) {
    color ([1, 1, 0, 1]) {
        difference () {
            union () {
                cylinder (h = 3, d = chassis_diameter);
                /*translate ([0, chassis_diameter / 2 - 17.5,
                            15 - wheel_diameter / 2]) {
                    translate ([-13.5, 3.85, 0]) {
                        cylinder (h = wheel_diameter / 2 - 14.5,
                                  d = 4);
                    }
                    translate ([13.5, 3.85, 0]) {
                        cylinder (h = wheel_diameter / 2 - 14.5,
                                  d = 4);
                    }
                }*/
                translate ([-5, batteries_distance - 11, 2.5]) {
                    cube ([10, 11, 1.5]);
                }
            }
            translate ([0, chassis_diameter / 2 - 5, 0]) {
                holes_for_support ();
            }
            rotate ([0, 0, 14]) {
                translate ([0, 5 - chassis_diameter / 2, 0]) {
                    holes_for_support ();
                }
            }
            rotate ([0, 0, 346]) {
                translate ([0, 5 - chassis_diameter / 2, 0]) {
                    holes_for_support ();
                }
            }
            hole_for_light_sensor (chassis_diameter,
                                   wheel_diameter);
            translate ([0, batteries_distance, -0.5]) {
                hull () {
                    translate ([0, -7.5, 0]) {
                        cylinder (h = 3, d = 11);
                    }
                    translate ([-5.5, 0, 0]) {
                        cube ([11, 2, 3]);
                    }
                }
            }
            translate ([-17.5, batteries_distance - 2, -0.5]) {
                cube ([35, 61.5, 3]);
            }
            hole_for_batteries (batteries_distance);
            holes_for_columns (chassis_diameter);
            mesh (batteries_distance, chassis_diameter,
                  wheel_diameter, width_of_mouse, side, spacing);
        }
        translate ([width_of_mouse / 2 - 29.5, -5.4, 3]) {
            hub_for_motor ();
        }
        translate ([-width_of_mouse / 2 + 29.5, -5.4, 3]) {
            rotate ([0, 0, 180]) {
                hub_for_motor ();
            }
        }
        translate ([0, chassis_diameter / 2 - 5, 0]) {
            support (wheel_diameter);
        }
        rotate ([0, 0, 14]) {
            translate ([0, 5 - chassis_diameter / 2, 0]) {
                support (wheel_diameter);
            }
        }
        rotate ([0, 0, 346]) {
            translate ([0, 5 - chassis_diameter / 2, 0]) {
                support (wheel_diameter);
            }
        }
        columns (height_of_columns, chassis_diameter);
        hub_for_capaciter (width_of_mouse);
        hub_for_switch ();
    }
}

module mesh (batteries_distance, chassis_diameter, wheel_diameter,
             width_of_mouse, side, spacing) {
                 
    n = ceil((chassis_diameter / 2 - side / 2 - spacing) / 
             (side + spacing));
    shift = side / 2 + (side + spacing) * n;                 
    
    difference () {
        rotate ([0, 0, 45]) {
            translate ([-shift, -shift, -0.5]) {
                for (i = [0: 1: n * 2]) {
                    for (j = [0: 1: n * 2]) {
                        translate ([i * (side + spacing),
                                    j * (side + spacing), 0]) {
                            cube ([side, side, 5]);
                        }
                    }
                }
            }
        }
//protect_of_chassis
        difference () {
            translate ([0, 0, -0.5]) {
                cylinder (h = 5, d = chassis_diameter + 1);
            }
            translate ([0, 0, -1]) {
                cylinder (h = 6, d = chassis_diameter - 10);
            }
        }
//protect_of_batteries
        translate ([-20.15, batteries_distance - 4.5, -0.5]) {
            cube ([40.3, 66.5, 5]);
        }
        translate ([0, batteries_distance - 4.5, -0.5]) {
            cylinder (h = 5, d = 16);
        }
//protect_of_support
        translate ([0, chassis_diameter / 2 - 5, -0.5]) {
            cylinder (h = 5, d = 9);
        }
        rotate ([0, 0, 14]) {
            translate ([0, -chassis_diameter / 2 + 5, -0.5]) {
                cylinder (h = 5, d = 9);
            }
        }
        rotate ([0, 0, 346]) {
            translate ([0, -chassis_diameter / 2 + 5, -0.5]) {
                cylinder (h = 5, d = 9);
            }
        }
//protect_of_columns
        rotate ([0, 0, 61]) {
            translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                cylinder (h = 5, d = 10);
            }
        }
        rotate ([0, 0, 119]) {
            translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                cylinder (h = 5, d = 10);
            }
        }
        rotate ([0, 0, 241]) {
            translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                cylinder (h = 5, d = 10);
            }
        }
        rotate ([0, 0, 299]) {
            translate ([chassis_diameter / 2 - 6, 0, -0.5]) {
                cylinder (h = 5, d = 10);
            }
        }
//protect_for_light_sensor
        translate ([-13.5, chassis_diameter / 2 - 13.65, -0.5]) {
            cylinder (h = 5, d = 10);
        }
        translate ([13.5, chassis_diameter / 2 - 13.65, -0.5]) {
            cylinder (h = 5, d = 10);
        }
        translate ([-9.8, chassis_diameter / 2 - 21, -0.5]) {
            cube ([19.6, 9.5, 5]);
        }
//protect_for_motors
        translate ([width_of_mouse / 2 - 29.5, -5.4, 0]) {
            difference () {
                translate ([-5, -16.4, -0.5]) {
                    cube ([9, 32.8, 4.5]);
                }
                translate ([-5.5, -7.4, -1]) {
                    cube ([10, 14.8, 6]);
                }
            }
            difference () {
                translate ([11.5, -20.1, -0.5]) {
                    cube ([12.4, 41.2, 5]);
                }
                translate ([11, -9.4, -0.5]) {
                    cube ([13.4, 18.8, 5]);
                }
            }
        }
        translate ([-width_of_mouse / 2 + 29.5, -5.4, 0]) {
            rotate ([0, 0, 180]) {
                difference () {
                    translate ([-5, -16.4, -0.5]) {
                        cube ([9, 32.8, 4.5]);
                    }
                    translate ([-5.5, -7.4, -1]) {
                        cube ([10, 14.8, 6]);
                    }
                }
                difference () {
                    translate ([11.5, -20.1, -0.5]) {
                        cube ([12.4, 41.2, 5]);
                    }
                    translate ([11, -9.4, -0.5]) {
                        cube ([13.4, 18.8, 5]);
                    }
                }
            }
        }
//protect_for_switch
        rotate ([0, 0, 130]) {
            translate ([-9.11, -chassis_diameter / 2 + 2.3, -0.5]) {
                cube ([18.22, 11.4, 5]);
            }
        }
//protect_capaciter
        translate ([-width_of_mouse / 2 + 24.25, 12, -0.5]) {
            translate ([-6.5, -2, 0]) {
                cube ([13, 11, 5]);
            }
        }
    }
}

module support (wheel_diameter) {
    translate ([0, 0, 3]) {
        rotate ([180, 0, 0]) {
            //mouse_support (wheel_diameter);
        }
    }
}

module wicket (batteries_distance) {
    translate ([0, batteries_distance, 0]) {
        wicket_for_batteries (batteries_distance, side, spacing);
    }
}