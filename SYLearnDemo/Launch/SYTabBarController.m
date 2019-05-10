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
    
    
}

- (instancetype)init
{
    if (self = [super init])
    {
        CYLTabBarController * tabBarController = [[CYLTabBarController alloc] initWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributes];
        return (SYTabBarController *)tabBarController;
    }
    return self;
}

- (NSArray<UIViewController *> *)viewControllers
{
    SYMainViewController * mainVC = [[SYMainViewController alloc] init];
    CYLBaseNavigationController * mainNavi = [[CYLBaseNavigationController alloc] initWithRootViewController:mainVC];
    SYMineViewController * mineVC = [[SYMineViewController alloc] init];
    CYLBaseNavigationController * mineNavi = [[CYLBaseNavigationController alloc] initWithRootViewController:mineVC];
    return @[mainNavi, mineNavi];
}

- (NSArray<NSDictionary *> *)tabBarItemsAttributes
{
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
    return @[mainDic, mineDic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
