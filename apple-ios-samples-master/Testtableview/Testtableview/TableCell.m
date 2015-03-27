//
//  TableCell.m
//  Testtableview
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell
@synthesize button;
@synthesize label;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //[[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
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
- (IBAction)onclick:(id)sender
{
    button.titleLabel.text = @"onclick";
    label.text=@"click";
}
-(IBAction)longclick:(id)sender
{
    label.text=@"long";
}
@end
