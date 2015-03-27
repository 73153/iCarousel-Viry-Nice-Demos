//
//  SliderViewController.m
//  LeftRightSlider
//
//  Created by heroims on 13-11-27.
//  Copyright (c) 2013年 heroims. All rights reserved.
//

#import "SliderViewController.h"

static CGFloat kBlackCoverMaxAlpha = 0.0f;


typedef NS_ENUM(NSInteger, RMoveDirection) {
    RMoveDirectionLeft = 0,
    RMoveDirectionRight
};

@interface SliderViewController ()<UIGestureRecognizerDelegate>{
    UIView *_mainContentView;
    UIView *_leftSideView;
    UIView *_rightSideView;
    
    NSMutableDictionary *_controllersDict;
    
    UITapGestureRecognizer *_tapGestureRec;
    UIPanGestureRecognizer *_panGestureRec;
    UIPanGestureRecognizer *_panOnBlackCoverViewGestureRec;
    
    BOOL _showLeftSideView;
    BOOL _showRightSideView;
    BOOL _bRightSiderViewShowed;
    BOOL _bLeftSiderViewShowed;
}

@end

@implementation SliderViewController

#if __has_feature(objc_arc)
#else
-(void)dealloc{
    [_mainContentView release];
    [_leftSideView release];
    [_rightSideView release];
    [_blackCoverView release];
    
    [_controllersDict release];
    
    [_tapGestureRec release];
    [_panGestureRec release];
    [_panOnBlackCoverViewGestureRec release];
    
    [_leftVC release];
    [_rightVC release];
    [_MainVC release];
    [super dealloc];
}
#endif

+ (SliderViewController*)sharedSliderController
{
    static SliderViewController *sharedSVC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSVC = [[self alloc] init];
    });
    
    return sharedSVC;
}

- (id)init{
    if (self = [super init]){
        _LeftSContentOffset=160;
        _RightSContentOffset=160;
        _LeftSContentScale=0.85;
        _RightSContentScale=0.85;
        _LeftSJudgeOffset=100;
        _RightSJudgeOffset=100;
        _LeftSOpenDuration=0.4;
        _RightSOpenDuration=0.4;
        _LeftSCloseDuration=0.3;
        _RightSCloseDuration=0.3;
        
        _showLeftSideView = NO;
        _showRightSideView = NO;
        _canMoveWithGesture = YES;
    }
        
    return self;
}

- (void)viewDidLoad
{
    NSAssert((_mainVCClassName && (_mainVCClassName.length > 0)), @"\n\n\n没有设置主ViewController类名\n\n");
    
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;

    _controllersDict = [NSMutableDictionary dictionary];
    
    [self initSubviews];
    
    [self initChildControllers:_LeftVC rightVC:_RightVC];
    
    [self showContentControllerWithModel:_mainVCClassName];
    
    _tapGestureRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSideBar)];
    _tapGestureRec.delegate=self;
    [_mainContentView addGestureRecognizer:_tapGestureRec];
    _tapGestureRec.enabled = NO;
    
    _panGestureRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGesture:)];
    [_mainContentView addGestureRecognizer:_panGestureRec];
}

#pragma mark - Init

- (void)initSubviews
{
    _rightSideView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_rightSideView];

    _leftSideView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_leftSideView];
    
    _mainContentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mainContentView];
}

- (void)initChildControllers:(UIViewController*)leftVC rightVC:(UIViewController*)rightVC
{
    if (leftVC)
    {
        [self addChildViewController:leftVC];
        leftVC.view.frame=CGRectMake(0, 0, leftVC.view.frame.size.width, leftVC.view.frame.size.height);
        [_leftSideView addSubview:leftVC.view];
        
        _showLeftSideView = YES;
    }
    else
    {
        _showLeftSideView = NO;
    }
    
    if (rightVC)
    {
        [self addChildViewController:rightVC];
        rightVC.view.frame=CGRectMake(0, 0, rightVC.view.frame.size.width, rightVC.view.frame.size.height);
        [_rightSideView addSubview:rightVC.view];
        
        _showRightSideView = YES;
    }
    else
    {
        _showRightSideView = NO;
    }
}

