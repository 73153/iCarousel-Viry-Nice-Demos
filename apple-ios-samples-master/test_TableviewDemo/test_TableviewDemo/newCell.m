//
//  newCell.m
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-22.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "newCell.h"

@implementation newCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setLoading:(BOOL)loading
{
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setExpansionStyle:(UIExpansionStyle)style animated:(BOOL)animated
{
    
}

@end
