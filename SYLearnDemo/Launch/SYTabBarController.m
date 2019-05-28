//
//  SYTabBarController.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/5/10.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYTabBarController.h"
#import "SYMainViewController.h"
#import "SYExchangeViewController.h"
#import "SYMineViewController.h"
#import "SYNavigationController.h"

@interface SYTabBarController ()

@property (nonatomic, strong) NSMutableArray * tarBarItems;

@end

@implementation SYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configTabBarWithViewController:[[SYMainViewController alloc] init] title:@"首页"];
    [self configTabBarWithViewController:[[SYExchangeViewController alloc] init] title:@"交流"];
    [self configTabBarWithViewController:[[SYMineViewController alloc] init] title:@"我的"];
    self.viewControllers = [self.tarBarItems copy];
}

- (void)configTabBarWithViewController:(UIViewController *)viewController title:(NSString *)title
{
    SYNavigationController * navi = [[SYNavigationController alloc] initWithRootViewController:viewController];
    navi.tabBarItem.title = title;
    navi.navigationBar.barTintColor = COLOR_1296db;
    [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_2c2c2c} forState:UIControlStateNormal];
    [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_1296db} forState:UIControlStateSelected];
    [navi.tabBarItem setImage:[[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@", title]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navi.tabBarItem setSelectedImage:[[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_选中", title]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self.tarBarItems addObject:navi];
}

- (NSMutableArray *)tarBarItems
{
    if (!_tarBarItems)
    {
        _tarBarItems = [NSMutableArray array];
    }
    return _tarBarItems;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
