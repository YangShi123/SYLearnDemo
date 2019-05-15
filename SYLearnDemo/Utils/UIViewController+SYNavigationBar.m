

#import "UIViewController+SYNavigationBar.h"

@interface UIViewController ()

@property (nonatomic, strong) UISwipeGestureRecognizer * swipe;

@end

@implementation UIViewController (SYNavigationBar)

- (void)setLeftBarButtonWithTitle:(NSString *)title action:(SEL)action
{
    if (title)
    {
        self.navigationItem.leftBarButtonItem = [self barButtonItemWithTitle:title action:action];
    }
}

- (void)setLeftBarButtonWithImageName:(NSString *)imageName action:(SEL)action
{
    if (imageName)
    {
        self.navigationItem.leftBarButtonItem = [self barButtonItemWithImageName:imageName action:action];
    }
}

- (void)setRightBarButtonWithTitle:(NSString *)title action:(SEL)action
{
    if (title)
    {
        self.navigationItem.rightBarButtonItem = [self barButtonItemWithTitle:title action:action];
    }
}

- (void)setRightBarButtonWithImageName:(NSString *)imageName action:(SEL)action
{
    if (imageName)
    {
        self.navigationItem.rightBarButtonItem = [self barButtonItemWithImageName:imageName action:action];
    }
}

- (void)setBackBarBtn
{
    [self setLeftBarButtonWithImageName:@"返回" action:@selector(backButtonTaped:)];
}

- (void)setBackBarBtnAction:(SEL)action
{
    [self setLeftBarButtonWithImageName:@"返回" action:action];
}

- (void)setRightBarButtonWithTitle:(NSString *)title titleColor:(UIColor *)color imageName:(NSString *)imageName action:(SEL)action
{
    UIButton * button = [[UIButton alloc] init];
    [button setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:0];
    [button setTitle:title forState:0];
    [button setTitleColor:color ? color : [UIColor blackColor] forState:0];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage * image = [UIImage imageNamed:imageName];
    CGRect rect = [title boundingRectWithSize:button.size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, rect.size.width, 0, -rect.size.width)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
}

#pragma mark - private method

- (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title action:(SEL)action
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [barButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16], NSForegroundColorAttributeName:COLOR_WITH_HEX(0x898989)} forState:UIControlStateNormal];
    return barButton;
}

- (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName action:(SEL)action
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:action];
    return barButton;
}

- (void)backButtonTaped:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
