//
//  UIView+Category.h
//  MyReader
//
//  Created by broy denty on 14-6-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)
/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Shortcut for frame.origin.x
 */
@property (nonatomic) CGFloat originX;

/**
 * Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat originY;

/**
 *  !hidden
 */
@property (nonatomic, getter=isVisible) BOOL visible;

- (void) roundOffFrame;

// DRAW ROUNDED RECTANGLE
+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius;

//UIView's Badge
- (void)showBadge;
- (void)showBadgeWithOffsetTop:(CGFloat)top right:(CGFloat)right;
- (void)showBadgeWithFrame:(CGRect)rect;
- (void)hiddenBadge;

// UIView Lines
- (void)showBottomLineWithLeftMargin:(CGFloat)leftMargin;
- (void)hiddenBottomLine;
@end
