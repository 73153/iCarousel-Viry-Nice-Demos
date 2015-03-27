//
//  ImagePickerViewController.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ImagePickerViewController.h"
#import "CoverFlowView.h"
#import "puzzleImageModel.h"
@interface ImagePickerViewController ()
{
    CoverFlowView *m_aCoverFlowView;
    NSString *m_type;
}
@end

@implementation ImagePickerViewController

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
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Wood.jpg"]];
    [backgroundView setFrame:self.view.frame];
    
    [self.view addSubview:backgroundView];
    m_aCoverFlowView = [[CoverFlowView alloc] initWithFrame:self.view.frame];
    m_aCoverFlowView.selectDelegate = self;
    m_aCoverFlowView.puzzleArray = self.imageArray;
    m_aCoverFlowView.displayType = iCarouselTypeInvertedTimeMachine;
    [m_aCoverFlowView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: m_aCoverFlowView];
    
    
    self.bounceButtons = [[BounceButtonView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    NSArray *arrMenuItemButtons = [[NSArray alloc] initWithObjects:self.bounceButtons.itemButton1,
                                   self.bounceButtons.itemButton2,
                                   self.bounceButtons.itemButton3,
                                   nil]; // Add all of the defined 'menu item button' to 'menu item view'
    [self.bounceButtons addBounceButtons:arrMenuItemButtons];
    [self.bounceButtons setBackgroundColor:[UIColor clearColor]];
    self.homeButton = [[ASOTwoStateButton alloc] initWithFrame:CGRectMake(0, 0, 30,30)];
    [self.view addSubview:self.homeButton];
    [self.homeButton addTarget:self action:@selector(expendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.homeButton.offStateImageName = @"OrderPlayHight";
    self.homeButton.onStateImageName = @"OrderPlay";
    [self.homeButton initAnimationWithFadeEffectEnabled:YES];
    
    [self.bounceButtons setSpeed:[NSNumber numberWithFloat:0.3f]];
    [self.bounceButtons setBouncingDistance:[NSNumber numberWithFloat:0.3f]];
    [self.bounceButtons setAnimationStyle:ASOAnimationStyleRiseProgressively];
    
    [self.bounceButtons setDelegate:self];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)selectImageIndex:(NSInteger)index
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
   return [self.sendIndexDelegate sendIndexOfImage:index Type:m_type];
}

#pragma mark asoButtonAction
- (void)expendButtonAction:(id)sender
{
    ASOTwoStateButton *tempButton = (ASOTwoStateButton *)sender;
    if ([tempButton isOn]) {
        // Show 'menu item view' and expand its 'menu item button'
        [self.homeButton addCustomView:self.bounceButtons];
        [self.bounceButtons expandWithAnimationStyle:ASOAnimationStyleRiseProgressively];
    }
    else {
        // Collapse all 'menu item button' and remove 'menu item view'
        [self.bounceButtons collapseWithAnimationStyle:ASOAnimationStyleRiseProgressively];
        [self.homeButton removeCustomView:self.bounceButtons interval:[self.bounceButtons.collapsedViewDuration doubleValue]];
    }
    
}

#pragma mark ASOBounceButtonViewDelegate
- (void)didSelectBounceButtonAtIndex:(NSUInteger)index
{
    [self.homeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%d",index);
    if (index == 0) {
//        easy
        NSArray *thumbArray = [puzzleImageModel imagesThumbForEasyPuzzle];
        if (thumbArray.count>0) {
            m_aCoverFlowView.puzzleArray = thumbArray;
            [m_aCoverFlowView setDisplayType:iCarouselTypeCylinder];
            m_type = @"easy";
        }
    }
    else if (index == 1)
    {
//        hard
        NSArray *thumbArray = [puzzleImageModel imagesThumbForHardPuzzle];
        if (thumbArray.count>0) {
            m_aCoverFlowView.puzzleArray = thumbArray;
            [m_aCoverFlowView setDisplayType:iCarouselTypeCoverFlow];
            m_type = @"hard";
        }
    }
    else
    {
//        all
        m_aCoverFlowView.puzzleArray = self.imageArray;
        m_aCoverFlowView.displayType = iCarouselTypeInvertedTimeMachine;
        m_type = nil;
    }
    [m_aCoverFlowView refreshData];
}
@end
