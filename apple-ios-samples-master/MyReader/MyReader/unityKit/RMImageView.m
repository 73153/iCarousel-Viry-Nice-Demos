//
//  RMImageView.m
//  MyReader
//
//  Created by broy denty on 14-6-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RMImageView.h"

@implementation RMImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.5f;
    self.layer.cornerRadius = 2.0f;
}

@end
