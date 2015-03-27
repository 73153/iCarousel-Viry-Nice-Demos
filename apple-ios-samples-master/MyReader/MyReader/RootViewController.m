//
//  RootViewController.m
//  MyReader
//
//  Created by broy denty on 14-6-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//
#import "MRNavigationViewController.h"
#import "PicTitleContentCellTableViewCell.h"
#import "RootViewController.h"
#import "CommitViewController.h"
#import "MoreSettingViewController.h"

@interface RootViewController ()
@end
@implementation RootViewController
{
    UIImageView *fakeNavigationView;
}
@synthesize tableView = _tableView;
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
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    fakeNavigationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [fakeNavigationView setImage:[UIImage imageNamed:@"navbar_bg"]];
    UIButton *setButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 6, 50, 30)];
    [setButton setBackgroundColor:[UIColor orangeColor]];
    [setButton setTitle:@"设置" forState:UIControlStateNormal];
    [setButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside ];
    [fakeNavigationView addSubview:setButton];
    [fakeNavigationView setUserInteractionEnabled:YES];
    [self.view addSubview:fakeNavigationView];
    [self.tableView setFrame:CGRectMake(self.view.frame.origin.x, fakeNavigationView.frame.size.height, self.view.frame.size.width, (self.view.frame.size.height-fakeNavigationView.frame.size.height))];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:YES];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [fakeNavigationView setFrame:CGRectMake(0, 0, 320, 44)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [fakeNavigationView setFrame:CGRectMake(0, 0, 320, 44)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushAction
{
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, 0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    MoreSettingViewController *aMoreSettingViewController = [[MoreSettingViewController alloc] init];
    aMoreSettingViewController.previousImage = currentImage;
    [self.navigationController pushViewController:aMoreSettingViewController animated:NO];
}

#pragma mark -tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *picTitleContentIdentifier = @"PicTitleContentCellTableViewCell";
    PicTitleContentCellTableViewCell *picTitleContentCell = [tableView dequeueReusableCellWithIdentifier:picTitleContentIdentifier];
    if (picTitleContentCell == nil) {
        picTitleContentCell = [[PicTitleContentCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:picTitleContentIdentifier];
    }
    [picTitleContentCell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return picTitleContentCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommitViewController *aCommitViewController = [[CommitViewController alloc] init];
    [self.navigationController pushViewController:aCommitViewController animated:YES];
}
@end
