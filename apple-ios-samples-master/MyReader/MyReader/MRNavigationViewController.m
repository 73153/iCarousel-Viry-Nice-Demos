//
//  MRNavigationViewController.m
//  MyReader
//
//  Created by broy denty on 14-6-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "MRNavigationViewController.h"
@interface MRNavigationViewController ()

@end

@implementation MRNavigationViewController

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
     if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {        // Load resources for iOS 6.1 or earlier
         [self.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
         id appearanceBar = [UINavigationBar appearance];
         [appearanceBar setTintColor:[UIColor orangeColor]];
         UIImage *backImage = [UIImage imageNamed:@"navbar_bg"];
         [appearanceBar setBackgroundImage:backImage forBarMetrics:UIBarMetricsDefault];
         [self.navigationBar.layer setMasksToBounds:YES]; 
     } else {
         // Load resources for iOS 7 or later
         [self.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
         id appearanceBar = [UINavigationBar appearance];
         UIImage *backImage = [UIImage imageNamed:@"navbar_bg"];
         [appearanceBar setBackgroundImage:backImage forBarMetrics:UIBarMetricsDefault];
     }    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTitle:(NSString *)title Color:(UIColor *) color Font:(UIFont *) font
{
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    [dict setObject:font forKey:UITextAttributeFont];
    
    [dict setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)] forKey:UITextAttributeTextShadowOffset];
    self.navigationBar.titleTextAttributes = dict;
    

    NSError *error = nil;
    NSData *data;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];

    [jsonObject dictionaryRepresentation];
    
    }

@end
