$fn = 200;

column (10, 0.8, 0.8, 0.8);

module column (column_height, r, g, b) {  
    color ([r, g, b, 1]) {
        difference () {
            cylinder (h = column_height, d = 4 * 2.5 / sqrt(3),
                      $fn = 6);
            translate ([0, 0, -0.5]) {
                cylinder (h = column_height + 1, d = 3);
            }
        }
    }
}