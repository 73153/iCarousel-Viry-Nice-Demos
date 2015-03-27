//
//  newViewController.m
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-22.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "newViewController.h"

@interface newViewController ()
{
    UITableView *m_tableview;
}
@end

@implementation newViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"section %d",section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"row %d",indexPath.row];
    return cell;
}
#pragma mark - uiextableview
-(UITableViewCell<UIExpandingTableViewCell>*)tableView:(UIExpandableTableView *)tableView expandingCellForSection:(NSInteger)section
{
    NSString * identifier = @"excell";
    newCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[newCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"section %d",section];
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    m_tableview = [[UIExpandableTableView alloc] initWithFrame:CGRectMake(0, 0, 320, 380)];
    m_tableview.dataSource=self;
    m_tableview.delegate = self;
    [self.view addSubview:m_tableview];
//    // Do any additional setup after loading the view.
}
-(BOOL)tableView:(UIExpandableTableView *)tableView needsToDownloadDataForExpandableSection:(NSInteger)section
{
    return NO;
}
-(BOOL)tableView:(UIExpandableTableView *)tableView canExpandSection:(NSInteger)section
{
    return YES;
}
- (void)tableView:(UIExpandableTableView *)tableView downloadDataForExpandableSection:(NSInteger)section
{
    // download your data here
    // call [tableView expandSection:section animated:YES]; if download was successful
    // call [tableView cancelDownloadInSection:section]; if your download was NOT successful
}

//- (BOOL)tableView:(UIExpandableTableView *)tableView isSectionExpand:(NSInteger)section
//{
//    if (section == 0)
//    {
//        return YES;
//    }else
//    {
//        return NO;
//    }
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
