//
//  AppDelegate.h
//  APlusDriving
//
//  Created by Yash Varma on 1/10/15.
//  Copyright (c) 2015 APlusDriving. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMWActivityViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BMWActivityViewController * viewController;
//@property (strong, nonatomic) ViewController * viewController;


@end

