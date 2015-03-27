//
//  ViewController3.h
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface ViewController3 : UITableViewController<EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView * headerV;
    BOOL reloading;
}
-(void)reloadData;
-(void)reloadingData;
@end
