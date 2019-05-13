//
//  Define.h
//  省小二3.0
//
//  Created by wenjiepeng on 2018/11/30.
//  Copyright © 2018年 Ivan. All rights reserved.
//

#ifndef Define_h
#define Define_h

//打印台
#ifdef DEBUG
#define SYLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define SYLog(...) nil
#endif
//基础屏幕宽
#define kBaseWidth 375
//基础屏幕高
#define kBaseHeight 667
//全屏宽
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//全屏高
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//屏幕宽度比例
#define kScreenWidthScale kScreenWidth / kBaseWidth
//屏幕高度比例（一般使用高度）
#define kScreenHeightScale kScreenHeight / kBaseHeight
//状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define kNavBarHeight 44.f
//工具栏高度
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83 : 49)
//顶部安全距离
#define kTopHeight (kStatusBarHeight + kNavBarHeight)
//颜色转换
#define COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
//常用颜色
#define COLOR_1296db COLOR_WITH_HEX(0x1296db)
#define COLOR_2c2c2c COLOR_WITH_HEX(0x2c2c2c)
//存储
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
//通知
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//字符串是否为空
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//弱引用
#define SYWeakSelf(type)  __weak typeof(type) weak##type = type;
//强引用
#define SYStrongSelf(type)  __strong typeof(type) type = weak##type;

#endif /* Define_h */
