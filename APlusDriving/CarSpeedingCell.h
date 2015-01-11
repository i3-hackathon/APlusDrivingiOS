//
//  CarSpeedingCell.h
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarSpeedingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *detectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedUpdateLabel;

@end
