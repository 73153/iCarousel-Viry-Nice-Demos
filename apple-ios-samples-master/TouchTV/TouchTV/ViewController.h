//
//  ViewController.h
//  TouchTV
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabCell.h"
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tablevView;
@property NSMutableArray *list;
@property NSMutableArray *list2section;
@property IBOutlet UINavigationItem *item;
@property IBOutlet UISegmentedControl *segmentcontroller;
@property (assign,nonatomic) NSInteger iTag;
@property NSMutableArray *flagarrayMark;
@property NSMutableArray *flagarrayMark2;
@property NSMutableArray *flagarrayEdit;
@property NSMutableArray *flagarrayEdit2;
@property IBOutlet TabCell * cell;
@property IBOutlet UITextView *textview;
@property UITabBarController *tabcontroller;
- (IBAction)TextField_DidEndOnExit:(id)sender;
-(IBAction)selectedaction:(id)sender;
@end
