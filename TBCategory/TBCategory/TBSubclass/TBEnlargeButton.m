//
//  TBEnlargeButton.m
//  TBCategory
//
//  Created by ZhangTianbing on 2017/4/26.
//  Copyright © 2017年 张天兵. All rights reserved.
//

#import "TBEnlargeButton.h"

@interface TBEnlargeButton ()

@property(nonatomic, assign) CGFloat topEdge;
@property(nonatomic, assign) CGFloat leftEdge;
@property(nonatomic, assign) CGFloat bottomEdge;
@property(nonatomic, assign) CGFloat rightEdge;

@end


@implementation TBEnlargeButton

/**
 按钮创建

 @return TBEnlargeButton
 */
+ (instancetype)button {
    
    TBEnlargeButton *enlargeButton = [TBEnlargeButton buttonWithType:UIButtonTypeCustom];
    enlargeButton.topEdge = 0;
    enlargeButton.leftEdge = 0;
    enlargeButton.bottomEdge = 0;
    enlargeButton.rightEdge = 0;
    
    return enlargeButton;
}

/**
 扩大按钮点击范围
 
 @param top 顶部扩大数值
 @param left 左边扩大数值
 @param bottom 底部扩大数值
 @param right 右边扩大数值
 */
- (void)setEnlargeEdgeTop:(CGFloat)top
                     left:(CGFloat)left
                   bottom:(CGFloat)bottom
                    right:(CGFloat)right {
    
    _topEdge = top;
    _leftEdge = left;
    _bottomEdge = bottom;
    _rightEdge = right;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect bounds = self.bounds;
    
    if (_topEdge == 0 && _leftEdge == 0 && _bottomEdge == 0 && _rightEdge == 0) {
        //若原热区小于44x44，则放大热区，否则保持原大小不变
        CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
        CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    } else {
        bounds = CGRectMake(bounds.origin.x - _leftEdge, bounds.origin.y - _topEdge, bounds.size.width + _leftEdge + _rightEdge, bounds.size.height + _topEdge + _bottomEdge);

    }
    
    return CGRectContainsPoint(bounds, point);
}


@end
