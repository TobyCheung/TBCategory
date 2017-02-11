//
//  UIBarButtonItem+TBExtension.m
//  百思不得姐
//
//  Created by 张天兵 on 16/5/26.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UIBarButtonItem+TBExtension.h"

@implementation UIBarButtonItem (TBExtension)

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:btn];
}

@end
