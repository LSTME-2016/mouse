use <Batteries_housing.scad>;
use <Holes.scad>;
use <Chassis.scad>;
use <Light_sensor.scad>;
use <Motor.scad>;
use <Power_convertor.scad>;
use <Switch.scad>;
use <Wheel.scad>;

$fn = 300;
batteries_distance = -22;
chassis_diameter = 98;
wheel_diameter = 31;
width_of_mouse = 102.5;

convertor ();
//ground ();
housing_for_batteries ();
light_sensors ();
motors ();
chassis ();
switchgear ();

module convertor () {
    translate ([-13.1, -chassis_diameter / 2 + 14, -1]) {
        rotate ([0, 0, 270]) {
            power_convertor ();
        }
    }
}

module ground () {
    color ([0, 1, 0, 1]) {
        translate ([0, 0, -wheel_diameter / 2 - 1]) {
            cylinder (h = 1, d = 200);
        }
    }
}

module housing_for_batteries () {
    translate ([0, batteries_distance, 6]) {
        rotate ([0, 180, 0]) {
            batteries_housing ();
        }
    }
}

module chassis () {
    translate ([0, 0, -10]) {
        chassis_up (batteries_distance, chassis_diameter,
                    width_of_mouse);
        chassis_down (batteries_distance, chassis_diameter,
                      wheel_diameter);
        wicket (batteries_distance);
    }
}

module light_sensors () {
    translate ([0, chassis_diameter / 2 - 17.5,
                -wheel_diameter / 2 + 4.01]) {
        light_sensor ();
    }
}

module motors () {
    translate ([-width_of_mouse / 2 + 29.5, 0, 0]) {
        rotate ([180, 90, 0]) {
            FEETECH_FS90R_Micro_Servo ();
            translate ([0, 0, 29.4]) {
                mounting_hub ();
                translate ([0, 0, 0.1]) {
                    wheel (wheel_diameter);
                }
            }
        }
    }
    translate ([width_of_mouse / 2 - 29.5, 0, 0]) {
        rotate ([180, -90, 0]) {
            FEETECH_FS90R_Micro_Servo ();
            translate ([0, 0, 29.4]) {
                mounting_hub ();
                translate ([0, 0, 0.1]) {
                    wheel (wheel_diameter);
                }
            }
        }
    }
}

module switchgear () {
    rotate ([0, 0, 315]) {
        translate ([4.36, -chassis_diameter / 2 + 5, -3.5]) {
            rotate ([0, 270, 90]) {
                switch ();
            }
        }
    }
}