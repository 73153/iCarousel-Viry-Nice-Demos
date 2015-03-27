//
//  Next_ViewController.m
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-15.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "Next_ViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "newViewController.h"
@interface Next_ViewController ()

@end

@implementation Next_ViewController
@synthesize arraydata;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arraydata = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"11",@"12",@"13",@"14",@"15",@"16",nil];
    if (headerview == nil)
    {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
        view.delegate = self;
        [self.tableView addSubview:view];
        headerview = view;
    }
    [headerview refreshLastUpdatedDate];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadData
{
    reloading = YES;
}
-(void)doneloadDate
{
    reloading = NO;
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
    [self reloadData];//网络请求操作
    [self performSelector:@selector(doneloadDate)withObject:nil afterDelay:1.0];
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
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return arraydata.count+1;
}
-(void)profomecell
{

//    [self performSelector:@selector(lastcell_dl) withObject:nil afterDelay:3];
    [self lastcell];
}
- (void)lastcell_dl
{
    for (NSInteger i =0 ; i<3; i++)
    {
        [arraydata addObject:[NSString stringWithFormat:@"%d",i+3]];
    }
    [self.tableView reloadData];
}
- (void)lastcell
{
    for (NSInteger i=0; i<3; i++) {
    [arraydata addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.tableView reloadData];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if (indexPath.row == arraydata.count)
    {
        cell.textLabel.text =@"loading";
        [self profomecell];
    }
    else
    {
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
//    Configure the cell...
//    cell.textLabel.text = [self.arraydata objectAtIndex:indexPath.row];
        cell.textLabel.text = [arraydata objectAtIndex:indexPath.row];
    }
        return cell;

    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.arraydata removeObjectAtIndex:indexPath.row ];
    [self.tableView reloadData];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    newViewController *new = [[newViewController alloc] init];
    [self.navigationController pushViewController:new animated:YES];
}

@end
