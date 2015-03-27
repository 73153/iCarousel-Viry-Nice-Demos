//
//  NextViewController.m
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController
@synthesize viewcontroller1;
@synthesize viewcontroller2;
@synthesize viewcontroller3;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        viewcontroller1 = [[ViewController1 alloc] initWithNibName:@"ViewController1" bundle:nil];
//        viewcontroller1.tabBarItem.title = @"test";
        viewcontroller2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];
        viewcontroller3 = [[ViewController3 alloc] initWithNibName:@"ViewController3" bundle:nil];
        self.viewControllers = @[viewcontroller1,viewcontroller2,viewcontroller3];
        UITabBarItem *tabbaritem1 = [[UITabBarItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"pic"] tag:0];
        UITabBarItem *tabbaritem2 = [[UITabBarItem alloc] initWithTitle:@"2" image:[UIImage imageNamed:@"pic"] tag:1];
        UITabBarItem *tabbaritem3 = [[UITabBarItem alloc] initWithTitle:@"3" image:[UIImage imageNamed:@"pic"] tag:2];
        
        
        
        
//        UITabBar * bar = [[UITabBar alloc] initWithFrame:CGRectMake(0,365 , 320, 50)];
        
        
        [self.tabBar setItems:@[tabbaritem1,tabbaritem2,tabbaritem3] animated:YES];
        [self.tabBar setDelegate:self];
//        [self.tabBar removeFromSuperview];
//        [self.view addSubview: ];

//        [self setSelectedIndex:1];
//        [bar setSelectedItem:[bar.items objectAtIndex:1]];
//        NSArray *array = [[NSArray alloc] initWithObjects:tabbaritem1,tabbaritem2,tabbaritem3 ,nil];
//        [self.tabBar setItems:array animated:YES];
    }
    return self;
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
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag !=2)
    {
        [self setSelectedIndex:item.tag];
    }
    else
    {
        ViewController3 *view = [[ViewController3 alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }
}
@end
