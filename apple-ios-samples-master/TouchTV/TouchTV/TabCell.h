//
//  TabCell.h
//  TouchTV
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTextField.h"
@protocol locate <NSObject>
@end
@interface TabCell : UITableViewCell
@property IBOutlet UIButton *button;
@property IBOutlet UILabel *label;
@property IBOutlet TTextField *editview;
@property id <locate> delegate;
@end
