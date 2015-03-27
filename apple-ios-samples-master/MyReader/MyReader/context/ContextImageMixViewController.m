//
//  ContextViewController.m
//  MyReader
//
//  Created by broy denty on 14-6-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ContextImageMixViewController.h"
#import "ContextImageMixTableViewCell.h"

@interface ContextImageMixViewController ()
{
    UITableView *m_tableView;
}
@end

@implementation ContextImageMixViewController

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
    m_tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContextImageMixTableViewCell";
    ContextImageMixTableViewCell * aContextImageMixTableViewCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (aContextImageMixTableViewCell == nil) {
        aContextImageMixTableViewCell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] lastObject];
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

@end
