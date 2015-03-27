//
//  LocalAlbumViewController.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-18.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PuzzleViewController.h"
@interface LocalAlbumViewController : UIViewController <GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewActionDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet GMGridView *albumView;
@property (strong, nonatomic) IBOutlet UIImageView *albumBackGroundView;

@end
