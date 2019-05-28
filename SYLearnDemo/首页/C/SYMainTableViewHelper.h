//
//  SYMainTableViewHelper.h
//  SYLearnDemo
//
//  Created by wenjiepeng on 2019/5/15.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYMainTableViewHelper : NSObject

+ (instancetype)initialize;

- (UITableView *)tableView;

- (void)loadDataWithCompletionHandler:(NetworkCompletionHandler)handler;

@property (nonatomic, copy) void(^tableViewHandler)(NSIndexPath * indexPath);

@end

NS_ASSUME_NONNULL_END
