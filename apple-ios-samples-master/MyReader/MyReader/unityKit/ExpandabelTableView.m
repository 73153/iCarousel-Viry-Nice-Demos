//
//  ExpandabelTableView.m
//  MyReader
//
//  Created by broy denty on 14-6-10.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ExpandabelTableView.h"

@implementation ExpandabelTableView
{
    NSMutableArray *m_dataArray;
    NSMutableArray *m_expandableFlagArray;
    NSMutableArray *m_newCellArray;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        m_expandableFlagArray = [[NSMutableArray alloc] init];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellForRowAtIndexPath:indexPath].frame.size.height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.expandableDataSource numberOfSectionsInExpandableTableView:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (m_dataArray.count>0) {
        return m_dataArray.count;
    }else
    {
        return [self.expandableDataSource expandabelTableView:self numberOfRowsInSection:section];
    }

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![[m_expandableFlagArray objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        return [self.expandableDataSource tableView:self MainCellForRowAtIndexPath:indexPath WithDataArray:m_dataArray];
    }else
    {
        return [self.expandableDataSource tableView:self ChildCellForRowAtIndexPath:indexPath WithDataArray:m_dataArray];
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[m_expandableFlagArray objectAtIndex:indexPath.row] isEqualToString:@"1"])
    {
        [self expendCellWithIndex:indexPath];
    }
    else if([[m_expandableFlagArray objectAtIndex:indexPath.row] isEqualToString:@"2"])
    {
        [self closeCellWithIndex:indexPath];
    }
    else
    {
        [self.expandableDelegate expandabelTableView:self didSelectRowAtIndexPath:indexPath WithDataArray:m_dataArray];
    }
}

-(void)dealloc
{
    self.delegate = nil;
    self.dataSource = nil;
}

- (void)expendCellWithIndex:(NSIndexPath *)indexPath
{
    [m_expandableFlagArray setObject:@"2" atIndexedSubscript:indexPath.row];
    [self.expandableDelegate expandAnimationStart];
    [self downloadDataForExpandableCellWithIndex:indexPath];
}

- (void)downloadDataForExpandableCellWithIndex:(NSIndexPath *)indexPath
{
    dispatch_queue_t aQueue = dispatch_queue_create("DownLoadChildCellData", DISPATCH_QUEUE_SERIAL);
    dispatch_async(aQueue, ^{
        //NETWORK REQUEST
        NSArray *newCellArray = [self.expandableDelegate arrayOfChildCell];
        dispatch_async(dispatch_get_main_queue(), ^{
            if(newCellArray.count>0)
            {
                for (int i = 0; i<newCellArray.count; i++) {
                    [m_expandableFlagArray insertObject:@"0" atIndex:indexPath.row+1+i];
                }
                NSIndexSet * indexSet=[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1,newCellArray.count)];//创建 NSIndexSet对象的方法
                [m_dataArray insertObjects:newCellArray atIndexes:indexSet];
                NSInteger newRowCount = [newCellArray count];
                [self beginUpdates];
                NSMutableArray *insertArray = [NSMutableArray array];
                for (int i = 1; i <=newRowCount; i++)
                {
                    [insertArray addObject:[NSIndexPath indexPathForRow:indexPath.row+i inSection:indexPath.section]];
                }
                [self insertRowsAtIndexPaths:insertArray withRowAnimation:UITableViewRowAnimationMiddle];
                [self endUpdates];
                [self scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
                [self reloadData];
                [self.expandableDelegate expandAnimationStop];
            }
            else
            {
                /*数据错误*/
                [self.expandableDelegate expandAnimationStop];
            }

        });
    });
    

}

- (void)closeCellWithIndex:(NSIndexPath *)indexPath
{
//    [self reloadData];
    [m_expandableFlagArray setObject:@"1" atIndexedSubscript:indexPath.row];
    //            关闭展开cell
    NSInteger newRowCount  = 0;
    for (int i = indexPath.row+1; i<m_expandableFlagArray.count; i++) {
        if ([[m_expandableFlagArray objectAtIndex:i] isEqualToString:@"0"])
        {
            newRowCount=newRowCount+1;
        }else
        {
            break;
        }
    }
    
    [m_dataArray removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, newRowCount)]];
    [m_expandableFlagArray removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, newRowCount)]];
    [self beginUpdates];
    
    NSMutableArray *deleteArray = [NSMutableArray array];
    for (int i = 1; i <=newRowCount; i++) {
        [deleteArray addObject:[NSIndexPath indexPathForRow:indexPath.row+i inSection:indexPath.section]];
    }
    [self deleteRowsAtIndexPaths:deleteArray withRowAnimation:UITableViewRowAnimationMiddle];
    [self endUpdates];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
    [self reloadData];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.expandableDelegate respondsToSelector:@selector(expandabelTableViewDidScroll:)])
    {
        [self.expandableDelegate expandabelTableViewDidScroll:scrollView];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([self.expandableDelegate respondsToSelector:@selector(expandabelTableViewWillScroll:)])
    {
        [self.expandableDelegate expandabelTableViewWillScroll:scrollView];
    }
}

- (void)loadDataArray:(NSArray *) array
{
    m_dataArray = [array mutableCopy];
    for (int location = 0; location<array.count; location++) {
        [m_expandableFlagArray addObject:[NSString stringWithFormat:@"1"]];
    }
}
@end
