//
//  SYProgressHUD.m
//

#import "SYProgressHUD.h"

#define ToastTime 2.0

@interface SYProgressHUD ()

@property (nonatomic, strong) UIWindow * window;

@end

@implementation SYProgressHUD

+ (instancetype)shareInstance
{
    static SYProgressHUD * hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[SYProgressHUD alloc] init];
        hud.window = [UIApplication sharedApplication].delegate.window;
    });
    return hud;
}

+ (void)SYProgressShowMsg:(NSString *)msg inView:(UIView *)view mode:(MBProgressHUDMode)mode customImg:(UIImageView *)imageView
{
    if ([SYProgressHUD shareInstance].hud != nil)
    {
        [[SYProgressHUD shareInstance].hud hideAnimated:YES];
    }
    [SYProgressHUD shareInstance].hud = [MBProgressHUD showHUDAddedTo:view ? view : [SYProgressHUD shareInstance].window animated:YES];
    [SYProgressHUD shareInstance].hud.label.text = msg;
    [SYProgressHUD shareInstance].hud.label.numberOfLines = 0;
    [SYProgressHUD shareInstance].hud.mode = mode;
    if (mode == MBProgressHUDModeCustomView) {
        [SYProgressHUD shareInstance].hud.customView = imageView;
    }
    [SYProgressHUD shareInstance].hud.bezelView.backgroundColor = [UIColor blackColor];
    [SYProgressHUD shareInstance].hud.contentColor = [UIColor whiteColor];
    [SYProgressHUD shareInstance].hud.label.textColor = [UIColor whiteColor];
    [SYProgressHUD shareInstance].hud.removeFromSuperViewOnHide = YES;
    [SYProgressHUD shareInstance].hud.margin = 15;
}

+ (void)showMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeText customImg:nil];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:ToastTime];
}

+ (void)showMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeText customImg:nil];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:ToastTime];
}

+ (void)showProgressWithMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeIndeterminate customImg:nil];
}

+ (void)showProgressWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeIndeterminate customImg:nil];
}

+ (void)showSuccessWithMsg:(NSString *)msg;
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:ToastTime];
}

+ (void)showSuccessWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:ToastTime];
}

+ (void)showFailureWithMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fail"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:ToastTime];
}

+ (void)showFailureWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeCustomView customImg:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fail"]]];
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:ToastTime];
}

+ (void)showCircleProgressWithMsg:(NSString *)msg
{
    [self SYProgressShowMsg:msg inView:nil mode:MBProgressHUDModeAnnularDeterminate customImg:nil];
    [SYProgressHUD shareInstance].hud.progress = 0;
}

+ (void)showCircleProgressWithMsg:(NSString *)msg inView:(UIView *)view
{
    [self SYProgressShowMsg:msg inView:view mode:MBProgressHUDModeAnnularDeterminate customImg:nil];
    [SYProgressHUD shareInstance].hud.progress = 0;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [SYProgressHUD shareInstance].hud.progress = progress;
}

+ (void)hidden
{
    [[SYProgressHUD shareInstance].hud hideAnimated:YES];
}

+ (void)hiddenWithCompletion:(MBProgressHUDCompletionBlock)completion
{
    [[SYProgressHUD shareInstance].hud hideAnimated:YES];
    !completion ?:completion();
}

+ (void)hiddenAfterDelay:(NSTimeInterval)delay
{
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:delay];
}

+ (void)hiddenAfterDelay:(NSTimeInterval)delay completion:(MBProgressHUDCompletionBlock)completion
{
    [[SYProgressHUD shareInstance].hud hideAnimated:YES afterDelay:delay];
    !completion ?:completion();
}

@end
