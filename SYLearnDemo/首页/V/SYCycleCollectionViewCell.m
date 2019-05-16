//
//  SYCycleCollectionViewCell.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/16.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYCycleCollectionViewCell.h"

@interface SYCycleCollectionViewCell ()

@property (nonatomic, strong) UIImageView * cycleImageView;

@end

@implementation SYCycleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.cycleImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.cycleImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.cycleImageView.frame = self.bounds;
}

- (void)setImageUrlOrName:(NSString *)string
{
    //先以本地图片为例,正式应用可以使用sdwebimage缓存图片
    self.cycleImageView.image = [UIImage imageNamed:string];
}

@end
