
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

- (void)setBackgroundNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {

    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [self addTarget:target action:action forControlEvents:controlEvents];
}


- (void)setNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {

    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
    [self addTarget:target action:action forControlEvents:controlEvents];
}


/************* 扩大按钮点击范围 *************/
- (void)enlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    
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

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    
    return CGRectContainsPoint(rect, point) ? self: nil;
}
/*************  扩大按钮点击范围  *************/


@end