#pragma mark - Actions

- (void)showContentControllerWithModel:(NSString *)className
{
    [self closeSideBar];
    
    UIViewController *controller = _controllersDict[className];
    if (!controller)
    {
        Class c = NSClassFromString(className);
        
#if __has_feature(objc_arc)
        controller = [[c alloc] init];
#else
        controller = [[[c alloc] init] autorelease];
#endif
        [_controllersDict setObject:controller forKey:className];
    }
    
    if (_mainContentView.subviews.count > 0)
    {
        UIView *view = [_mainContentView.subviews firstObject];
        [view removeFromSuperview];
    }
    
    controller.view.frame = _mainContentView.frame;
    [_mainContentView addSubview:controller.view];
    
    self.MainVC=controller;
}

- (void)leftItemClick
{
    if (_bLeftSiderViewShowed) {
        [self closeSideBar];
    }
    else
    {
        if (_showLeftSideView)
        {
            CGAffineTransform conT = [self transformWithDirection:RMoveDirectionRight];
            
            [self.view sendSubviewToBack:_rightSideView];
            [self configureViewShadowWithDirection:RMoveDirectionRight];
            
            [UIView animateWithDuration:_LeftSOpenDuration
                             animations:^{
                                 _mainContentView.transform = conT;
                                 
                             }
                             completion:^(BOOL finished) {
                                 _tapGestureRec.enabled = YES;
                             }];
            _bLeftSiderViewShowed = YES;
        }else{}
    }
}

- (void)rightItemClick
{
    if (_bRightSiderViewShowed) {
        [self closeSideBar];
    }
    else
    {
        if (_showRightSideView)
        {
            CGAffineTransform conT = [self transformWithDirection:RMoveDirectionLeft];
            
            [self.view sendSubviewToBack:_leftSideView];
            [self configureViewShadowWithDirection:RMoveDirectionLeft];
            
            [UIView animateWithDuration:_RightSOpenDuration
                             animations:^{
                                 _mainContentView.transform = conT;
                                 
                             }
                             completion:^(BOOL finished) {
                                 _tapGestureRec.enabled = YES;
                             }];
            _bRightSiderViewShowed = YES;
        }
    }
}

- (void)closeSideBar
{
    CGAffineTransform oriT = CGAffineTransformIdentity;
    [UIView animateWithDuration:_mainContentView.transform.tx==_LeftSContentOffset?_LeftSCloseDuration:_RightSCloseDuration
                     animations:^{
                         _mainContentView.transform = oriT;
                     }
                     completion:^(BOOL finished) {
                         _tapGestureRec.enabled = NO;
                     }];
    _bLeftSiderViewShowed = NO;
    _bRightSiderViewShowed = NO;
}

