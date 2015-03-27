//
//  ViewController1.h
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface ViewController1 : UIViewController <UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
@property IBOutlet UITableView *tableview;
@property (strong ,nonatomic) EGORefreshTableHeaderView *headerview;
@property BOOL reloading;
@end
