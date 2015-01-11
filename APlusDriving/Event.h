//
//  Event.h
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString * eventType;
@property (strong, nonatomic) NSString * date;
@property (strong, nonatomic) NSString * latitude;
@property (strong, nonatomic) NSString * longitude;
@property (strong, nonatomic) NSString * odomoter;
@property (strong, nonatomic) NSString * charge;
@property (strong, nonatomic) NSString * fuel;
@property (strong, nonatomic) NSString * temperature;
@property (strong, nonatomic) NSString * limitExceededBy;
@property BOOL odd;

+(NSMutableArray *)serializeEventsWithArray:(NSArray *)events;

@end
