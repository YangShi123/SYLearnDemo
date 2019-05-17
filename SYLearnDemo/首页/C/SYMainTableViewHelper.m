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
#import "SYCycleViewHelper.h"

@interface SYMainTableViewHelper ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, copy) NSArray <SYMainModel *> * dataSource;

@property (nonatomic, strong) SYCycleViewHelper * cycleViewHelp;

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
        self.cycleViewHelp = [SYCycleViewHelper initialize];
        self.cycleViewHelp.cycleView.frame = CGRectMake(0, 0, kScreenWidth, 100);
        self.tableView.tableHeaderView = self.cycleViewHelp.cycleView;
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
    [SYApiManager getMainWithHandler:^(SYApiResponse * _Nonnull response) {
        if (response.success)
        {
            [self reloadTableViewWithData:response.resultValue];
        }
        else
        {
            //do ...
        }
        handler(response);
    }];
}

- (void)reloadTableViewWithData:(NSDictionary *)data
{
    self.cycleViewHelp.datas = data[@"images"];
    [self.tableView reloadData];
    [self.cycleViewHelp.cycleView reloadData];
}

@end
