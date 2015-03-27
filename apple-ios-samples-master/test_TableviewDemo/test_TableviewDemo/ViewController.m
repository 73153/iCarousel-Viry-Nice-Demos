//
//  ViewController.m
//  test_TableviewDemo
//
//  Created by broy denty on 13-8-15.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"
#import "Next_ViewController.h"
@interface ViewController ()
@property IBOutlet UITableView * tableview;
@property IBOutlet UIView * tableheaderview;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property UIImage *image;
@end

@implementation ViewController
@synthesize arrayData1;
@synthesize arrayData2;
@synthesize headerview;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrayData1 = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h", nil];
    self.arrayData2 = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H", nil];
    headerview.textLabel.text = @"abc";
    self.label.text = @"header";
    self.tableview.tableHeaderView = self.tableheaderview;
    
//    [self.view addSubview:headerview];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData1.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString  *indentifier = nil;//[NSString stringWithFormat: @"Cell%d", indexPath.row];//@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [self.arrayData1 objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = [self.arrayData2 objectAtIndex:indexPath.row];
    }else
    {
        NSLog(@"error");
    }
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    self.image = [UIImage imageNamed:@"pic"];
    [cell setImage:self.image];
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"section %d",section];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
//    [tableView deselectRowAtIndexPath :indexPath animated:YES];
//    NSIndexPath *index = [NSIndexPath indexPathForItem: indexPath.row + 1 inSection: indexPath.section];
//    
//    [[tableView cellForRowAtIndexPath:index] setSelected: YES];
    
     Next_ViewController *nextVC = [[Next_ViewController alloc] initWithNibName:@"Next_ViewController" bundle:nil];
    [self.navigationController pushViewController:nextVC animated:YES];
}
@end
