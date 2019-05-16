//
//  SYCycleViewHelper.h
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/16.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TYCyclePagerView.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYCycleViewHelper : NSObject

+ (instancetype)initialize;

- (TYCyclePagerView *)cycleView;

@property (nonatomic, copy) NSArray * datas;

@end

NS_ASSUME_NONNULL_END
