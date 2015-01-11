//
//  BMWActivityViewController.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWActivityViewController.h"
#import "BMWDashViewController.h"
#import "CarStartedCell.h"
#import "CarStoppedCell.h"
#import "CarBatteryCell.h"
#import "CarSpeedingCell.h"
#import "Event.h"
#import <AFNetworking.h>

@interface BMWActivityViewController () <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *activityTableView;
@property (strong, nonatomic) NSMutableArray * carEvents;

@end

@implementation BMWActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
    // Do any additional setup after loading the view from its nib.
}

-(void)configuration
{
    self.carEvents = [[NSMutableArray alloc] init];
    [self eventQuery];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Event * event = [self.carEvents objectAtIndex:indexPath.row];
    
    if ([event.eventType isEqualToString:@"started"]) {
        
        CarStartedCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carStarted"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarStartedCell" owner:nil options:nil];
            cell = (CarStartedCell *)[nib objectAtIndex:0];
        }
        
    } else if ([event.eventType isEqualToString:@"stopped"]) {
        
        CarStoppedCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carStopped"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarStoppedCell" owner:nil options:nil];
            cell = (CarStoppedCell *)[nib objectAtIndex:0];
        }
        
    } else if ([event.eventType isEqualToString:@"battery"]) {
        
        CarBatteryCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carBattery"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarBatteryCell" owner:nil options:nil];
            cell = (CarBatteryCell *)[nib objectAtIndex:0];
        }
        
    } else if ([event.eventType isEqualToString:@"speeding"]) {
        
        CarSpeedingCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carSpeeding"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarSpeedingCell" owner:nil options:nil];
            cell = (CarSpeedingCell *)[nib objectAtIndex:0];
        }
    } else {
        
        return nil;
    }
    
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.carEvents.count;
}


-(void)eventQuery
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * path = [NSString stringWithFormat:@"https://aplusdriver.herokuapp.com/vehicles/WBY1Z4C58EV273611/events"];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.carEvents = [Event serializeEventsWithArray:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:[error localizedDescription] delegate:self cancelButtonTitle:@"Retry" otherButtonTitles:@"Ok", nil];
        
        [alertView show];
    }];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self eventQuery];
    }
}

- (IBAction)dashView:(id)sender {
    
    BMWDashViewController * statsVC = [[BMWDashViewController alloc] init];
    [self presentViewController:statsVC animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
