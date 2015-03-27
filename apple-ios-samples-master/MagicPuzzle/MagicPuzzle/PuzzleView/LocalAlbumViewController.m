//
//  LocalAlbumViewController.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-18.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "LocalAlbumViewController.h"
@interface LocalAlbumViewController ()

@end

@implementation LocalAlbumViewController

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
    [self.albumView setPagingEnabled:NO];
    self.albumView.style = GMGridViewStyleSwap;
    self.albumView.centerGrid = YES;
    self.albumView.actionDelegate = self;
    self.albumView.sortingDelegate = self;
//    self.albumView.transformDelegate = self;
    self.albumView.dataSource = self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
