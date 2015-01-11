//
//  Car.m
//  APlusDriving
//
//  Created by Yash Varma on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "Car.h"

@implementation Car

+(Car *)parseDictionaryIntoCar:(NSDictionary *)carDict {
    
    Car * car = [[Car alloc] init];
    car.odometer = carDict[@"LastOdometer"];
    car.battery = carDict[@"LastBatteryLevel"];
    car.fuelLevel = carDict[@"FuelLevel"];
    car.lastLatitude = carDict[@"LastLocation"][@"Lat"];
    car.lastLongitute = carDict[@"LastLocation"][@"Lng"];
    car.engine = carDict[@"IgnitionOn"];
    car.lights = carDict[@"LightsOn"];
    car.doors = carDict[@"doors_locked"];
    car.windows = carDict[@"windows_open"];
    car.temperature = @"65";
    
    return car;
}


@end
