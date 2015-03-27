//
//  PicTitleContentCellTableViewCell.h
//  MyReader
//
//  Created by broy denty on 14-6-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMImageView.h"
#import "UIView+Additions.h"
#import "UIImageView+WebCache.h"
@interface PicTitleContentCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellContext;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end
