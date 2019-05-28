//
//  SYMainTableViewCell.h
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYMainTableViewCell : UITableViewCell

- (void)setName:(NSString *)name;

- (void)setTitle:(NSString *)title;

- (void)setContentTitle:(NSString *)contentTitle;

- (void)setAuthorText:(NSString *)text;

- (void)setReadText:(NSString *)text;

- (void)setLikeBtnText:(NSString *)text;

- (void)setIsLike:(BOOL)isLike;

@end

NS_ASSUME_NONNULL_END
