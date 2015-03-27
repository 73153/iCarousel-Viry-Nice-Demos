//
//  newViewController.m
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-22.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "newViewController.h"

@interface newViewController ()

@end

@implementation newViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView   
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"location%d",indexPath.row];
    return cell;
}

#pragma mark - uiextableview
-(UITableViewCell<UIExpandingTableViewCell>*)tableView:(UIExpandableTableView *)tableView expandingCellForSection:(NSInteger)section
{
    NSString *identifier = @"uiexcell";
    UITableViewCell<UIExpandingTableViewCell> * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = (UITableViewCell<UIExpandingTableViewCell>*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"section%d",section];
    return cell;
}
-(BOOL)tableView:(UIExpandableTableView *)tableView canExpandSection:(NSInteger)section
{
    return YES;
}
-(BOOL)tableView:(UIExpandableTableView *)tableView needsToDownloadDataForExpandableSection:(NSInteger)section
{
    return YES;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//-(void)loadView
//{
//    self.tableView = [[UIExpandableTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//}

@end
