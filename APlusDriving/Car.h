//
//  Car.h
//  APlusDriving
//
//  Created by Yash Varma on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (strong, nonatomic) NSString * temperature;
@property (strong, nonatomic) NSNumber * odometer;
@property (strong, nonatomic) NSNumber * battery;
@property (strong, nonatomic) NSNumber * fuelLevel;
@property (strong, nonatomic) NSNumber * lastLatitude;
@property (strong, nonatomic) NSNumber * lastLongitute;
@property BOOL engine;
@property BOOL lights;
@property BOOL doors;
@property BOOL windows;

+(Car *)parseDictionaryIntoCar:(NSDictionary *)carDict;

@end
