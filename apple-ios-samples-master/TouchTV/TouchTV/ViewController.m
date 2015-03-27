//
//  ViewController.m
//  TouchTV
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "AppDelegate.h"
#import "TabCell.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize list = _list ,tablevView,list2section,textview;
@synthesize segmentcontroller;
@synthesize  flagarrayMark;
@synthesize flagarrayMark2;
@synthesize flagarrayEdit;
@synthesize flagarrayEdit2;
@synthesize tabcontroller;
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self initdata];
    self.navigationItem.title = @"words";
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setToolbarHidden:YES animated:YES];

//    self.segmentcontroller = [[UISegmentedControl alloc] initWithItems:nil];
//    segmentcontroller.frame = CGRectMake(0, 0, 320, 40);
    segmentcontroller.segmentedControlStyle = UISegmentedControlStylePlain;
    [segmentcontroller insertSegmentWithTitle:@"1" atIndex:0 animated:NO];
    [segmentcontroller insertSegmentWithTitle:@"2" atIndex:1 animated:NO];
    [segmentcontroller insertSegmentWithTitle:@"3" atIndex:2 animated:NO];
    [segmentcontroller removeSegmentAtIndex:3 animated:NO];
    [segmentcontroller removeSegmentAtIndex:3 animated:NO];
    [segmentcontroller setSelectedSegmentIndex:0];
    [segmentcontroller addTarget:self action:@selector(selectedaction:) forControlEvents:UIControlEventValueChanged];
