//
//  ViewController.h
//  testrefreshview
//
//  Created by broy denty on 13-8-14.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface ViewController : UITableViewController <EGORefreshTableHeaderDelegate,UITableViewDelegate,UITableViewDataSource>
{
    EGORefreshTableHeaderView *headerview ;
    BOOL reloading;
}
- (void)reloadDatasource;
- (void)donereloadTableviewData;
@end
