//
//  CarSpeedingCell.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "CarSpeedingCell.h"

@implementation CarSpeedingCell

- (void)awakeFromNib {
    // Initialization code
    self.dateLabel.numberOfLines = 0;
    self.dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.0];
    
    self.detectedLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    self.speedUpdateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    self.speedUpdateLabel.numberOfLines = 0;
    self.speedUpdateLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
