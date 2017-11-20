
//
//  UIButton+TBExtension.m
//
//  Created by 张天兵 on 16/7/9.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UIButton+TBExtension.h"
#import <objc/runtime.h>

@implementation UIButton (TBExtension)

static char topNameKey;
static char leftNameKey;
static char bottomNameKey;
static char rightNameKey;


#pragma mark - 按钮图片和事件响应设置
/**
 按钮设置背景图片和事件响应

 @param normalImage 普通状态背景图片
 @param highlightedImage 高亮状态背景图片
 @param selectedImage 选中状态背景图片
 @param target 代理
 @param action 事件响应
 @param controlEvents 事件
 */
- (void)setBackgroundNormalImage:(UIImage *)normalImage
                highlightedImage:(UIImage *)highlightedImage
                   selectedImage:(UIImage *)selectedImage
                       addTarget:(id)target
                          action:(SEL)action
                forControlEvents:(UIControlEvents)controlEvents {

    if (normalImage) {
        [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    }
    
    if (highlightedImage) {
        [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    
    if (selectedImage) {
        [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
    }
    
    if (target && action && controlEvents) {
        [self addTarget:target action:action forControlEvents:controlEvents];
    }
    
}

/**
 按钮设置图片和事件响应
 
 @param normalImage 普通状态图片
 @param highlightedImage 高亮状态图片
 @param selectedImage 选中状态图片
 @param target 代理
 @param action 事件响应
 @param controlEvents 事件
 */
- (void)setNormalImage:(UIImage *)normalImage
      highlightedImage:(UIImage *)highlightedImage
         selectedImage:(UIImage *)selectedImage
             addTarget:(id)target
                action:(SEL)action
      forControlEvents:(UIControlEvents)controlEvents {

    if (normalImage) {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (highlightedImage) {
        [self setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    
    if (selectedImage) {
        [self setImage:selectedImage forState:UIControlStateSelected];
    }
    
    if (target && action && controlEvents) {
        [self addTarget:target action:action forControlEvents:controlEvents];
    }

}


#pragma mark - 扩大按钮点击范围
/**
 扩大按钮点击范围

 @param top 顶部扩大数值
 @param left 左边扩大数值
 @param bottom 底部扩大数值
 @param right 右边扩大数值
 */
- (void)enlargeEdgeWithTop:(CGFloat)top
                      left:(CGFloat)left
                    bottom:(CGFloat)bottom
                     right:(CGFloat)right {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect {
    
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point
          withEvent:(UIEvent *)event {
    
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    
    return CGRectContainsPoint(rect, point) ? self: nil;
}


@end
