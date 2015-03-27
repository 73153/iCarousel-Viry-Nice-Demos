//
//  ImagePickerViewController.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoverFlowView.h"
#import "BounceButtonView.h"
#import "ASOBounceButtonView.h"
#import "ASOTwoStateButton.h"
#import "ASOBounceButtonViewDelegate.h"
@protocol ImagePickerSendIndexDelegate <NSObject>

- (NSInteger)sendIndexOfImage:(NSInteger) index Type:(NSString *) type;

@end
@interface ImagePickerViewController : UIViewController <CoverFlowViewActionDelegate,ASOBounceButtonViewDelegate>
@property NSArray *imageArray;
@property id<ImagePickerSendIndexDelegate> sendIndexDelegate;
@property ASOTwoStateButton *homeButton;
@property BounceButtonView *bounceButtons;
@end
