//
//  UIView+Category.m
//  MyReader
//
//  Created by broy denty on 14-6-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "UIView+Additions.h"
#define kUIViewNewMessageTagValue -397125
#define kUIViewNewBottomLineTagValue -13711
@implementation UIView (Additions)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)top {
    return self.frame.origin.y;
}


- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (CGFloat)centerX {
    return self.center.x;
}


- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)centerY {
    return self.center.y;
}


- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height {
    return self.frame.size.height;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGPoint)origin {
    return self.frame.origin;
}


- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGSize)size {
    return self.frame.size;
}


- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)originX
{
    return self.frame.origin.x;
}

- (void)setOriginX:(CGFloat)originX
{
    [self setOrigin:CGPointMake(originX, self.frame.origin.y)];
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY
{
    [self setOrigin:CGPointMake(self.frame.origin.x, originY)];
}

- (BOOL)isVisible
{
    return !self.isHidden;
}

- (void)setVisible:(BOOL)visible
{
    self.hidden = !visible;
}

- (void) roundOffFrame{
	self.frame = CGRectMake((NSInteger)self.frame.origin.x, (NSInteger)self.frame.origin.y, (NSInteger)self.frame.size.width, (NSInteger)self.frame.size.height);
}

+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius{
	CGContextRef context = UIGraphicsGetCurrentContext();
    
	
	CGRect rrect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
    
	CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
	CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
	CGContextMoveToPoint(context, minx, midy);
	CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
	CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
	CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
	CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
	CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathFill);
}

- (void)showBadge
{
    [self showBadgeWithFrame:CGRectMake(self.frame.size.width-10, 0, 7, 7)];
}

- (void)showBadgeWithOffsetTop:(CGFloat)top right:(CGFloat)right
{
    CGRect rect = CGRectMake(self.frame.size.width-right-10, top, 7, 7);
    [self showBadgeWithFrame:rect];
}

- (void)showBadgeWithFrame:(CGRect)rect
{
    UIImageView *imageView = (UIImageView*)[self viewWithTag:kUIViewNewMessageTagValue];
    if (!imageView) {
        UIImage *image = [UIImage imageNamed:@"circle_mark_bg"];
        imageView = [[UIImageView alloc]initWithFrame:rect];
        [imageView setTag:kUIViewNewMessageTagValue];
        [imageView setImage:image];
        [self addSubview:imageView];
        [self bringSubviewToFront:imageView];
    }else{
        [imageView setHidden:NO];
        [self bringSubviewToFront:imageView];
    }
}

- (void)hiddenBadge
{
    UIImageView *imageView = (UIImageView*)[self viewWithTag:kUIViewNewMessageTagValue];
    if (imageView) {
        [imageView setHidden:YES];
    }
}

- (void)showBottomLineWithLeftMargin:(CGFloat)leftMargin
{
    UIImageView *imageView = (UIImageView*)[self viewWithTag:kUIViewNewBottomLineTagValue];
    imageView = imageView ? imageView : [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:@"line_bottom"];
    imageView.originX = leftMargin;
    imageView.originY = self.height - 1.0f;
    imageView.height = 1.0f;
    imageView.width = self.width - leftMargin;
    [imageView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth];
    imageView.tag = kUIViewNewBottomLineTagValue;
    imageView.image = image;
    if (imageView.superview!=self) {
        [self addSubview:imageView];
    }
}

- (void)hiddenBottomLine
{
    UIImageView *imageView = (UIImageView*)[self viewWithTag:kUIViewNewBottomLineTagValue];
    if (imageView) {
        [imageView removeFromSuperview];
    }
}
@end
