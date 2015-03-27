//
//  MoreSettingViewController.h
//  MyReader
//
//  Created by broy denty on 14-7-17.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreSettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
@property UIImage *previousImage;
@property (weak, nonatomic) IBOutlet UITableView *m_tableView;
@end
