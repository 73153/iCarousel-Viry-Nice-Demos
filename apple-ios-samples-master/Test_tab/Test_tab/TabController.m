//
//  TabController.m
//  Test_tab
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "TabController.h"

@interface TabController ()

@end

@implementation TabController
@synthesize item1;
@synthesize item2;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    item2.title =@"2";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
