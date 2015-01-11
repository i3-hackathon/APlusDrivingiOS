//
//  User.m
//  APlusDriving
//
//  Created by Andy Archer on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "User.h"

@implementation User

+(NSMutableArray *)parseArrayIntoUsers:(NSArray *)userDicts {
    NSMutableArray * users = [[NSMutableArray alloc] init];
    
    for (NSDictionary * userDict in userDicts) {
        [users addObject:[self parseDictionaryIntoUser:userDict]];
    }
    
    return users;
    
}

+(User *)parseDictionaryIntoUser:(NSDictionary *)userDict {
    
    User * user = [[User alloc] init];
    user.name = userDict[@"driver_name"];
    user.rank = userDict[@"rank"];
    user.score = userDict[@"scores"][@"score"][@"zendrive_score"];
    user.fuelEfficiencyScore = userDict[@"scores"][@"score"][@"fuel_efficiency_score"];
    user.controlScore = userDict[@"scores"][@"score"][@"control_score"];
    user.cautiousScore = userDict[@"scores"][@"score"][@"cautious_score"];
    user.focusScore = userDict[@"scores"][@"score"][@"focused_score"];
    user.recommendation = userDict[@"recommendation"];
    
    return user;
}

@end
