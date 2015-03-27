//
//  AppDelegate.h
//  Test_tab
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController1.h"
#import "ViewController.h"
#import "TabController.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController1 *viewController1;
@property (strong, nonatomic) TabController *tabController;

@end
