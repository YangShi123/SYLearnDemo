//
//  SYFingerLockView.m
//  SYLearnDemo
//
//  Created by Ivan_Yang on 2019/6/29.
//  Copyright © 2019年 石阳. All rights reserved.
//

#import "SYFingerLockView.h"

@interface SYFingerLockView ()
//保存选中的按钮
@property (nonatomic, strong) NSMutableArray * selectedBtnArray;
//记录当前手指的点
@property (nonatomic, assign) CGPoint currentPoint;

@end

@implementation SYFingerLockView

- (void)drawRect:(CGRect)rect {
    if (self.selectedBtnArray.count)
    {
        UIBezierPath * path = [UIBezierPath bezierPath];
        [path setLineWidth:5];
        [COLOR_1296db set];
        [path setLineJoinStyle:kCGLineJoinRound];
        for (NSInteger i = 0; i < self.selectedBtnArray.count; i ++)
        {
            UIButton * btn = self.selectedBtnArray[i];
            if (i == 0)
            {
                //获取数组第一个按钮即为起始点
                [path moveToPoint:btn.center];
            }
            else
            {
                //其余的就添加一个线
                [path addLineToPoint:btn.center];
            }
        }
        [path addLineToPoint:self.currentPoint];
        [path stroke];
    }
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUp];
    }
    return self;
}

/**
 创建9个按钮，并设置没选中和选中时的图片
 */
- (void)setUp
{
    self.backgroundColor = [UIColor whiteColor];
    self.passwordLength = 3;
    self.forgetNumber = 5;
    for (NSInteger i = 0; i < 9; i ++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"fingerLock_deselected"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"fingerLock_selected"] forState:UIControlStateSelected];
        //如果为yes btn会拦截点击事件 touch 事件不会执行
        btn.userInteractionEnabled = NO;
        //密码为123456789
        btn.tag = i + 1;
        [self addSubview:btn];
    }
}

/**
 计算并排列按钮
 */
#define SYBtnWH 48
- (void)layoutSubviews
{
    [super layoutSubviews];
    //定义3列3排
    NSInteger column = 3;
    //距离边缘的距离以及每个按钮之间的距离
    CGFloat margin = (self.bounds.size.width - column * SYBtnWH) / (column + 1);
    CGFloat x = 0;
    CGFloat y = 0;
    //定义当前列和当前行
    NSInteger curL = 0;
    NSInteger curR = 0;
    
    for (NSInteger i = 0; i < self.subviews.count; i ++)
    {
        //计算出当前的列和行
        curL = i % column;
        curR = i / column;
        //计算出当前x和y的坐标
        x = margin + (margin + SYBtnWH) * curL;
        y = margin + (margin + SYBtnWH) * curR;
        
        UIButton * btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, SYBtnWH, SYBtnWH);
    }
}

/**
 获取当前点击点
 */
- (CGPoint)getCurrentPointWithTouch:(NSSet *)touches
{
    //获取手指点击点
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    return point;
}

/**
 给定一个点 判断点是否在按钮之上
 */
- (UIButton *)btnRectContainsPoint:(CGPoint)point
{
    //判断当前点是否在按钮上
    for (UIButton * btn in self.subviews)
    {
        if (CGRectContainsPoint(btn.frame, point))
        {
            return btn;
        }
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self getCurrentPointWithTouch:touches];
    //记录当前的点
    self.currentPoint = point;
    UIButton * btn = [self btnRectContainsPoint:point];
    if (btn && !btn.isSelected)
    {
        btn.selected = YES;
        [self.selectedBtnArray addObject:btn];
    }
    //重绘
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self getCurrentPointWithTouch:touches];
    //记录当前的点
    self.currentPoint = point;
    UIButton * btn = [self btnRectContainsPoint:point];
    if (btn && !btn.isSelected)
    {
        btn.selected = YES;
        [self.selectedBtnArray addObject:btn];
    }
    //重绘
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //取消按钮的选中
    //记录选中密码
    NSMutableString * password = [NSMutableString string];
    for (UIButton * btn in self.selectedBtnArray)
    {
        btn.selected = NO;
        [password appendFormat:@"%ld", btn.tag];
    }
    //密码长度小于3时，设置密码或者输入密码失败，走失败回调
    if (password.length < self.passwordLength)
    {
        
    }
    SYLog(@"%@", password);
    //移除数组数据
    [self.selectedBtnArray removeAllObjects];
    //重绘
    [self setNeedsDisplay];
}

- (NSMutableArray *)selectedBtnArray
{
    if (!_selectedBtnArray)
    {
        _selectedBtnArray = [NSMutableArray array];
    }
    return _selectedBtnArray;
}

@end
