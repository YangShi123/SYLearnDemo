//
//  UIView+Extension.h
//



#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

//用于storyboard

@property (nonatomic, assign) IBInspectable CGFloat kCornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat kBorderWidth;

@property (nonatomic, strong) IBInspectable UIColor * kBorderColor;

@property (nonatomic, assign) IBInspectable BOOL kMasksToBounds;

@end
