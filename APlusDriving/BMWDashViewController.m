//
//  BMWDashViewController.m
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import "BMWDashViewController.h"
#import "BMWActivityViewController.h"
#import "Car.h"
#import <SHPieChartView/SHPieChartView.h>
#import <AFNetworking/AFNetworking.h>
#import <MapKit/MapKit.h>

@interface BMWDashViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *odometerLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIView *odoTempView;
@property (weak, nonatomic) IBOutlet UIView *carStatusView;
@property (weak, nonatomic) IBOutlet UIView *mapContainerView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *engineLabel;
@property (weak, nonatomic) IBOutlet UILabel *doorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lightsLabel;
@property (weak, nonatomic) IBOutlet UILabel *windowsLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation BMWDashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
    [self dashQuery];

    // Do any additional setup after loading the view from its nib.
}

-(void)configuration
{
    self.mapView.delegate = self;
    
    self.odoTempView.layer.borderColor = [UIColor colorWithRed:183.0f/255.0f green:180.0f/255.0f blue:184.0f/255.0f alpha:1].CGColor;
    self.odoTempView.layer.borderWidth = 1.0f;
    
    self.mapContainerView.layer.borderColor = [UIColor colorWithRed:183.0f/255.0f green:180.0f/255.0f blue:184.0f/255.0f alpha:1].CGColor;
    self.mapContainerView.layer.borderWidth = 1.0f;
}

-(void)configureLabelsWithCar:(Car *)car
{
    float fuelLevel = [car.fuelLevel floatValue]/100.0f;
    float batteryLevel = [car.battery floatValue]/100.0f;
    
    [UIView animateWithDuration:1 animations:^{
        [self drawCircleForFuel:fuelLevel];
        [self drawCircleForBattery:batteryLevel];
    }];

    
    self.odometerLabel.text = [NSString stringWithFormat:@"%@ mi",[car.odometer description]];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@%@F", car.temperature, @"\u00B0"];
    
    self.odometerLabel.textColor = [UIColor colorWithRed:95.0f/255.0f green:164.0f/255.0f blue:203.0f/255.0f alpha:1];
    self.temperatureLabel.textColor = [UIColor colorWithRed:95.0f/255.0f green:164.0f/255.0f blue:203.0f/255.0f alpha:1];
    
    if (car.engine) {
        self.engineLabel.text = @"ON";
    } else {
        self.lightsLabel.text = @"OFF";
    }
    
    if (car.lights) {
        self.lightsLabel.text = @"ON";
    } else {
        self.lightsLabel.text = @"OFF";
    }
    
    if (car.doors) {
        self.doorsLabel.text = @"LOCKED";
    } else {
        self.doorsLabel.text = @"UNLOCKED";
    }
    
    if (car.windows) {
        self.windowsLabel.text = @"OPEN";
    } else {
        self.windowsLabel.text = @"CLOSED";
    }
    
    double lat = [car.lastLatitude doubleValue];
    double lng = [car.lastLongitude doubleValue];
    
    CLLocation * lastLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    [self.mapView addAnnotation:lastLocation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (lastLocation.coordinate, 100, 100);
    [self.mapView setRegion:region animated:NO];
    
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:lastLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"what is this here %@", placemarks);
        CLPlacemark * placemark = [placemarks firstObject];
        NSString * street = placemark.addressDictionary[@"Street"];
        NSString * city = placemark.addressDictionary[@"City"];
        NSString * state = placemark.addressDictionary[@"State"];
        NSString * zipCode = placemark.addressDictionary[@"ZIP"];
        
        self.locationLabel.text = [NSString stringWithFormat:@"%@, %@, %@ %@", street, city, state, zipCode];
    }];
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
    fuelLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:36.0f];
    int labelDisplay = percentage * 100;
    fuelLabel.text = [NSString stringWithFormat:@"%i%%", labelDisplay];
    [self.view addSubview:fuelLabel];
    
    UILabel * fuelDisplay = [[UILabel alloc] initWithFrame:CGRectMake(70, 180, 80, 20)];
    fuelDisplay.text = @"Fuel Level";
    fuelDisplay.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0f];
    [self.view addSubview:fuelDisplay];

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
    batteryLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:36.0f];
    int labelDisplay = percentage * 100;
    batteryLabel.text = [NSString stringWithFormat:@"%i%%", labelDisplay];
    [self.view addSubview:batteryLabel];
    
    UILabel * batteryDisplay = [[UILabel alloc] initWithFrame:CGRectMake(250, 180, 80, 20)];
    batteryDisplay.text = @"Battery Level";
    batteryDisplay.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0f];
    [self.view addSubview:batteryDisplay];
}

-(void)dashQuery
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    NSString * path = @"http://aplusdriver.herokuapp.com/vehicles/WBY1Z4C58EV273611";
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"what is the responseObject here %@", responseObject);
        Car * car = [Car parseDictionaryIntoCar:responseObject];
        [self configureLabelsWithCar:car];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"what is the error here %@", error);
    }];
}

- (IBAction)eventActivity:(id)sender {
    
    BMWActivityViewController * bmwavc = [[BMWActivityViewController alloc] init];
    [self presentViewController:bmwavc animated:NO completion:nil];
}


- (IBAction)leaderboard:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
