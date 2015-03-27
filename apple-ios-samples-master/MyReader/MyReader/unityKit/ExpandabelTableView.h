//
//  ExpandabelTableView.h
//  MyReader
//
//  Created by broy denty on 14-6-10.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ExpandabelTableViewDelegate <NSObject>

- (void)expandabelTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath WithDataArray:(NSArray *)dataArray;
- (void)expandAnimationStart;
- (void)expandAnimationStop;
@optional
- (void)expandabelTableViewDidScroll:(UIScrollView *)scrollView;
- (void)expandabelTableViewWillScroll:(UIScrollView *)scrolView;
- (NSArray*)arrayOfChildCell;
@end

@protocol ExpandabelTableViewDataSource <NSObject>

- (NSInteger)numberOfSectionsInExpandableTableView:(UITableView *)tableView;
- (NSInteger)expandabelTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell*)tableView:(UITableView *)tableView MainCellForRowAtIndexPath:(NSIndexPath *)indexPath WithDataArray:(NSArray *)dataArray;
- (UITableViewCell*)tableView:(UITableView *)tableView ChildCellForRowAtIndexPath:(NSIndexPath *)indexPath WithDataArray:(NSArray *)dataArray;

@end
@interface ExpandabelTableView : UITableView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) id <ExpandabelTableViewDataSource> expandableDataSource;
@property (nonatomic,weak) id <ExpandabelTableViewDelegate> expandableDelegate;

- (void)loadDataArray:(NSArray *) array;
@end
