//
//  SYMainViewController.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/5/10.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainViewController.h"
#import "SYMainTableViewHelper.h"

@interface SYMainViewController ()

@property (nonatomic, strong) SYMainTableViewHelper * tableViewHelper;

@end

@implementation SYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
    [self _loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setNaviAlpha:0];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self setNaviAlpha:1];
}

- (void)setNaviAlpha:(CGFloat)alpha
{
    for (UIView * view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")])
        {
            for (UIView * subView in view.subviews)
            {
                if ([subView isKindOfClass:NSClassFromString(@"UIVisualEffectView")])
                {
                    subView.alpha = alpha;
                }
            }
        }
    }
}

- (void)_setupUI
{
    self.tableViewHelper = [SYMainTableViewHelper initialize];
    self.tableViewHelper.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTabBarHeight);
    
    [self.view addSubview:self.tableViewHelper.tableView];
}

- (void)_loadData
{
    [SYProgressHUD showProgressWithMsg:@"加载中..."];
    [self.tableViewHelper loadDataWithCompletionHandler:^(id  _Nonnull result, NSError * _Nonnull error) {
        if (!error)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SYProgressHUD hidden];
            });
        }
    }];
}

@end
