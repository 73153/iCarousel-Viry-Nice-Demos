//
//  ViewController.m
//  Tableviewaddcell
//
//  Created by broy denty on 13-7-31.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize list;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray * array = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e",@"a",@"b",@"c",@"d",@"e", nil];
    self.list=array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * tableidentifier = @"TestTableViewCell";
    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableidentifier];
    if (cell==nil) {
        cell=[[TestTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableidentifier];
    }
    
       NSUInteger row = indexPath.row;
    cell.textLabel.text = [self.list objectAtIndex:row];
       return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 80.0f;
//}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}
@end
