//
//  ViewController.h
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-15.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property UITableViewHeaderFooterView *headerview;
@property NSArray *arrayData1;
@property NSArray *arrayData2;
@end
