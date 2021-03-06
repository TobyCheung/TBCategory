//
//  UIButton+TBExtension.h
//
//  Created by 张天兵 on 16/7/9.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TBExtension)

/**
 按钮设置背景图片和事件响应
 */
- (void)setBackgroundNormalImage:(UIImage *)normalImage
                highlightedImage:(UIImage *)highlightedImage
                   selectedImage:(UIImage *)selectedImage
                       addTarget:(id)target
                          action:(SEL)action
                forControlEvents:(UIControlEvents)controlEvents;

/**
 按钮设置图片和事件响应
 */
- (void)setNormalImage:(UIImage *)normalImage
      highlightedImage:(UIImage *)highlightedImage
         selectedImage:(UIImage *)selectedImage
             addTarget:(id)target
                action:(SEL)action
      forControlEvents:(UIControlEvents)controlEvents;


/**
 扩大按钮点击范围
 */
- (void)enlargeEdgeWithTop:(CGFloat)top
                      left:(CGFloat)left
                    bottom:(CGFloat)bottom
                     right:(CGFloat)right;

@end
