//
//  PuzzleViewController.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMGridView.h"
#import "GMGridViewCell.h"
#import "UIView+Toast.h"
#import "ImagePickerViewController.h"
#import "BounceButtonView.h"
#import "ASOBounceButtonView.h"
#import "ASOTwoStateButton.h"
#import "ASOBounceButtonViewDelegate.h"
@interface PuzzleViewController : UIViewController <GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewActionDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ImagePickerSendIndexDelegate,ASOBounceButtonViewDelegate>
@property (strong, nonatomic) IBOutlet GMGridView *gridView;
@property ASOTwoStateButton *homeButton;
@property BounceButtonView *bounceButton;
- (IBAction)checkAction:(id)sender;
- (IBAction)tipAction:(id)sender;
@property (strong, nonatomic)  UIImageView *tipImageVIew;
@property (strong, nonatomic) IBOutlet UIImageView *homeBackgroundView;
@end
