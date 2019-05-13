//
//  SYTabBarController.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/5/10.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYTabBarController.h"
#import "SYMainViewController.h"
#import "SYMineViewController.h"

@interface SYTabBarController ()

@end

@implementation SYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabbar的title 默认图片 选中图片
    NSDictionary * mainDic = @{
                               CYLTabBarItemTitle : @"首页",
                               CYLTabBarItemImage : @"tabbar_首页",
                               CYLTabBarItemSelectedImage : @"tabbar_首页_选中"
                               };
    NSDictionary * mineDic = @{
                               CYLTabBarItemTitle : @"我的主页",
                               CYLTabBarItemImage : @"tabbar_我的",
                               CYLTabBarItemSelectedImage : @"tabbar_我的_选中"
                               };
    self.tabBarItemsAttributes = @[mainDic, mineDic];
    
    //设置tabbar的title默认和选中颜色
    UITabBarItem * tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_2c2c2c} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_1296db} forState:UIControlStateSelected];
    
    //设置tabbar的控制器以及根控制器
    SYMainViewController * mainVC = [[SYMainViewController alloc] init];
    CYLBaseNavigationController * mainNavi = [[CYLBaseNavigationController alloc] initWithRootViewController:mainVC];
    SYMineViewController * mineVC = [[SYMineViewController alloc] init];
    CYLBaseNavigationController * mineNavi = [[CYLBaseNavigationController alloc] initWithRootViewController:mineVC];
    self.viewControllers = @[mainNavi, mineNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
