//
//  ViewController.m
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button;
@synthesize nextviewcontroller;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onClick:(id)sender
{

//    UITabBarController *tbVC = [[UITabBarController alloc]init];
//    ViewController1 *viewcontroller1 = [[ViewController1 alloc] initWithNibName:@"ViewController1" bundle:nil];
//    ViewController2 *viewcontroller2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];
//    ViewController3 *viewcontroller3 = [[ViewController3 alloc] initWithNibName:@"ViewController3" bundle:nil];
//    [tbVC setViewControllers:@[viewcontroller1,viewcontroller2,viewcontroller3]];
//    UITabBarItem *tabbaritem1 = [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"pic"] tag:0];
//    UITabBarItem *tabbaritem2 = [[UITabBarItem alloc] initWithTitle:@"2" image:[UIImage imageNamed:@"pic"] tag:1];
//    UITabBarItem *tabbaritem3 = [[UITabBarItem alloc] initWithTitle:@"3" image:[UIImage imageNamed:@"pic"] tag:2];
//    [tbVC.tabBar setItems:@[tabbaritem1,tabbaritem2,tabbaritem3 ] animated:YES];
    NextViewController *tbVC = [[NextViewController alloc] init];
    [ self.navigationController pushViewController:tbVC animated:YES];
}
@end
