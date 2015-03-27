//
//  navigation.m
//  navigation
//
//  Created by broy denty on 13-7-30.
//  Copyright (c) 2013年 broy denty. All rights reserved.
//

#import "navigation.h"

@interface navigation ()
@end
@implementation navigation
@synthesize myview;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        CGRect rect = CGRectMake(10, 100, 30, 100);
        UIView *view= [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        myview = [[UIView alloc]initWithFrame:[[UIScreen mainScreen ] bounds]];
        myview.backgroundColor = [UIColor whiteColor];
        view.backgroundColor = [UIColor grayColor];
        UITextView *textview = [[UITextView alloc] initWithFrame:rect];
        textview.backgroundColor = [UIColor blueColor];
        self.view = view;
        [myview addSubview:textview];
        [self.view addSubview: myview];

    }
    return self;
}
- (void)loadView
{
    }
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
