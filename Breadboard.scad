$fn = 300;

breadboard ();

module breadboard () {
    color ([0.8, 0, 0, 1]) {
        difference () {
            translate ([-17.3, 0, 0]) {
                cube ([34.6, 45.75, 8.3]);
            }
            translate ([-1.6, 7.28, 5.1]) {
                cube ([3.2, 31.2, 3.7]);
            }
            translate ([8.65, 2, 0]) {
                holes_for_pins ();
            }
            translate ([-8.65, 2, 0]) {
                holes_for_pins ();
            }
        }
    }
}

module holes_for_pins () {
    for (i = [2.54 * -2: 2.54: 2.54 * 2]) {
        for (j = [0: 2.54: 2.54 * 16]) {
            translate ([i - 0.57, j, 2.3]) {
                cube ([1.14, 1.14, 6.5]);
            }
        }
    }
}