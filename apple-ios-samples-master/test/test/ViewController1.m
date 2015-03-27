//
//  ViewController1.m
//  test
//
//  Created by broy denty on 13-8-13.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController1.h"
#import "EGORefreshTableHeaderView.h"
@interface ViewController1 ()

@end

@implementation ViewController1
@synthesize headerview;
@synthesize tableview;
@synthesize reloading;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{   
    [super viewDidLoad];
    if (headerview == nil)
    {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
        view.delegate =self;
        [self.tableview addSubview:view];
        self.headerview = view;
    }
    [headerview refreshLastUpdatedDate];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"a";
    return cell;
}
- (void) reloadDatasource
{
    reloading = YES;
    NSLog(@"networking");
}
- (void) donereloadTableViewData
{
    reloading = NO;
    NSLog(@"load data");
    [headerview egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableview];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [headerview egoRefreshScrollViewDidEndDragging:scrollView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [headerview egoRefreshScrollViewDidScroll:scrollView];
}
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self reloadDatasource];
    [self performSelector:@selector(donereloadTableViewData) withObject:nil afterDelay:1];
}
-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return reloading;
}
-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}

@end
