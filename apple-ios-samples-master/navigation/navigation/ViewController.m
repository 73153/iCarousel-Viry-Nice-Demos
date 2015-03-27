//
//  ViewController.m
//  navigation
//
//  Created by broy denty on 13-7-30.
//  Copyright (c) 2013年 broy denty. All rights reserved.
//

#import "ViewController.h"
#import "navigation.h"

@interface ViewController ()

{
    NSString *string;
}
@end

@implementation ViewController
@synthesize button;
@synthesize editview;
@synthesize navigationcontroller;
@synthesize scroll;
- (IBAction)touchbackground:(id)sender
{
    [self.editview resignFirstResponder];
}
- (IBAction)onclick:(id)sender
{
    
    if ([[self.editview text] isEqual: @"123"]) {
        navigation *navi = [[navigation alloc] init];
        [self.navigationController pushViewController:navi animated:YES];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroll setContentSize:CGSizeMake(320, 1000)];

    [self.view addSubview: button];
    [self.view addSubview:editview];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editviewdidchange:(id)sender
{
    string = self.editview.text;
}
- (IBAction)editviewfinish:(id)sender
{
    [self.editview resignFirstResponder];
}


- (void)viewDidUnload {
 

    [self setScroll:nil];
    [super viewDidUnload];
}

@end
