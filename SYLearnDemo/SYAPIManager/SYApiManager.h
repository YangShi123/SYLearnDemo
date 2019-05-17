//
//  SYApiManager.h
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/17.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYApiResponse : NSObject

@property (nonatomic, assign) BOOL success;/** 是否返回正确的结果*/

@property (nonatomic, strong) id resultValue;/** 服务器返回结果 */

@property (nonatomic, copy) NSString * resultDesc;/** 请求结果的描述 */

@end

typedef void(^NetworkCompletionHandler)(SYApiResponse * response);

@interface SYApiManager : NSObject

+ (void)getMainWithHandler:(NetworkCompletionHandler)handler;

@end

NS_ASSUME_NONNULL_END
