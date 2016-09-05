use <Holes.scad>;

$fn = 300;
batteries_distance = -32;
chassis_diameter = 92.5;
side = 10;
spacing = 2.5;
arduino_offset = [29, -25, 0];

first_floor (batteries_distance, chassis_diameter, side, spacing);

module columns_for_arduino (diameter, height) {
    translate ([-9.271, 0, 0]) {
        translate ([1.524, 1.524, 2.5]) {
            cylinder (h = height, d = diameter);

        }
        translate ([1.524, 42.1, 2.5]) {
            cylinder (h = height, d = diameter);

        }
        translate ([17.018, 1.524, 2.5]) {
            cylinder (h = height, d = diameter);

        }
        translate ([17.018, 42.1, 2.5]) {
            cylinder (h = height, d = diameter);

        }
    }
}

module columns_for_ir_reciever () {
    translate ([-30, 0, 0]) {
        translate ([5.1, 22.65, 2.5]) {
            cylinder (h = 3.5, d = 5);
        }
        translate ([-5.1, 22.65, 2.5]) {
            cylinder (h = 3.5, d = 5);
        }
    }
}

module hole_for_batteries (batteries_distance) {
    translate ([-16, batteries_distance, -0.5]) {
        cube ([32, 58.3, 4]);
    }
}

module hole_for_compass () {
    translate ([0, -chassis_diameter / 2 + 8.25, -0.5]) {
        hole_for_screw_M3 (4);
    }
}

module hole_for_ultrasonic_sensor () {
    translate ([0, 35.5, -0.5]) {
        hole_for_screw_M3 (4);
    }
}

module holes_for_arduino (height, offset) {
    ch = height + offset + 0.005;
    
    translate ([-9.271, 0, -offset]) {
        translate ([1.524, 1.524, 2.49]) {
            cylinder (h = ch, d = 2.2);
        }
        translate ([1.524, 42.1, 2.49]) {
            cylinder (h = ch, d = 2.2);
        }
        translate ([17.018, 1.524, 2.49]) {
            cylinder (h = ch, d = 2.2);
        }
        translate ([17.018, 42.1, 2.49]) {
            cylinder (h = ch, d = 2.2);
        }
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

module holes_for_ir_reciever () {
    translate ([5.1, 22.65, -0.5]) {
        hole_for_screw_M2 (8);
    }
    translate ([-5.1, 22.65, -0.5]) {
        hole_for_screw_M2 (8);
    }
}

module hub_for_breadboard () {
    difference () {
        translate ([-19, -23, 2.5]) {
            cube ([38, 46, 17.4]);
        }
        translate ([-16, -23.5, 2]) {
            cube ([32, 47, 15.2]);
        }
        difference () {
            translate ([18.6, 0, 0]) {
                rotate ([0, 90, 0]) {
                    translate ([-19.6, 3, -2.5]) {
                        mesh_for_breadboard (chassis_diameter,
                                             side, spacing);
                    }
                }
            }
            difference () {
                translate ([15.6, -23, 2.5]) {
                    cube ([6, 46, 17.9]);
                }
                translate ([15.1, -20, 2.5]) {
                    cube ([7, 40, 14.4]);
                }
            }
        }
        
        difference () {
            translate ([-17.5, 0, 0]) {
                rotate ([0, 90, 0]) {
                    translate ([-19.6, 3, -2.5]) {
                        mesh_for_breadboard (chassis_diameter,
                                             side, spacing);
                    }
                }
            }
            difference () {
                translate ([-19.6, -23, 2.5]) {
                    cube ([6, 46, 17.9]);
                }
                translate ([-19.1, -20, 2.5]) {
                    cube ([7, 40, 14.24]);
                }
            }
        }
        translate ([0, 0, 15.7]) {
            difference () {
                translate ([0, 3, 0]) {
                    for (i = [0: 10.75: 40]) {
                        translate ([-19, i - 23, 0]) {
                            cube ([38, 7.75, 5]);
                        }
                    }
                }
                difference () {
                    translate ([-19, -23, -0.5]) {
                        cube ([38, 46, 6]);
                    }
                    translate ([-16, -20, -1]) {
                        cube ([32, 40, 7]);
                    }
                }
            }
        }
    }
}

module hub_for_ultrasonic () {
    difference () {
        translate ([-6.5, 31.5, 2.5]) {
            cube ([13, 10, 3.5]);
        }
        translate ([-4.375, 31, 2]) {
            cube ([8.75, 8.75, 4.5]);
        }
    }
}

module first_floor (batteries_distance, chassis_diameter, side,
                    spacing) {
    color ([1, 1, 0, 1]) {
        difference () {
            cylinder (h = 3, d = chassis_diameter);
            mesh (chassis_diameter, side, spacing);
            holes_for_columns (chassis_diameter);
            hole_for_batteries (batteries_distance);
            translate (arduino_offset) {
                holes_for_arduino(4, 3);
            }
            hole_for_ultrasonic_sensor ();
            translate ([-30, 0, 0]) {
                holes_for_ir_reciever ();
            }
            hole_for_compass ();
        }
        translate (arduino_offset) {
            difference () {
                columns_for_arduino (4, 2.5);
                holes_for_arduino(4, 3);
            }
        }
        difference () {
            columns_for_ir_reciever ();
            translate ([-30, 0, 0]) {
                holes_for_ir_reciever ();
            }
        }
        translate ([0, -3, 0]) {
            hub_for_breadboard ();
        }
        hub_for_ultrasonic ();
    }
}

module mesh (chassis_diameter, side, spacing) {
    
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
//protect of arduino columns
        translate (arduino_offset - [0, 0, 3]) { 
            columns_for_arduino (10, 3.5);
        }
//protect_of_batteries
        translate ([-19.6, batteries_distance - 4, -0.5]) {
            cube ([39.2, 65.5, 4]);
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
//protect_for_compass
        translate ([0, -chassis_diameter / 2 + 8.25, -0.5]) {
            cylinder (h = 5, d = 9);
        }
//protect_of_frame
        difference () {
            translate ([0, 0, -0.5]) {
                cylinder (h = 5, d = chassis_diameter + 1);
            }
            translate ([0, 0, -1]) {
                cylinder (h = 5, d = chassis_diameter - 10);
            }
        }
//protect_of_ir_reciever
        translate ([-30, 0, 0]) {
            translate ([5.1, 22.65, -0.5]) {
                cylinder (h = 5, d = 8);
            }
            translate ([-5.1, 22.65, -0.5]) {
                cylinder (h = 5, d = 8);
            }
        }
//protect_of_ultrasonic_sensor
        translate ([-6.5, 31.5, -0.5]) {
            cube ([13, 10, 5]);
        }
    }
}

module mesh_for_breadboard (chassis_diameter, side, spacing) {
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
    }
}