//
//  CoverFlowView.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "CoverFlowView.h"
#import "iCarousel.h"
#import "SWSnapshotStackView.h"
@implementation CoverFlowView
{
    iCarousel *m_CoverFlow;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    m_CoverFlow = [[iCarousel alloc] initWithFrame:self.frame];
    [self addSubview:m_CoverFlow];
    [m_CoverFlow setDataSource:self];
    [m_CoverFlow setDelegate:self];
    [m_CoverFlow setType:self.displayType];

}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.puzzleArray.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view;
{
    if (index < self.puzzleArray.count) {
        if (view == nil)
        {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 300, 500)];
            SWSnapshotStackView *imageStackView = [[SWSnapshotStackView alloc] initWithFrame:CGRectMake(10, 110, 280, 280)];
            [imageStackView setTag:101];
            [view addSubview:imageStackView];
            //        [imageStackView setDisplayAsStack:YES];
        }
        SWSnapshotStackView *imageStackView = (SWSnapshotStackView *)[view viewWithTag:101];
        [imageStackView setContentMode:UIViewContentModeScaleAspectFit];
        imageStackView.image = [self.puzzleArray objectAtIndex:index];
        //    [imageStackView setBackgroundColor:[UIColor redColor]];
        
        
    }
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    [self.selectDelegate selectImageIndex:index];
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
        NSLog(@"%d",carousel.currentItemIndex);
}

- (void)refreshData
{
    [UIView beginAnimations:nil context:nil];
    [m_CoverFlow setType:self.displayType];
    [m_CoverFlow reloadData];
    [UIView commitAnimations];
}
@end
