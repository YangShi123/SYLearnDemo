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

@property (nonatomic, strong) NSMutableArray <SYMainModel *> * dataSource;

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SYMainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    SYMainModel * model = self.dataSource[indexPath.row];
    cell.name = model.name;
    cell.title = model.title;
    cell.contentTitle = model.content;
    cell.authorText = [NSString stringWithFormat:@"作者:%@", model.author];
    cell.readText = [NSString stringWithFormat:@"阅读:%@", model.readCount];
    cell.likeBtnText = model.likeCount;
    cell.isLike = model.isLike;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    !self.tableViewHandler ?: self.tableViewHandler(indexPath);
}

- (void)loadDataWithCompletionHandler:(NetworkCompletionHandler)handler
{
    [SYApiManager getDataWithJsonName:@"mainData" handler:^(SYApiResponse * _Nonnull response) {
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
    for (NSDictionary * dic in data[@"contents"])
    {
        SYMainModel * model = [[SYMainModel alloc] initWithDic:dic];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
    [self.cycleViewHelp.cycleView reloadData];
}

- (NSMutableArray<SYMainModel *> *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
