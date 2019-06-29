//
//  SYLockViewController.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/6/29.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYLockViewController.h"
#import "SYFingerLockView.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface SYLockViewController ()

@property (nonatomic, strong) SYFingerLockView * fingerLockView;

@end

@implementation SYLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.fingerLockView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.fd_interactivePopDisabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.fd_interactivePopDisabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SYFingerLockView *)fingerLockView
{
    if (!_fingerLockView)
    {
        _fingerLockView = [[SYFingerLockView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _fingerLockView.center = self.view.center;
    }
    return _fingerLockView;
}

@end
