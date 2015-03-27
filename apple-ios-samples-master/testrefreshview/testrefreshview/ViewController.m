//
//  ViewController.m
//  testrefreshview
//
//  Created by broy denty on 13-8-14.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (headerview == nil)
    {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
        //申请一个headerView对象
        view.delegate = self;
        //设置当前类为headerView的代理
        [self.tableView addSubview:view];
        //将当前tableview中的headerView设置为view 
        headerview = view;
    }
    //加载刷新上次数据
    [headerview refreshLastUpdatedDate];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- tableviewDatasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"section %i",section+1];
}
#pragma mark -- reloading doing
-(void)reloadDatasource
{
    reloading = YES;
    //进行数据网络请求
    NSLog(@"network");
}
-(void)donereloadTableviewData
{
    reloading = NO;
    NSLog(@"load data");
    //完成请求，准备向tableview中添加数据
    [headerview egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}
#pragma mark -- scrollview setting
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [headerview egoRefreshScrollViewDidScroll:scrollView];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [headerview egoRefreshScrollViewDidEndDragging:scrollView];
    
}
#pragma mark -- ego delegate
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    //在触发刷新功能中会调用请求数据内容函数
    [self reloadDatasource];//网络请求操作
    [self performSelector:@selector(donereloadTableviewData)withObject:nil afterDelay:1.0];
}
-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
        NSLog(@"reloading %d",reloading);
    return reloading;

}
-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}
@end
