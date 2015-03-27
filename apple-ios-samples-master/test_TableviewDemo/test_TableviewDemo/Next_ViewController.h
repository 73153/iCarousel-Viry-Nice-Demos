//
//  Next_ViewController.h
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-15.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface Next_ViewController : UITableViewController<EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *headerview ;
    BOOL reloading;
}
@property NSMutableArray *arraydata;
-(void)reloadData;
-(void)doneloadDate;
@end
