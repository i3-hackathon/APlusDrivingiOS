//
//  BMWDashViewController.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWDashViewController.h"
#import <MagicPieLayer.h>
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
//    PieLayer * pieLayer = [[PieLayer alloc] init];
//    pieLayer.frame = CGRectMake(20, 20, 200, 200);
//    pieLayer.backgroundColor = [UIColor whiteColor].CGColor;
//    [self.view.layer addSublayer:pieLayer];
//    
//    CALayer * circle = [[CALayer alloc] init];
//    circle.backgroundColor = [UIColor whiteColor].CGColor;
//    circle.borderColor = [UIColor blackColor].CGColor;
//    circle.borderWidth = 1.0f;
//    circle.frame = CGRectMake(30, 30, 180, 180);
//    circle.cornerRadius = circle.frame.size.width/2;
//    [self.view.layer addSublayer:circle];
//    
//    CALayer * circleOuter = [[CALayer alloc] init];
//    circleOuter.backgroundColor = [UIColor clearColor].CGColor;
//    circleOuter.borderColor = [UIColor blackColor].CGColor;
//    circleOuter.borderWidth = 1.0f;
//    circleOuter.frame = CGRectMake(20, 20, 200, 200);
//    circleOuter.cornerRadius = circle.frame.size.width/2;
//    [self.view.layer addSublayer:circleOuter];
//    
//    
//    
//    [pieLayer addValues:@[[PieElement pieElementWithValue:10 color:[UIColor greenColor]],
//                          [PieElement pieElementWithValue:90 color:[UIColor whiteColor]]] animated:NO];
////                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:1 color:[UIColor blueColor]]] animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
