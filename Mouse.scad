use <Arduino.scad>;
use <Batteries_housing.scad>;
use <Breadboard.scad>;
use <Bluetooth.scad>;
use <Capaciter.scad>;
use <Column.scad>;
use <First_floor.scad>;
use <Holes.scad>;
use <Hub_for_ultrasonic_sensor.scad>;
use <Chassis.scad>;
use <IR_receiver.scad>;
use <Light_sensor.scad>;
use <Motor.scad>;
use <Ultrasonic_sensor.scad>;
use <Switch_KCD11.scad>;
use <Wheel.scad>;
use <Wicket_for_batteries.scad>;

$fn = 300;
batteries_distance = -32;
chassis_diameter = 92.5;
side = 10;
spacing = 2.5;
wheel_diameter = 31;
width_of_mouse = 97;

arduino ();
bluetooth_sensor ();
board ();
capaciter (width_of_mouse);
compass ();
floor_1 ();
//ground ();
housing_for_batteries ();
chassis_complete ();
light_sensors ();
motors ();
receiver ();
switchgear ();
ultrasonic_sensor ();

module arduino () {
    translate ([29, -25, 11.8]) {
        arduino_nano ();
    }
}

module board () {
    translate ([0, -26.1, 25.8]) {
        breadboard ();
    }
}

module bluetooth_sensor () {
    translate ([2.54 * 2 + 0.25, -2.54 * 7 + 0.5, 34.5]) {
        rotate ([90, 0, 90]) {
            bluetooth ();
        }
    }
}

module capaciter (width_of_mouse) {
    translate ([-width_of_mouse / 2 + 24.25, 12, -0.4]) {
        rotate ([270, 0, 0]) {
            Hitano_1000uF ();
        }
    }
}

module compass () {
    translate ([0, -chassis_diameter / 2 + 8.25, 9.8]) {
        column (40, 0.2, 0.2, 0.2);
    }
}

module floor_1 () {
    translate ([0, 0, 6.8]) {
        first_floor (batteries_distance, chassis_diameter, side,
                    spacing);
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
    translate ([0, batteries_distance, -6.4]) {
        batteries_housing ();
    }
}

module chassis_complete () {
    translate ([0, 0, -9]) {
        chassis (batteries_distance, chassis_diameter,
                 wheel_diameter, width_of_mouse, side, spacing);
        translate ([0, batteries_distance, 0]) {
            wicket_for_batteries (batteries_distance, side,
                                  spacing);
        }
    }
}

module light_sensors () {
    translate ([0, chassis_diameter / 2 - 17.5,
                -wheel_diameter / 2 + 4.01]) {
        light_sensor ();
    }
}

module motors () {
    translate ([-width_of_mouse / 2 + 29.25, 0, 0]) {
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
    translate ([width_of_mouse / 2 - 29.25, 0, 0]) {
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

module receiver () {
    translate ([-30, 6, 11.5]) {
        ir_receiver ();
    }
}

module switchgear () {
    rotate ([0, 0, 130]) {
        translate ([-6, -chassis_diameter / 2 + 13.5, -6 + 1.6]) {
            rotate ([90, 0, 0]) {
                switch_kcd11 ();
            }
        }
    }
}

module ultrasonic_sensor () {
    translate ([0, 27.8, 36.2]) {
        rotate ([0, 180, 0]) {
            HC_SR04 ();
        }
    }
    translate ([0, 29.5, 12.7]) {
        hub_for_ultrasonic_sensor ();
    }
}