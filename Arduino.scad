// Arduino nano, version 3 (atmega328)

$fn = 300;

arduino_nano ();

module arduino_nano () {
    translate ([-9.271, 0, 0]) {
        color ([0.1, 0.1, 0.4, 1]) {    
            difference () {
                cube ([18.542, 43.18, 1]);
                translate ([1.524, 1.524, -0.5]) {
                    cylinder (h = 2, d = 1.778);
                }
                translate ([1.524, 41.594, -0.5]) {
                    cylinder (h = 2, d = 1.778);
                }
                translate ([17.018, 1.524, -0.5]) {
                    cylinder (h = 2, d = 1.778);
                }
                translate ([17.018, 41.594, -0.5]) {
                    cylinder (h = 2, d = 1.778);
                }
                for (i = [0: 2.54: 35.56]) {
                    translate ([1.651, i + 3.748, -0.5]) {
                        cylinder (h = 2, d = 1.524);
                    }
                    translate ([16.891, i + 3.748, -0.5]) {
                        cylinder (h = 2, d = 1.524);
                    }
                }
            }
        }
        headers_arduino_nano ();
    }
    color ([0.8, 0.8, 0.8, 1]) {
        translate ([-4, -1, 1]) {
            cube ([8, 8, 3]);
        }
    }
}

module headers_arduino_nano () {
    
    width_of_header = 1.7;
    
    for (i = [0: 2.54: 35.56]) {
        color ([0.8, 0.8, 0.8, 1]) {
            translate ([1.651, i + 3.748, -8.5]) {
                rotate ([0, 0, 45]) {
                    cylinder (h = 10, d = 1.5, $fn = 4);
                }
            }
            translate ([16.891, i + 3.748, -8.5]) {
                rotate ([0, 0, 45]) {
                    cylinder (h = 10, d = 1.5, $fn = 4);
                }
            }
        }
        color ([0.1, 0.1, 0.1, 1]) {
            translate ([1.651, i + 3.748, -2]) {
                rotate ([0, 0, 45]) {
                    cylinder (h = 2, d = 2.7, $fn = 4);
                }
            }
            translate ([16.891, i + 3.748, -2]) {
                rotate ([0, 0, 45]) {
                    cylinder (h = 2, d = 2.7, $fn = 4);
                }
            }
        }
    }
    color ([0.1, 0.1, 0.1, 1]) {
        translate ([1.651 - width_of_header / 2, 3.748, -1.8]) {
            cube ([width_of_header, 35.56, 1.8]);
        }
        translate ([16.891 - width_of_header / 2, 3.748, -1.8]) {
            cube ([width_of_header, 35.56, 1.8]);
        }
    }
}