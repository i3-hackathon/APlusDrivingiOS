//
//  Event.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "Event.h"

@implementation Event

+(NSMutableArray *)serializeEventsWithArray:(NSArray *)events
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    for (NSDictionary * eventDict in events) {
        Event * event = [[Event alloc] init];
        event.eventType = eventDict[@"event_type"];
        event.latitude = eventDict[@"lat"];
        event.longitude = eventDict[@"long"];
        event.odomoter = eventDict[@"odometer"];
        event.temperature = eventDict[@"temp_inside"];
        event.fuel = eventDict[@"fuel"];
        event.date = eventDict[@"formatted_time"];
        if ([eventDict[@"charge"] isEqual:[NSNull null]]) {
            event.charge = @"20%";
        } else {
            event.charge = eventDict[@"charge"];
        }
        [array addObject:event];
    }
    
    return array;
}

@end
