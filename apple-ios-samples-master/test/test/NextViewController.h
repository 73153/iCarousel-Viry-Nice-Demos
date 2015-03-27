//
//  NextViewController.h
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface NextViewController : UITabBarController <UITabBarControllerDelegate,UITabBarDelegate>
@property ViewController1 *viewcontroller1;
@property ViewController2 *viewcontroller2;
@property ViewController3 *viewcontroller3;

@end
