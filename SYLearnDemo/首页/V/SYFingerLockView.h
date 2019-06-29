//
//  SYFingerLockView.h
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/6/29.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYFingerLockView : UIView

//密码长度,默认为3，少于3个，将会失败
@property (nonatomic, assign) NSInteger passwordLength;
//失败次数（到达次数后，处理相关逻辑）默认为5次
@property (nonatomic, assign) NSInteger forgetNumber;
//失败后的回调
//@property (nonatomic, copy) (void)(^)
//成功后的回调

@end
