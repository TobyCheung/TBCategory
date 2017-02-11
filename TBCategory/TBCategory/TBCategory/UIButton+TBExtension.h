//
//  UIButton+TBExtension.h
//  TBBilibili
//
//  Created by 张天兵 on 16/7/9.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TBExtension)

- (void)setBackgroundNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (void)setNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;



@end
