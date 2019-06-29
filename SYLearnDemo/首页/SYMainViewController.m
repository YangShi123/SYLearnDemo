//
//  SYMainViewController.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/5/10.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainViewController.h"
#import "SYMainTableViewHelper.h"
#import "SYMVCViewController.h"
#import "SYNaviViewController.h"
#import "SYLockViewController.h"

@interface SYMainViewController ()

@property (nonatomic, strong) SYMainTableViewHelper * tableViewHelper;

@end

@implementation SYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupUI];
    [self _config];
    [self _loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
    [self.tableViewHelper loadDataWithCompletionHandler:^(SYApiResponse * _Nonnull response) {
        if (response.success)
        {
            [SYProgressHUD hidden];
        }
    }];
}

- (void)_config
{
    SYWeakSelf(self);
    self.tableViewHelper.tableViewHandler = ^(NSIndexPath * _Nonnull indexPath) {
        switch (indexPath.row)
        {
            case 0://mvc
            {
                SYMVCViewController * vc = [[SYMVCViewController alloc] init];
                vc.title = @"MVC设计模式";
                [weakself.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1://navi
            {
                SYNaviViewController * vc = [[SYNaviViewController alloc] init];
                [weakself.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                SYLockViewController * vc = [[SYLockViewController alloc] init];
                [weakself.navigationController pushViewController:vc animated:YES];
            }
                
            default:
                break;
        }
    };
}

@end
