//
//  UIView+TBFrame.m
//  UIView_Category
//
//  Created by 张天兵 on 16/5/8.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UIView+TBFrame.h"

@implementation UIView (TBFrame)
// width
- (CGFloat)tb_width
{
    return self.bounds.size.width;
}
- (void)setTb_width:(CGFloat)tb_width
{
    CGRect frame = self.frame;
    frame.size.width = tb_width;
    self.frame = frame;
}

// heigth
- (CGFloat)tb_height
{
    return self.bounds.size.height;
}
- (void)setTb_height:(CGFloat)tb_height
{
    CGRect frame = self.frame;
    frame.size.height = tb_height;
    self.frame = frame;
}

// x
- (CGFloat)tb_x
{
    return self.frame.origin.x;
}
- (void)setTb_x:(CGFloat)tb_x
{
    CGRect frame = self.frame;
    frame.origin.x = tb_x;
    self.frame = frame;
    
}

// y
- (CGFloat)tb_y
{
    return self.frame.origin.y;
}
- (void)setTb_y:(CGFloat)tb_y
{
    CGRect frame = self.frame;
    frame.origin.y = tb_y;
    self.frame = frame;
    
}

// centerX
- (void)setTb_centerX:(CGFloat)tb_centerX {

    CGPoint center = self.center;
    center.x = tb_centerX;
    self.center = center;
}

- (CGFloat)tb_centerX {

    return self.center.x;
}

// centerY
- (void)setTb_centerY:(CGFloat)tb_centerY {
    
    CGPoint center = self.center;
    center.y = tb_centerY;
    self.center = center;
}

- (CGFloat)tb_centerY {
    
    return self.center.y;
}

// right
- (void)setTb_right:(CGFloat)tb_right {

    CGRect frame = self.frame;
    frame.origin.x = tb_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)tb_right {

    return self.frame.origin.x + self.frame.size.width;
}

// bottom
- (void)setTb_bottom:(CGFloat)tb_bottom {

    CGRect frame = self.frame;
    frame.origin.y = tb_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)tb_bottom {

    return self.frame.origin.y + self.frame.size.height;
}

/**
 *  @return 从xib加载控件
 */
+ (instancetype)viewFromXib {

    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}



@end
