//
//  User.h
//  APlusDriving
//
//  Created by Andy Archer on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * rank;
@property (strong, nonatomic) NSNumber * score;
@property (strong, nonatomic) NSNumber * fuelEfficiencyScore;
@property (strong, nonatomic) NSNumber * controlScore;
@property (strong, nonatomic) NSNumber * cautiousScore;
@property (strong, nonatomic) NSNumber * focusScore;
@property (strong, nonatomic) NSString * recommendation;


+(User *)parseDictionaryIntoUser:(NSDictionary *)userDict;
+(NSMutableArray *)parseArrayIntoUsers:(NSDictionary *)usersDict;

@end
