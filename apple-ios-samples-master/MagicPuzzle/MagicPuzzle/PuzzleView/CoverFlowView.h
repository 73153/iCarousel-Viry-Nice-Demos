//
//  CoverFlowView.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@protocol CoverFlowViewActionDelegate <NSObject>

- (NSInteger)selectImageIndex:(NSInteger) index;

@end

@interface CoverFlowView : UIView <iCarouselDataSource,iCarouselDelegate>
@property NSArray *puzzleArray;
@property id<CoverFlowViewActionDelegate> selectDelegate;
@property iCarouselType displayType;
- (void)refreshData;
@end
