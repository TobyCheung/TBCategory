
//
//  UIButton+TBExtension.m
//  TBBilibili
//
//  Created by 张天兵 on 16/7/9.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UIButton+TBExtension.h"

@implementation UIButton (TBExtension)

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


@end
