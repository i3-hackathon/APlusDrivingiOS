//
//  BMWUsersViewController.m
//  APlusDriving
//
//  Created by Andy Archer on 1/11/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWUsersViewController.h"
#import "BMWDashViewController.h"
#import "BMWActivityViewController.h"
#import "UserCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>
#import "User.h"

@interface BMWUsersViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *usersTableView;
@property (strong, nonatomic) NSMutableArray * users;

@end

@implementation BMWUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self userQuery];
    self.users = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view from its nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    User * user = [self.users objectAtIndex:indexPath.row];
    
    UserCell * cell = [self.usersTableView dequeueReusableCellWithIdentifier:@"userCell"];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserCell" owner:nil options:nil];
        cell = (UserCell *)[nib objectAtIndex:0];
    }
    
    cell.name.text = user.name;
    cell.rank.text = user.rank;
    cell.score.text = [user.score description];
    
    [cell.profilePicture setImage:[UIImage imageNamed:@"andrew"]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(void)userQuery
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * path = @"http://aplusdriver.herokuapp.com/drivers";
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"what is the responseObject here %@", responseObject);
        self.users = [User parseArrayIntoUsers:responseObject];
        [self.usersTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"what is the error here %@", error);
    }];
}

- (IBAction)dashboard:(id)sender {
    
    BMWDashViewController * dashvc = [[BMWDashViewController alloc] init];
    [self presentViewController:dashvc animated:NO completion:nil];
    
}

- (IBAction)eventActivity:(id)sender {
    
    BMWActivityViewController * avc = [[BMWActivityViewController alloc] init];
    [self presentViewController:avc animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
