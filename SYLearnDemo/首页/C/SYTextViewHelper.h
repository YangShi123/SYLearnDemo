//
//  SYTextViewHelper.h
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/24.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYTextViewHelper : NSObject

+ (instancetype)initialize;

- (UITextView *)textView;

- (void)loadDataWithJsonName:(NSString *)name completionHandler:(NetworkCompletionHandler)handler;

@end

NS_ASSUME_NONNULL_END
