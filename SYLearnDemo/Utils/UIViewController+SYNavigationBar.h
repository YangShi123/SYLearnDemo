//
//  UIViewController+SYNavigationBar.h
//  BillionsOfAuthentic
//
//  Created by Ivan_Yang on 2016/11/9.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SYNavigationBar)

- (void)setLeftBarButtonWithTitle:(NSString *)title action:(SEL)action;

- (void)setLeftBarButtonWithImageName:(NSString *)imageName action:(SEL)action;

- (void)setRightBarButtonWithTitle:(NSString *)title action:(SEL)action;

- (void)setRightBarButtonWithImageName:(NSString *)imageName action:(SEL)action;

- (void)setBackBarBtn;

- (void)setBackBarBtnAction:(SEL)action;

- (void)setRightBarButtonWithTitle:(NSString *)title titleColor:(UIColor *)color imageName:(NSString *)imageName action:(SEL)action;

@end
