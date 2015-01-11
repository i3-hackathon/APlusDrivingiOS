//
//  UserCell.m
//  APlusDriving
//
//  Created by Yash Varma on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

- (void)awakeFromNib {
   
    self.name.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    self.rank.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.0f];
    self.score.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
    
    self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2;
    self.profilePicture.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
