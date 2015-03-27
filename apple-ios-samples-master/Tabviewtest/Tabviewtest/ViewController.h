//
//  ViewController.h
//  Tabviewtest
//
//  Created by broy denty on 13-7-30.
//  Copyright (c) 2013年 broy denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController < UITableViewDelegate , UITableViewDataSource>

@property (strong, nonatomic) NSArray *list;
@end
