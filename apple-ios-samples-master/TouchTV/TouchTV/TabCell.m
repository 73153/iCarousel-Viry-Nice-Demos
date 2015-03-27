//
//  TabCell.m
//  TouchTV
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "TabCell.h"
#import "TTextField.h"

@implementation TabCell
@synthesize button,editview;
@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