- (void)moveViewWithGesture:(UIPanGestureRecognizer *)panGes
{
    if (!_canMoveWithGesture)
    {
        return;
    }else{}
    
    static CGFloat currentTranslateX;
    if (panGes.state == UIGestureRecognizerStateBegan)
    {
        currentTranslateX = _mainContentView.transform.tx;
    }
    if (panGes.state == UIGestureRecognizerStateChanged)
    {
        CGFloat transX = [panGes translationInView:_mainContentView].x;
        transX = transX + currentTranslateX;
        
        CGFloat sca;
        BOOL isTransformView = NO;
        CGFloat blackCoverAlpha = 0.0f;
        if ((transX > 0) && _showLeftSideView)
        {
            [self.view sendSubviewToBack:_rightSideView];
            [self configureViewShadowWithDirection:RMoveDirectionRight];
            
            if (_mainContentView.frame.origin.x < _LeftSContentOffset)
            {
                sca = 1 - (_mainContentView.frame.origin.x/_LeftSContentOffset) * (1-_LeftSContentScale);
            }
            else
            {
                sca = _LeftSContentScale;
            }
            blackCoverAlpha = MIN((transX/_LeftSContentOffset * kBlackCoverMaxAlpha), kBlackCoverMaxAlpha);
            isTransformView = YES;
        }
        else if ((transX < 0) && _showRightSideView)
        {
            [self.view sendSubviewToBack:_leftSideView];
            [self configureViewShadowWithDirection:RMoveDirectionLeft];
            
            if (_mainContentView.frame.origin.x > -_RightSContentOffset)
            {
                sca = 1 - (-_mainContentView.frame.origin.x/_RightSContentOffset) * (1-_RightSContentScale);
            }
            else
            {
                sca = _RightSContentScale;
            }
            blackCoverAlpha = MIN((-transX/_RightSContentOffset * kBlackCoverMaxAlpha), kBlackCoverMaxAlpha);
            isTransformView = YES;
        }
        else
        {
            sca = 0.0f;
            isTransformView = NO;
        }
        
        if (isTransformView)
        {
            CGAffineTransform transS = CGAffineTransformMakeScale(1.0, sca);
            CGAffineTransform transT = CGAffineTransformMakeTranslation(transX, 0);
            
            CGAffineTransform conT = CGAffineTransformConcat(transT, transS);
            
            _mainContentView.transform = conT;
        }else{}
    }
    else if (panGes.state == UIGestureRecognizerStateEnded)
    {
        CGFloat panX = [panGes translationInView:_mainContentView].x;
        CGFloat finalX = currentTranslateX + panX;
        if ((finalX > _LeftSJudgeOffset) && _showLeftSideView)
        {
            CGAffineTransform conT = [self transformWithDirection:RMoveDirectionRight];
            [UIView beginAnimations:nil context:nil];
            _mainContentView.transform = conT;
            
            [UIView commitAnimations];
            
            _tapGestureRec.enabled = YES;
            _bLeftSiderViewShowed = YES;
            return;
        }
        if ((finalX < -_RightSJudgeOffset) && _showRightSideView)
        {
            CGAffineTransform conT = [self transformWithDirection:RMoveDirectionLeft];
            [UIView beginAnimations:nil context:nil];
            _mainContentView.transform = conT;
            
            [UIView commitAnimations];
            
            _tapGestureRec.enabled = YES;
            _bRightSiderViewShowed = YES;
            return;
        }
        else
        {
            CGAffineTransform oriT = CGAffineTransformIdentity;
            [UIView beginAnimations:nil context:nil];
            _mainContentView.transform = oriT;

            [UIView commitAnimations];
            
            _tapGestureRec.enabled = NO;
            _bLeftSiderViewShowed = NO;
            _bRightSiderViewShowed = NO;
        }
    }
}

#pragma mark -

- (CGAffineTransform)transformWithDirection:(RMoveDirection)direction
{
    CGFloat translateX = 0;
    CGFloat transcale = 0;
    switch (direction) {
        case RMoveDirectionLeft:
            translateX = -_RightSContentOffset;
            transcale = _RightSContentScale;
            break;
        case RMoveDirectionRight:
            translateX = _LeftSContentOffset;
            transcale = _LeftSContentScale;
            break;
        default:
            break;
    }
    
    CGAffineTransform transT = CGAffineTransformMakeTranslation(translateX, 0);
    CGAffineTransform scaleT = CGAffineTransformMakeScale(1.0, transcale);
    CGAffineTransform conT = CGAffineTransformConcat(transT, scaleT);
    
    return conT;
}

- (void)configureViewShadowWithDirection:(RMoveDirection)direction
{
    CGFloat shadowW;
    switch (direction)
    {
        case RMoveDirectionLeft:
            shadowW = 2.0f;
            break;
        case RMoveDirectionRight:
            shadowW = -2.0f;
            break;
        default:
            break;
    }
    
    _mainContentView.layer.shadowOffset = CGSizeMake(shadowW, 1.0);
    _mainContentView.layer.shadowColor = [UIColor blackColor].CGColor;
    _mainContentView.layer.shadowOpacity = 0.8f;
}



@end
