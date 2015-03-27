//
//  MoreSettingViewController.m
//  MyReader
//
//  Created by broy denty on 14-7-17.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "MoreSettingViewController.h"

@interface MoreSettingViewController ()

@end

@implementation MoreSettingViewController
{
    UIImageView *previousImageView;
    UITapGestureRecognizer *m_tapGesture;
    UIPanGestureRecognizer *m_panGesture;
    CGPoint m_beganPoint;
    CGPoint m_center;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - LifeCycle_Function
- (void)viewDidLoad
{
    [super viewDidLoad];
    previousImageView  = [[UIImageView alloc] initWithImage:self.previousImage];
    [self.view addSubview:previousImageView];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [previousImageView setFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    m_tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [previousImageView addGestureRecognizer:m_tapGesture];
    [m_tapGesture setDelegate:self];
    m_panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [previousImageView addGestureRecognizer:m_panGesture];
    
    [previousImageView setUserInteractionEnabled:YES];
    [m_panGesture setDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [previousImageView removeGestureRecognizer:m_panGesture];
    [previousImageView removeGestureRecognizer:m_tapGesture];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self silderViewAction];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UItableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    didSelectAction
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - insideMethod
- (void)silderViewAction
{
    [UIView animateWithDuration:0.5 animations:^{
        [previousImageView setOriginX:-210];
    }];
}

- (void)popSilderViewAction
{
    [UIView animateWithDuration:0.5 animations:^{
        [previousImageView setOriginX:0];
    } completion:^(BOOL finished) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
}
#pragma mark - GestureDelegate
- (void)tapAction
{
    [self popSilderViewAction];
}

- (void)panAction:(UIGestureRecognizer*) gesture
{
    CGPoint locationPoint;
    if (m_panGesture.state == UIGestureRecognizerStateBegan) {
       m_beganPoint = [m_panGesture translationInView:previousImageView];
        m_center = previousImageView.center;
    }
    else if (m_panGesture.state == UIGestureRecognizerStateChanged)
    {
        NSLog(@"%d",[m_panGesture numberOfTouches]);
        locationPoint = [m_panGesture translationInView:previousImageView];
        if (locationPoint.x-m_beganPoint.x+m_center.x<160&&locationPoint.x>0) {
            previousImageView.centerX = locationPoint.x-m_beganPoint.x+m_center.x;
        }
        NSLog(@"%f",locationPoint.x);
    }else
    {
        if (previousImageView.originX >-160) {
            [self popSilderViewAction];
        }else
        {
            [self silderViewAction];
        }
    }
}
@end
