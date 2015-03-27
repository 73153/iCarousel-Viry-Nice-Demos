//
//  puzzleImageModel.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface puzzleImageModel : NSObject
+ (NSArray*)pathsForImages;
+ (NSArray*)imagesThumbForPuzzle;

+ (NSArray*)pathsForEasyImages;
+ (NSArray*)imagesThumbForEasyPuzzle;

+ (NSArray*)pathsForHardImages;
+ (NSArray*)imagesThumbForHardPuzzle;

+ (UIImage *)scaleImageForThumb:(UIImage *)image;
@end
