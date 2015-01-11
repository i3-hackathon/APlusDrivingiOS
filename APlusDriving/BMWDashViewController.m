//
//  BMWDashViewController.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWDashViewController.h"
#import <SHPieChartView/SHPieChartView.h>
#import <AFNetworking/AFNetworking.h>

@interface BMWDashViewController ()
@property (weak, nonatomic) IBOutlet UILabel *odometerLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation BMWDashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCircleForFuel:1];
    [self drawCircleForBattery:1];
    // Do any additional setup after loading the view from its nib.
}

-(void)drawCircleForFuel:(CGFloat)percentage
{
    
    SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 70, 180, 180)];
    concentricPieChart.chartBackgroundColor = [UIColor whiteColor];
    
    concentricPieChart.isConcentric = YES;
    concentricPieChart.concentricRadius = 70;
    concentricPieChart.concentricColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1];
    
    [concentricPieChart addAngleValue:percentage andClolor:[UIColor colorWithRed:111.0f/255.0f green:193.0f/255.0f blue:105.0f/255.0f alpha:1]];
    
    [self.view addSubview:concentricPieChart];
    
    UILabel * fuelLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 120, 75, 75)];
    fuelLabel.textColor = [UIColor colorWithRed:111.0f/255.0f green:193.0f/255.0f blue:105.0f/255.0f alpha:1];
    fuelLabel.font = [UIFont fontWithName:@"Menlo" size:40.0f];
    fuelLabel.text = @"50%";
    [self.view addSubview:fuelLabel];

}

-(void)drawCircleForBattery:(CGFloat)percentage
{
    SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(190, 70, 180, 180)];
    concentricPieChart.chartBackgroundColor = [UIColor whiteColor];
    
    concentricPieChart.isConcentric = YES;
    concentricPieChart.concentricRadius = 70;
    concentricPieChart.concentricColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1];
    
    [concentricPieChart addAngleValue:percentage andClolor:[UIColor colorWithRed:248.0f/255.0f green:173.0f/255.0f blue:26.0f/255.0f alpha:1]];
    
    [self.view addSubview:concentricPieChart];
    
    UILabel * batteryLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 120, 75, 75)];
    batteryLabel.textColor = [UIColor colorWithRed:248.0f/255.0f green:173.0f/255.0f blue:26.0f/255.0f alpha:1];
    batteryLabel.font = [UIFont fontWithName:@"Menlo" size:40.0f];
    batteryLabel.text = @"50%";
    [self.view addSubview:batteryLabel];
}

-(void)dashQuery
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
