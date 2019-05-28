//
//  SYTextViewHelper.m
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/24.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYTextViewHelper.h"

@interface SYTextViewHelper ()

@property (nonatomic, strong) UITextView * textView;

@end

@implementation SYTextViewHelper

+ (instancetype)initialize
{
    return [[SYTextViewHelper alloc] init];
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.textView = [[UITextView alloc] init];
        self.textView.font = [UIFont systemFontOfSize:14];
        self.textView.selectable = NO;
    }
    return self;
}

- (void)loadDataWithJsonName:(NSString *)name completionHandler:(NetworkCompletionHandler)handler
{
    [SYApiManager getDataWithJsonName:name handler:^(SYApiResponse * _Nonnull response) {
        if (response.success)
        {
            self.textView.text = response.resultValue[@"content"];
        }
        else
        {
            //do...
        }
        handler(response);
    }];
}

@end
