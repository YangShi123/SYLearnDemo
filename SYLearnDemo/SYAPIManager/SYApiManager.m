//
//  SYApiManager.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/17.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYApiManager.h"

@implementation SYApiManager

+ (void)getDataWithJsonName:(NSString *)name handler:(NetworkCompletionHandler)handler
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !handler ?: handler([[[SYApiManager alloc] init] jsonObjectDataFromBundleWithSourceName:name]);
    });
}

#pragma mark - 公共方法

- (SYApiResponse *)jsonObjectDataFromBundleWithSourceName:(NSString *)name
{
    NSData * jsonData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"json"]];
    NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    SYApiResponse * response = [[SYApiResponse alloc] init];
    response.success = [[jsonDic objectForKey:@"code"] integerValue] == 200;
    response.resultValue = [jsonDic objectForKey:@"data"];
    response.resultDesc = [jsonDic objectForKey:@"msg"];
    return response;
}

@end

@implementation SYApiResponse

@end
