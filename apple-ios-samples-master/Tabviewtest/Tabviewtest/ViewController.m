//
//  ViewController.m
//  Tabviewtest
//
//  Created by broy denty on 13-7-30.
//  Copyright (c) 2013年 broy denty. All rights reserved.
//
#import <UIKit/UIKit.h> 
#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize list = _list;
//由于当前的Viewcontroller已经在appdelegate中进行了注册，而且已经与相关的nib文件进行了连接，所以会调用viewDidLoad函数，一会在研究如何调用viewDidLoad函数的
- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    NSArray * array = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", nil];
    self.list = array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath//会一个cell一个cell的去执行
{
    NSString * tableidentifier = @"tableidentifier";//制定一个tableview标示符
    UITableViewCell *cell = [tableView 	dequeueReusableCellWithIdentifier:tableidentifier];
    //创建一个cell引用，将这个cell插入到当前tableview中标记为“tableidentifier”的位置上
    if (cell==nil)//如果当前的cell并没有指向任意一个cell实例
    {
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableidentifier];
        //就为当前这个cell申请内存
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.list.count;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.list = nil;
    
}
//这里的numberOfRowsInSection和cellForRowAtIndexPath都是require的属性为什么不去实现也不会报错
@end
