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
    [self drawCircle];
    // Do any additional setup after loading the view from its nib.
}

-(void)drawCircle
{
    
    SHPieChartView *concentricPieChart = [[SHPieChartView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
    concentricPieChart.chartBackgroundColor = [UIColor whiteColor];
    
    concentricPieChart.isConcentric = YES;
    concentricPieChart.concentricRadius = 70;
    concentricPieChart.concentricColor = [UIColor greenColor];
    
    [concentricPieChart addAngleValue:0.40 andClolor:[UIColor redColor]];
    
    [self.view addSubview:concentricPieChart];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
