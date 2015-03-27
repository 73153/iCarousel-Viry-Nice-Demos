//
//  TableCell.h
//  Testtableview
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
@property IBOutlet UIButton *button;
-(IBAction)onclick:(id)sender;
@property IBOutlet  UILabel *label;
-(IBAction)longclick:(id)sender;
@end
