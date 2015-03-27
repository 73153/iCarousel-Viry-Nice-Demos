//
//  PicTitleContentCellTableViewCell.m
//  MyReader
//
//  Created by broy denty on 14-6-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "PicTitleContentCellTableViewCell.h"

@implementation PicTitleContentCellTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"PicTitleContentCellTableViewCell" owner:self options:nil] lastObject];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
