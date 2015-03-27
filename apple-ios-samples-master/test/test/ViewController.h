//
//  ViewController.h
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"
@interface ViewController : UIViewController
@property IBOutlet UIButton *button;
@property NextViewController *nextviewcontroller;
-(IBAction)onClick:(id)sender;
@end
