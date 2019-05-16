//
//  SYCycleViewHelper.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/16.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYCycleViewHelper.h"
#import "SYCycleCollectionViewCell.h"


@interface SYCycleViewHelper ()<TYCyclePagerViewDelegate, TYCyclePagerViewDataSource>

@property (nonatomic, strong) TYCyclePagerView * cycleView;



@end

@implementation SYCycleViewHelper

+ (instancetype)initialize
{
    return [[SYCycleViewHelper alloc] init];
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.cycleView = [[TYCyclePagerView alloc] initWithFrame:CGRectZero];
        self.cycleView.dataSource = self;
        self.cycleView.delegate = self;
        self.cycleView.isInfiniteLoop = YES;
        self.cycleView.autoScrollInterval = 3.0;
        [self.cycleView registerClass:[SYCycleCollectionViewCell class] forCellWithReuseIdentifier:@"cycleCell"];
    }
    return self;
}

#pragma mark - TYCyclePagerViewDelegate, TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView
{
    return self.datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    SYCycleCollectionViewCell * cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cycleCell" forIndex:index];
    cell.imageUrlOrName = self.datas[index];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView
{
    TYCyclePagerViewLayout * layout = [[TYCyclePagerViewLayout alloc] init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame) * 0.8, CGRectGetHeight(pageView.frame));
    layout.itemSpacing = 15;
    layout.layoutType = TYCyclePagerTransformLayoutCoverflow;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    
}

- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index
{
    
}

@end
