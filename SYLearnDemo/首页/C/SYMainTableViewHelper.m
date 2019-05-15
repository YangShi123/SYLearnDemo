//
//  SYMainTableViewHelper.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainTableViewHelper.h"
#import "SYMainTableViewCell.h"
#import "SYMainModel.h"
#import <TYCyclePagerView.h>

@interface SYMainTableViewHelper ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, copy) NSArray <SYMainModel *> * dataSource;

@end

@implementation SYMainTableViewHelper

+ (instancetype)initialize
{
    return [[SYMainTableViewHelper alloc] init];
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[SYMainTableViewCell class] forCellReuseIdentifier:@"cell"];
        self.tableView.tableFooterView = [UIView new];
    }
    return self;
}

#pragma mark - UITableViewDelegate / UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SYMainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

- (void)loadDataWithCompletionHandler:(NetworkCompletionHandler)handler
{
    NSError * error;
    !handler ?: handler(@{}, error);
}

@end
