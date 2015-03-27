//
//  ViewController.h
//  navigation
//
//  Created by broy denty on 13-7-30.
//  Copyright (c) 2013年 broy denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>


@property IBOutlet UITextField *editview;
@property IBOutlet UIButton *button;
@property UINavigationController *navigationcontroller;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction)onclick:(id)sender;
- (IBAction)editviewdidchange:(id)sender;
- (IBAction)editviewfinish:(id)sender;
- (IBAction)touchbackground:(id)sender;

@end
