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
@property (strong, nonatomic) UITableView * someTableView;

@end

@implementation BMWActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
    
    // [UIFont fontWithName:@"HelveticaNeue-Light" size:32.0f];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)configuration
{
    CGRect frame = CGRectMake(0, 50, 320, 458);
    self.someTableView = [[UITableView alloc] initWithFrame:frame];
//    [self.view addSubview:self.someTableView];
    self.carEvents = [[NSMutableArray alloc] init];
    self.activityTableView.delegate = self;
    self.activityTableView.dataSource = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.activityTableView addSubview:refreshControl];
    [self eventQuery];
}

-(void)refresh:(UIRefreshControl *)refreshControl
{
    [self eventQuery];
    [refreshControl endRefreshing];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Event * event = [self.carEvents objectAtIndex:indexPath.row];
    
    if (indexPath.row % 2 == 1) {
        event.odd = YES;
    }
    
    if ([event.eventType isEqualToString:@"carOn"]) {
        
        CarStartedCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carStarted"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarStartedCell" owner:nil options:nil];
            cell = (CarStartedCell *)[nib objectAtIndex:0];
        }
        
        if (event.odd) {
            cell.layer.borderColor = [UIColor colorWithRed:183.0f/255.0f green:180.0f/255.0f blue:184.0f/255.0f alpha:1].CGColor;
            cell.layer.borderWidth = 1.0f;
        }
        
        cell.dateLabel.text = event.date;
        cell.turnedOnLabel.text = @"BMW i3 is turned ON";
        
        return cell;

        
    } else if ([event.eventType isEqualToString:@"carOff"]) {
        
        CarStoppedCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carStopped"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarStoppedCell" owner:nil options:nil];
            cell = (CarStoppedCell *)[nib objectAtIndex:0];
        }
        
        if (event.odd) {
            cell.layer.borderColor = [UIColor colorWithRed:183.0f/255.0f green:180.0f/255.0f blue:184.0f/255.0f alpha:1].CGColor;
            cell.layer.borderWidth = 1.0f;
        }
        
        cell.dateLabel.text = event.date;
        cell.turnedOffLabel.text = @"BMW i3 is turned OFF";
        cell.tripTimeLabel.text = @"Total Trip Time: 17 minutes";
        cell.distanceTravaledLabel.text = @"Total Distance traveled: 5 miles";
        
        float latF = [event.latitude floatValue];
        float lngF = [event.longitude floatValue];
        
        NSNumber * latNum = [NSNumber numberWithFloat:latF];
        NSNumber * longNum = [NSNumber numberWithFloat:lngF];
        double lat = [latNum doubleValue];
        double lng = [longNum doubleValue];
        
        CLLocation * lastLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
        [cell.mapView addAnnotation:lastLocation];
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (lastLocation.coordinate, 100, 100);
        [cell.mapView setRegion:region animated:NO];
        
        return cell;

        
    } else if ([event.eventType isEqualToString:@"BatteryCharging"]) {
        
        CarBatteryCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carBattery"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarBatteryCell" owner:nil options:nil];
            cell = (CarBatteryCell *)[nib objectAtIndex:0];
        }
        
        if (event.odd) {
            cell.layer.borderColor = [UIColor colorWithRed:183.0f/255.0f green:180.0f/255.0f blue:184.0f/255.0f alpha:1].CGColor;
            cell.layer.borderWidth = 1.0f;
        }
        
        cell.dateLabel.text = event.date;
        cell.batteryNotificationLabel.text = [NSString stringWithFormat:@"Charge is low at %@, nearest charging station is...", event.charge];
        
        return cell;
        
    } else if ([event.eventType isEqualToString:@"ExperienceControl"]) {
        
        CarSpeedingCell * cell = [self.activityTableView dequeueReusableCellWithIdentifier:@"carSpeeding"];
        
        if (!cell) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CarSpeedingCell" owner:nil options:nil];
            cell = (CarSpeedingCell *)[nib objectAtIndex:0];
        }
        
        if (event.odd) {
            cell.layer.borderColor = [UIColor colorWithRed:183.0f/255.0f green:180.0f/255.0f blue:184.0f/255.0f alpha:1].CGColor;
            cell.layer.borderWidth = 1.0f;
        }
        
        cell.dateLabel.text = event.date;
        cell.detectedLabel.text = @"Speed Limit Detected";
        cell.speedUpdateLabel.text = [NSString stringWithFormat:@"Driver is driving over %@ mph over the speed limit", event.limitExceededBy];
        
        return cell;

    } else {
        
        return nil;
    }
    
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.carEvents.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Event * event = [self.carEvents objectAtIndex:indexPath.row];
    
    if ([event.eventType isEqualToString:@"carOn"] || [event.eventType isEqualToString:@"ExperienceControl"]) {
        return 90.0f;
    } else if ([event.eventType isEqualToString:@"BatteryCharging"]) {
        return 70.0f;
    } else {
        return 200.0f;
    }
    
    return 0.0f;
}


-(void)eventQuery
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * path = [NSString stringWithFormat:@"http://aplusdriver.herokuapp.com/vehicles/WBY1Z4C58EV273611/events"];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.carEvents = [Event serializeEventsWithArray:responseObject];
        [self.activityTableView reloadData];
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

- (IBAction)leaderboard:(id)sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
