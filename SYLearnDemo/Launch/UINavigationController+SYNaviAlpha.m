//
//  UINavigationController+SYNaviAlpha.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/28.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "UINavigationController+SYNaviAlpha.h"

@implementation UINavigationController (SYNaviAlpha)
//疑惑：在APPdelegate中设置[[UINavigationBar appearance] setShadowImage:[UIImage new]]后，进入页面透明无效
- (void)setNaviAlpha:(CGFloat)alpha
{
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    if (self.navigationBar.isTranslucent)
    {
        if (backgroundImageView != nil && backgroundImageView.image != nil)
        {
            barBackgroundView.alpha = alpha;
        }
        else
        {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil)
            {
                backgroundEffectView.alpha = alpha;
            }
        }
    }
    else
    {
        barBackgroundView.alpha = alpha;
    }
    backgroundImageView.alpha = alpha;
}

@end
