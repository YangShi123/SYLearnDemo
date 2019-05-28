//
//  SYMainTableViewCell.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainTableViewCell.h"

@interface SYMainTableViewCell ()

@property (nonatomic, strong) UILabel * nameLabel;

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
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.layer.cornerRadius = 25;
    self.nameLabel.layer.masksToBounds = YES;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
    [self.contentView addSubview:self.nameLabel];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.titleLabel];
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.contentLabel];
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.authorLabel];
    self.readLabel = [[UILabel alloc] init];
    self.readLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.readLabel];
    self.likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"爱心"] forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"爱心_选中"] forState:UIControlStateSelected];
    [self.contentView addSubview:self.likeBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    SYWeakSelf(self);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(15);
        make.size.mas_offset(CGSizeMake(50, 50));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.nameLabel.mas_right).mas_offset(5);
        make.top.equalTo(weakself.nameLabel.mas_top);
        make.right.mas_offset(-15);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.titleLabel.mas_left);
        make.bottom.equalTo(weakself.nameLabel.mas_bottom);
        make.right.mas_offset(-15);
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.bottom.mas_offset(-10);
    }];
    [self.readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(-10);
        make.centerX.mas_equalTo(weakself.mas_centerX);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.centerY.equalTo(weakself.authorLabel.mas_centerY);
    }];
}

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void)setContentTitle:(NSString *)contentTitle
{
    self.contentLabel.text = contentTitle;
}

- (void)setAuthorText:(NSString *)text
{
    self.authorLabel.text = text;
}

- (void)setReadText:(NSString *)text
{
    self.readLabel.text = text;
}

- (void)setLikeBtnText:(NSString *)text
{
    [self.likeBtn setTitle:text forState:UIControlStateNormal];
}

- (void)setIsLike:(BOOL)isLike
{
    [self.likeBtn setSelected:isLike];
}

//- (void)

@end
