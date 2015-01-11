//
//  CarBatteryCell.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "CarBatteryCell.h"

@implementation CarBatteryCell

- (void)awakeFromNib {
    
    // Initialization code
    self.dateLabel.numberOfLines = 0;
    self.dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.0];
    
    self.batteryNotificationLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0];
    self.batteryNotificationLabel.numberOfLines = 0;
    self.batteryNotificationLabel.lineBreakMode = NSLineBreakByWordWrapping;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
