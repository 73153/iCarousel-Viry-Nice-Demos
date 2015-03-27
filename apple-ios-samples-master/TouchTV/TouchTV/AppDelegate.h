//
//  AppDelegate.h
//  TouchTV
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) ViewController *viewController;

@end
