//
//  ViewController.m
//  testscroller
//
//  Created by broy denty on 14-1-16.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollview setFrame:CGRectMake(0, 0, 320, 480)];
    CGSize size = CGSizeMake(1000, 1000);
    [self.scrollview setContentSize:size];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
