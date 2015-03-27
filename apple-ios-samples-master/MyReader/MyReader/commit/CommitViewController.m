//
//  CommitViewController.m
//  MyReader
//
//  Created by broy denty on 14-6-10.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "CommitViewController.h"
#import "PicTitleContentCellTableViewCell.h"

@interface CommitViewController ()

@end

@implementation CommitViewController
{
    ExpandabelTableView *expandeTableView;
    int lastContentOffset;
    CGFloat lastOrginY;
}
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
    [self.navigationController.navigationBar setHidden:NO];
    [self.view setBackgroundColor:[UIColor grayColor]];
    NSArray *testDataArray = [[NSArray alloc] initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",nil];
    self.title = @"juyue";
    self.navigationController.delegate = self;
    expandeTableView = [[ExpandabelTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:expandeTableView];
    
    [expandeTableView loadDataArray:testDataArray];
    expandeTableView.expandableDataSource = self;
    expandeTableView.expandableDelegate = self;
    [expandeTableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    
    [self.naviControllerBar setFrame:CGRectMake(0, expandeTableView.frame.size.height-44, 320, 44)];
    [expandeTableView setFrame:CGRectMake(expandeTableView.frame.origin.x, expandeTableView.frame.origin.y, 320, expandeTableView.frame.size.height-44)];
    [self.view bringSubviewToFront:self.naviControllerBar];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - navigationDelegate

#pragma mark -expandableTabelViewDataSource
- (NSInteger)numberOfSectionsInExpandableTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)expandabelTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell*)tableView:(UITableView *)tableView MainCellForRowAtIndexPath:(NSIndexPath *)indexPath WithDataArray:(NSArray *)dataArray
{
    static NSString *picTitleContentIdentifier = @"PicTitleContentCellTableViewCell";
    PicTitleContentCellTableViewCell *picTitleContentCell = [tableView dequeueReusableCellWithIdentifier:picTitleContentIdentifier];
    if (picTitleContentCell == nil) {
        picTitleContentCell = [[PicTitleContentCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    [picTitleContentCell setHidden:YES];
    [UIView transitionWithView:picTitleContentCell duration:0.75 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [picTitleContentCell setHidden:NO];
        [picTitleContentCell.cellImage setImageWithURL:[NSURL URLWithString:@"http://img.wochacha.com/broke_images/6/3/203343714_13929691101f7ab7fb211dc64217a3e835553c5327.jpg"] placeholderImage:nil];
    } completion:^(BOOL finished) {
        
    }];
    return picTitleContentCell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView ChildCellForRowAtIndexPath:(NSIndexPath *)indexPath WithDataArray:(NSArray *)dataArray
{
    static NSString *childCellIdentifier = @"ChildCellIdentifier";
    UITableViewCell *childCell = [tableView dequeueReusableCellWithIdentifier:childCellIdentifier];
    if (childCell == nil) {
        childCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:childCellIdentifier];
    }
    [childCell.textLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    return childCell;
}

#pragma mark -expandableTabelViewDelegate
- (void)expandabelTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath WithDataArray:(NSArray *)dataArray
{
    
}

- (void)expandAnimationStart
{
    
}

- (void)expandAnimationStop
{
    
}

- (void)expandabelTableViewWillScroll:(UIScrollView *)scrolView
{
    lastContentOffset = scrolView.contentOffset.y;
}

-(void)expandabelTableViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y<lastContentOffset)
    {
        if (self.naviControllerBar.hidden)
        {
            
            [UIView beginAnimations:@"Curls"context:nil];//动画开始
            [UIView setAnimationDuration:0.75];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.naviControllerBar cache:YES];
            [self.naviControllerBar setHidden:NO];
            [UIView commitAnimations];
        }
        
        //向上
    }
    else if (scrollView.contentOffset.y>lastContentOffset)
    {
         [expandeTableView setFrame:CGRectMake(expandeTableView.frame.origin.x, expandeTableView.frame.origin.y, 320, self.view.frame.size.height)];
        if (!self.naviControllerBar.hidden) {
            [UIView beginAnimations:@"Curl"context:nil];//动画开始
            [UIView setAnimationDuration:0.75];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.naviControllerBar cache:YES];
            [self.naviControllerBar setHidden:YES];
            [UIView commitAnimations];
           
        }
        //向下
    }
}

- (NSArray*)arrayOfChildCell
{
    NSArray *testDataArray = [[NSArray alloc] initWithObjects:@"1",nil];
    return testDataArray;
}

- (IBAction)popViewControllerAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
