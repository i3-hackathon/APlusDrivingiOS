//
//  UserCell.h
//  APlusDriving
//
//  Created by Yash Varma on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property (weak, nonatomic) IBOutlet UILabel *score;

@end
