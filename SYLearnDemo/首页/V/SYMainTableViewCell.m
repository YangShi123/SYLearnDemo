//
//  SYMainTableViewCell.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainTableViewCell.h"

@interface SYMainTableViewCell ()

@property (nonatomic, strong) UIImageView * iconImageView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UILabel * authorLabel;

@property (nonatomic, strong) UILabel * readLabel;

@property (nonatomic, strong) UIButton * likeBtn;

@end

@implementation SYMainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self _creatUI];
    }
    return self;
}

- (void)_creatUI
{
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.iconImageView];
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.readLabel];
    [self.contentView addSubview:self.likeBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_offset(CGSizeMake(20, 20));
    }];
}

@end
