//
//  TestTableViewCell.m
//  Tableviewaddcell
//
//  Created by broy denty on 13-7-31.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell
@synthesize button;
@synthesize lable;
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

//+ (TestTableViewCell *) initWithNib
//{
////    self = [super init];
//    TestTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed: [self description] owner: self options: nil] lastObject];
//    
//    return cell;
//}

@end
