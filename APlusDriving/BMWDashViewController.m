//
//  BMWDashViewController.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWDashViewController.h"
#import <SHPieChartView/SHPieChartView.h>

@interface BMWDashViewController ()

@end

@implementation BMWDashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCircleForFuel:.10];
    [self drawCircleForBattery:.10];
    // Do any additional setup after loading the view from its nib.
}

-(void)drawCircleForFuel:(CGFloat)percentage
{
    
    SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 10, 180, 180)];
    concentricPieChart.chartBackgroundColor = [UIColor whiteColor];
    
    concentricPieChart.isConcentric = YES;
    concentricPieChart.concentricRadius = 70;
    concentricPieChart.concentricColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1];
    
    [concentricPieChart addAngleValue:percentage andClolor:[UIColor redColor]];
    
    [self.view addSubview:concentricPieChart];

}

-(void)drawCircleForBattery:(CGFloat)percentage
{
    SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(190, 10, 180, 180)];
    concentricPieChart.chartBackgroundColor = [UIColor whiteColor];
    
    concentricPieChart.isConcentric = YES;
    concentricPieChart.concentricRadius = 70;
    concentricPieChart.concentricColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1];
    
    [concentricPieChart addAngleValue:percentage andClolor:[UIColor greenColor]];
    
    [self.view addSubview:concentricPieChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
