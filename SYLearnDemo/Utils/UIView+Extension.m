//
//  UIView+Extension.m
//  shengxiao2_new
//
//  Created by wenjiepeng on 2018/7/23.
//  Copyright © 2018年 Ivan. All rights reserved.
//

#import "UIView+Extension.h"


//IB_DESIGNABLE
@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setKCornerRadius:(CGFloat)kCornerRadius
{
    self.layer.cornerRadius = kCornerRadius;
}

- (void)setKBorderWidth:(CGFloat)kBorderWidth
{
    self.layer.borderWidth = kBorderWidth;
}

- (void)setKBorderColor:(UIColor *)kBorderColor
{
    self.layer.borderColor = kBorderColor.CGColor;
}

- (void)setKMasksToBounds:(BOOL)kMasksToBounds
{
    self.layer.masksToBounds = kMasksToBounds;
}

@end
