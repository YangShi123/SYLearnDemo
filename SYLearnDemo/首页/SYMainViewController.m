//
//  SYMainViewController.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/5/10.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainViewController.h"

@interface SYMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setNaviAlpha:0];
}

- (void)setNaviAlpha:(CGFloat)alpha
{
    for (UIView * view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")])
        {
            for (UIView * subView in view.subviews)
            {
                subView.alpha = alpha;
//                if ([subView isKindOfClass:NSClassFromString(@"UIVisualEffectView")])
//                {
//                    subView.alpha = alpha;
//                }
            }
        }
    }
}

- (void)_setupUI
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDelegate / UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

@end
