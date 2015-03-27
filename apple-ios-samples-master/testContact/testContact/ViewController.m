//
//  ViewController.m
//  testContact
//
//  Created by broy denty on 13-10-16.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import <AddressBookUI/AddressBookUI.h>
@interface ViewController ()< ABNewPersonViewControllerDelegate>

@end

@implementation ViewController

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

-(void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
}

- (IBAction)ontouch:(id)sender {
    ABNewPersonViewController *picker = [[ABNewPersonViewController alloc] init];
//    picker.newPersonViewDelegate = self;
    [self.navigationController pushViewController:picker animated:YES];
    
//    [self.navigationController pushViewController:a animated:YES];
}
@end