//    [self.navigationController.navigationBar setHidden:YES];

    
    
}
-(void)initdata
{
    
    _list = [[NSMutableArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"f", nil];
    list2section= [[NSMutableArray alloc]initWithObjects:@"g",@"h",@"i",@"j",@"k", nil];
    flagarrayMark = [[NSMutableArray alloc] initWithObjects:@"n",@"n",@"n",@"n",@"n",@"n", @"n", @"n", @"n", nil];
    flagarrayMark2 = [[NSMutableArray alloc] initWithObjects:@"n",@"n",@"n",@"n",@"n",@"n", @"n", @"n", @"n", nil];
    flagarrayEdit = [[NSMutableArray alloc] initWithObjects:@"n",@"n",@"n",@"n",@"n",@"n", @"n", @"n", @"n", nil];
    flagarrayEdit2 = [[NSMutableArray alloc] initWithObjects:@"n",@"n",@"n",@"n",@"n",@"n", @"n", @"n", @"n", nil];
    
}
- (void)viewWillAppear:(BOOL)animated
{
        [self.navigationController setNavigationBarHidden:NO animated:YES];
       //[self initdata];
    //[tablevView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *TVidentifier = @"TVidentifier";
    TabCell *cell = [tableView dequeueReusableCellWithIdentifier:TVidentifier];
    if (cell==nil)
    {
       //cell = [[TabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TVidentifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TabCell" owner:self options:nil] lastObject];
        cell.tag=self.iTag;
        self.iTag ++;
    }
    NSUInteger row = indexPath.row;
    if (indexPath.section == 0) {
            cell.label.text = [_list objectAtIndex:row];
    }else
    {
    cell.label.text = [list2section objectAtIndex:row];
    
    }
  //[cell.button setTitle:[list objectAtIndex:row] forState:UIControlStateNormal];
//    cell.button = [[UIButton alloc] init];
//    [cell.button setTag:indexPath.row];
//    [cell.button addTarget:self action:@selector(onCellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    cell.editview = [[UITextField alloc]init];
    cell.accessoryType = UITableViewCellAccessoryNone;
    if (indexPath.section == 0)
    {
        
        
        if([[flagarrayMark objectAtIndex:row]isEqual:@"y"])
        {
            cell.accessoryType=UITableViewCellAccessoryCheckmark;
        }

    }
    else if (indexPath.section == 1)
    {
        if ([[flagarrayMark2 objectAtIndex:row]isEqual:@"y"])
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    [cell.editview setTag_section:indexPath.section];
    [cell.editview setTag:indexPath.row];
    [cell.editview addTarget:self action:@selector(onFinishedit:) forControlEvents:UIControlEventEditingDidEndOnExit];
//    cell.editview.text = @"11";
    NSLog(@"%d",cell.tag);
    NSLog(@"%@",cell.selected?@"YES":@"NO");
    NSLog(@"%dsection,%drow",indexPath.section,indexPath.row);
    [cell.editview setHidden:NO];
    if (indexPath.section == 0)
    {
        if ([[flagarrayEdit objectAtIndex:row]isEqual:@"y"])
        {
            [cell.editview setHidden:YES];
        }
    }else if (indexPath.section == 1)
    {
        if ([[flagarrayEdit2 objectAtIndex:row]isEqual:@"y"])
        {
            [cell.editview setHidden:YES];
        }
    }
    cell.editview.text=@"";
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        [flagarrayEdit setObject:@"n" atIndexedSubscript:indexPath.row];
    }
    if (indexPath.section == 1)
    {
        [flagarrayEdit2 setObject:@"n" atIndexedSubscript:indexPath.row];
    }
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
//    if(indexPath.section==1)
//    {
//    NSUInteger row = indexPath.row;
//    [self.list2section setObject:@"" atIndexedSubscript:row];
////    [self initdata];
////    [tableView reloadData];
//        
//    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //[[tableView cellForRowAtIndexPath:indexPath] setHighlighted:YES animated:YES];
//    UITableViewCell * cell=[tableView cellForRowAtIndexPath:indexPath];
//     cell.accessoryType=UITableViewCellAccessoryCheckmark;
    if (indexPath.section==0)
    {
            [self.flagarrayMark setObject:@"y" atIndexedSubscript:indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        [self.flagarrayMark2 setObject:@"y" atIndexedSubscript:indexPath.row];
    }

    NSString *string = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;//
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"action" message:string delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    [alertview show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        NextViewController *nextview = [[NextViewController alloc] init];
        [self.navigationController pushViewController:nextview animated:YES];
    }
    [tablevView reloadData];
}
-(IBAction)onCellButtonClick:(id)sender
{
    UIButton *bt=(UIButton*)sender;
    NSLog(@"bt:%d",bt.tag);
    NSIndexPath *indexPah=[NSIndexPath indexPathForRow:bt.tag inSection:0];
    
    TabCell *cell=(TabCell*)[tablevView cellForRowAtIndexPath:indexPah];
    [cell.button setTitle:cell.label.text forState:UIControlStateHighlighted];
    
}
-(IBAction)onFinishedit:(id)sender
{
    // 隐藏键盘.
    [sender resignFirstResponder];
    TTextField *editview = (TTextField *)sender;
//    UITableViewCell *cell = (UITableViewCell *)editview.superview;

    NSInteger * row = (NSInteger *)editview.tag;
    if (editview.tag_section == 0)
    {
        [flagarrayEdit setObject:@"y" atIndexedSubscript:(NSUInteger)row];
        [_list setObject:editview.text atIndexedSubscript:(NSUInteger)row];
    }else if (editview.tag_section ==1)
    {
        [flagarrayEdit2 setObject:@"y" atIndexedSubscript:(NSUInteger)row];
        [list2section setObject:editview.text atIndexedSubscript:(NSUInteger )row];
    }
    

    
    NSLog(@"%@",editview.text);
    [tablevView reloadData];

}
-(IBAction)selectedaction:(id)sender
{
    UISegmentedControl * segmentcontrol = (UISegmentedControl *)sender;
    NSInteger index = segmentcontrol.selectedSegmentIndex;
    UIViewController * targetviewcontroller;
    switch (index) {
        case 0:
//            targetviewcontroller = [[NextViewController alloc] init];
////            [self.navigationController.navigationBar setHidden:YES];

            [self.tablevView setHidden:NO];
            break;
        case 1:
//            targetviewcontroller = [[NextViewController alloc] init];
            [self.tablevView setHidden:YES];
            [self.textview setHidden:NO];
            break;
        case 2:
            [self.tablevView setHidden:YES];
            [self.textview setHidden:YES];
            break;
            //            targetviewcontroller = [[NextViewController alloc] init];
        default:
            break;
    }
//    [self.navigationController pushViewController:targetviewcontroller animated:NO];

//以上是使用segment进行画面跳转，使用navigationController的方式使用画面跳转。
 }


@end
