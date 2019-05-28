//
//  SYMainModel.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYMainModel.h"

@implementation SYMainModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self.name = [[dic objectForKey:@"author"] substringToIndex:1];
    self.title = [dic objectForKey:@"title"];
    self.content = [dic objectForKey:@"content"];
    self.author = [dic objectForKey:@"author"];
    self.readCount = [dic objectForKey:@"readCount"];
    self.likeCount = [dic objectForKey:@"likeCount"];
    self.isLike = [[dic objectForKey:@"like"] integerValue];
    return self;
}

@end
