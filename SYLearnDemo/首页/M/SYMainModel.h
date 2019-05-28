//
//  SYMainModel.h
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYMainModel : NSObject

- (instancetype)initWithDic:(NSDictionary *)dic;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, copy) NSString * author;

@property (nonatomic, copy) NSString * readCount;

@property (nonatomic, copy) NSString * likeCount;

@property (nonatomic, assign) NSInteger isLike;

@end

NS_ASSUME_NONNULL_END
