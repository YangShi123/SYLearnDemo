//
//  SYProgressHUD.h
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYProgressHUD : NSObject

@property (nonatomic, strong) MBProgressHUD * hud;

@property (nonatomic, assign) CGFloat progress;

+ (instancetype)shareInstance;


/**
 显示文字
 */
+ (void)showMsg:(NSString *)msg;

/**
 显示文字 可以在指定的view上
 */
+ (void)showMsg:(NSString *)msg inView:(UIView *)view;

/**
 显示菊花
 */
+ (void)showProgressWithMsg:(NSString *)msg;

/**
 显示菊花 可以在指定的view上
 */
+ (void)showProgressWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 成功
 */
+ (void)showSuccessWithMsg:(NSString *)msg;

/**
 成功 可以在指定的view上
 */
+ (void)showSuccessWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 失败
 */
+ (void)showFailureWithMsg:(NSString *)msg;

/**
 失败 可以在指定的view上
 */
+ (void)showFailureWithMsg:(NSString *)msg inView:(UIView *)view;
#warning 还没完全封装好
/**
 进度条
 */
+ (void)showCircleProgressWithMsg:(NSString *)msg;

/**
 进度条 可以在指定的view上
 */
+ (void)showCircleProgressWithMsg:(NSString *)msg inView:(UIView *)view;

/**
 移除
 */
+ (void)hidden;

/**
 移除附带完成回调
 */
+ (void)hiddenWithCompletion:(MBProgressHUDCompletionBlock)completion;

/**
 在多少时间后移除
 */
+ (void)hiddenAfterDelay:(NSTimeInterval)delay;

/**
 在多少时间后移除附带完成回调
 */
+ (void)hiddenAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
