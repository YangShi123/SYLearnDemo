//
//  SYNavigationController.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/23.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYNavigationController.h"

@implementation SYNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count >= 1)
    {
        [viewController setBackBarBtn];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [super pushViewController:viewController animated:animated];
}

@end
