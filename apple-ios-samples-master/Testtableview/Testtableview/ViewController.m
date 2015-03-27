//
//  ViewController.m
//  Testtableview
//
//  Created by broy denty on 13-8-1.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"
#import "TableCell.h"

@interface ViewController ()
{
    NSArray *list;
}
@end

@implementation ViewController
@synthesize Mtag ;
- (void)viewDidLoad
{
    Mtag =0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    list = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e", nil];
   
//    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
    
}
- (void)viewDidLayoutSubviews:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    
    NSString *tableIdentifier = @"tableview";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];

        cell.tag = self.Mtag;
        self.Mtag++;
    }
//    cell.selected = YES;
//    cell.highlighted = YES;
    NSLog(@"cell.tag%d",cell.tag);
    NSLog(@"style %@",[tableView cellForRowAtIndexPath:indexPath].selected?@"yes":@"no");
    NSLog(@"style %@",[tableView cellForRowAtIndexPath:indexPath].highlighted?@"yes":@"no");

//    NSUInteger row = indexPath.row;

    //cell =[[[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil] lastObject];
 
//    cell.
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//属于tableview的方法
    [[tableView cellForRowAtIndexPath:indexPath]setHighlighted:NO animated:YES];//属于tableviewcell的方法
    NSLog(@"%d",[tableView cellForRowAtIndexPath:indexPath].tag);
    NSLog(@"%@",[tableView cellForRowAtIndexPath:indexPath].selected?@"yes":@"no");
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return list.count;
}
@end
