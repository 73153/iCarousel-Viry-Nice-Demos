//
//  ViewController.h
//  RefreshTableview
//
//  Created by broy denty on 13-8-14.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{}
@property (strong,nonatomic)NSArray *array;
- (void)reloadTableViewDataSource;
- (void)doneloadingTableViewData;
@end
