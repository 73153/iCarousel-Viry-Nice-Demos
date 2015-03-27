//
//  ViewController.m
//  testCoreData
//
//  Created by broy denty on 14-1-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ViewController.h"
#import "ArInfo.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize context;
- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];//这里需要引进自己项目的委托，是让全局managedObjectContext起作用。
    self.context = delegate.managedObjectContext;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardDidHideNotification object:nil];
//    获取coredata中的context准备数据处理
    ArInfo *arInfo = [NSEntityDescription insertNewObjectForEntityForName:@"ArInfo"inManagedObjectContext:context];
//    获取coredata中一张表的实例
//    写入数据
    arInfo.myid=@"123";
    arInfo.myname=@"object-c";
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"%@",[error localizedDescription]);
    }
//    获取数据
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
//    创建数据容器
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ArInfo"inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
//    获取coredata中的entry放入数据容器中
    NSArray *fetchObject = [context executeFetchRequest:fetchRequest error:&error];
//    获取数据对象读取数据
    for (NSManagedObject *info in fetchObject) {
        NSLog(@"id:%@",[info valueForKey:@"myid"]);
        NSLog(@"name:%@",[info valueForKey:@"myname"]);
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardHide
{
    
}
@end
