//
//  NextViewController.m
//  TouchTV
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController
@synthesize navbutton;
@synthesize  alert;
@synthesize segmentcontroller;
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navbutton = [[UIBarButtonItem alloc] initWithTitle:@"gono" style:UIBarButtonSystemItemDone target:self action:@selector(actiongono)];
//    self.navbutton1 = [[UIBarButtonItem alloc] initWithTitle:@"gono" style:UIBarButtonSystemItemDone target:self action:@selector(actiongono)];
//    self.navbutton2= [[UIBarButtonItem alloc] initWithTitle:@"gono" style:UIBarButtonSystemItemDone target:self action:@selector(actiongono)];
//    self.navbutton3 = [[UIBarButtonItem alloc] initWithTitle:@"gono" style:UIBarButtonSystemItemDone target:self action:@selector(actiongono)];
    NSArray *array = [[NSArray alloc] initWithObjects:self.navbutton,/*self.navbutton1,self.navbutton2,self.navbutton3,*/ nil];
//    [self.navigationItem setRightBarButtonItem:self.navbutton];

    
    
    //navigation 方式进行画面跳转
//    [self.navigationItem setRightBarButtonItems:array animated:YES];
//    segmentcontroller.segmentedControlStyle = UISegmentedControlStylePlain;
//    [segmentcontroller insertSegmentWithTitle:@"1" atIndex:0 animated:NO];
//    [segmentcontroller insertSegmentWithTitle:@"2" atIndex:1 animated:NO];
//    [segmentcontroller insertSegmentWithTitle:@"3" atIndex:2 animated:NO];
//    [segmentcontroller removeSegmentAtIndex:3 animated:NO];
//    [segmentcontroller removeSegmentAtIndex:3 animated:NO];
//    [segmentcontroller addTarget:self action:@selector(selectedaction:) forControlEvents:UIControlEventValueChanged];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)actiongono
{
    alert = [[UIAlertView alloc] initWithTitle:@"error" message:@"network error" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:nil];
    NSInteger okbuttonindex=[alert addButtonWithTitle:@"ok"];
    NSLog(@"%d",[self.alert firstOtherButtonIndex]);
    
    [alert show];
}
//- (IBAction)selectedaction:(id)sender
//{
//    UISegmentedControl * segmentcontrol = (UISegmentedControl *)sender;
//    NSInteger index = segmentcontrol.selectedSegmentIndex;
//    UIViewController * targetviewcontroller;
//    switch (index) {
//        case 0:
//            targetviewcontroller = [[ViewController alloc] init];
//            [targetviewcontroller.navigationController.navigationBar setHidden:YES];
//            
//            
//            break;
//        case 1:
//            targetviewcontroller = [[NextViewController alloc] init];
//            break;
//        case 2:
//            targetviewcontroller = [[NextViewController alloc] init];
//        default:
//            break;
//    }
//    [self.navigationController pushViewController:targetviewcontroller animated:NO];
//}
//使用navigation方式虚拟segment组件的画面跳转
@end
