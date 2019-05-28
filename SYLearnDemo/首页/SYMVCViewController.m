//
//  SYMVCViewController.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/23.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMVCViewController.h"
#import "SYTextViewHelper.h"

@interface SYMVCViewController ()

@property (nonatomic, strong) SYTextViewHelper * textViewHelper;

@end

@implementation SYMVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _setupUI];
    [self _config];
    [self _loadData];
}

- (void)_setupUI
{
    self.textViewHelper = [SYTextViewHelper initialize];
    self.textViewHelper.textView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTopHeight);
    [self.view addSubview:self.textViewHelper.textView];
}

- (void)_config
{
    
}

- (void)_loadData
{
    [SYProgressHUD showProgressWithMsg:@"加载中..."];
    [self.textViewHelper loadDataWithJsonName:@"mvcData" completionHandler:^(SYApiResponse * _Nonnull response) {
        if (response.success)
        {
            [SYProgressHUD hidden];
        }
    }];
}

@end
