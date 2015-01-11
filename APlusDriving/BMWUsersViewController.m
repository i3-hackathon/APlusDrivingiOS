//
//  BMWUsersViewController.m
//  APlusDriving
//
//  Created by Andy Archer on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWUsersViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "User.h"

@interface BMWUsersViewController ()

@end

@implementation BMWUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)userQuery
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * path = @"http://aplusdriver.herokuapp.com/drivers";
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"what is the responseObject here %@", responseObject);
        
        NSMutableArray * users = [User parseArrayIntoUsers:responseObject];
        // Set labels up [self configureLabelsWithUsers:users];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"what is the error here %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
