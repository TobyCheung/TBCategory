//
//  UITextField+TBPlaceHolderColor.m
//  百思不得姐
//
//  Created by 张天兵 on 16/5/28.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UITextField+TBPlaceHolderColor.h"

static NSString * const TBPlaceholderColorKey = @"placeholderLabel.textColor";


@implementation UITextField (TBPlaceHolderColor)

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    // 提前设置占位文字, 目的: 让系统自动提前创建placeholderLabel
    /*******  MJ 方法 *******/
//    NSString *oldPlaceholder = self.placeholder;
//    self.placeholder = @" ";
//    self.placeholder = oldPlaceholder;
    
    /*****  个人改进  *******/
    self.placeholder = self.placeholder;
    
    // 恢复到默认的占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:TBPlaceholderColorKey];
    
}

- (UIColor *)placeholderColor {

    return [self valueForKeyPath:TBPlaceholderColorKey];
}


@end
