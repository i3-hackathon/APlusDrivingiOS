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
    self.dateLabel.font = [UIFont fontWithName:@"Open-Sans" size:10.0];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
