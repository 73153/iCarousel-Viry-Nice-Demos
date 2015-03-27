//
//  UIImage+additions.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-18.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (additions)
- (UIImage *)resizableImageWithOffsetTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

- (UIImage *)getScaledImage:(CGFloat) fscale;

- (UIImage *)getSubImage:(CGRect)rect;

- (UIImage*)scaleToSize:(CGSize)size;

+ (UIImage *)imageWithUIView:(UIView *)view;
@end
