//
//  AppDelegate.h
//  navigation
//
//  Created by broy denty on 13-7-30.
//  Copyright (c) 2013年 broy denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UINavigationController *nav;

@end
