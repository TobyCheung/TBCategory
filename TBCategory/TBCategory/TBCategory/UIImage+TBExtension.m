//
//  UIImage+TBExtension.m
//
//  Created by 张天兵 on 16/6/4.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UIImage+TBExtension.h"

@implementation UIImage (TBExtension)

/**
 *  合成两张图片
 *
 *  @param image1 image1
 *  @param image2 image2
 *
 *  @return 合成后的图片
 */
+ (UIImage *)tb_coverImage:(UIImage *)image1 withImage:(UIImage *)image2 {
    // 1.开启图形上下文
    // scale:比例因素 点:像素比例 0:自动识别比例因素
    UIGraphicsBeginImageContextWithOptions(image1.size, NO, 0);
    
    // 2.画图片1
    [image1 drawAtPoint:CGPointZero];
    
    // 3.画图片2
    [image2 drawAtPoint:CGPointZero];
    
    // 4.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;

}

/**
 *  把一个方形图片裁剪为圆形
 *
 *  @return 裁剪后的圆形图片
 */
- (instancetype)tb_circleImage {
    // 1.开启图形上下文
    // scale:比例因素 点:像素比例 0:自动识别比例因素
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 2.描述圆形裁剪路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    // 3.设置为裁剪区域
    [clipPath addClip];
    
    // 4.画图片
    [self drawAtPoint:CGPointZero];
    
    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  把一个图片裁剪为圆角矩形
 *
 *  @param cornerRadius 圆角值
 *
 *  @return 裁剪后的圆角矩形图片
 */
- (instancetype)tb_roundedRectImageWithCornerRadius:(CGFloat)cornerRadius {
    // 1.开启图形上下文
    // scale:比例因素 点:像素比例 0:自动识别比例因素
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 2.描述圆角矩形裁剪路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) cornerRadius:cornerRadius];
    
    // 3.设置为裁剪区域
    [clipPath addClip];
    
    // 4.画图片
    [self drawAtPoint:CGPointZero];
    
    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


- (instancetype)tb_roundedRectImageWithCornerRadius:(CGFloat)cornerRadius coverAlpha:(CGFloat)alpha {

//    UIView *cover = [[UIView alloc] init];
//    cover.frame = CGRectMake(0, 0, self.size.width, self.size.height);
//    cover.backgroundColor = [UIColor blackColor];
//    cover.alpha = alpha;
//    UIImage *coverImage = [UIImage tb_getImageFromView:cover];
//    UIImage *composeImage = [UIImage tb_coverImage:self withImage:coverImage];
//    UIImage *rectImage = [composeImage tb_roundedRectImageWithCornerRadius:cornerRadius];
//
//    return rectImage;
    
    // 1.开启图形上下文
    // scale:比例因素 点:像素比例 0:自动识别比例因素
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 2.描述圆角矩形裁剪路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) cornerRadius:cornerRadius];
    
    // 3.设置为裁剪区域
    [clipPath addClip];
    
    // 4.画图片
    [self drawAtPoint:CGPointZero];
    
    // 5.画蒙版
    UIView *cover = [[UIView alloc] init];
    cover.frame = CGRectMake(0, 0, self.size.width, self.size.height);
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = alpha;
    [cover.layer renderInContext:UIGraphicsGetCurrentContext()];

    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


/**
 *  把一个方形图片裁剪为圆形
 *
 *  @param name 需要裁剪的图片名称
 *
 *  @return 裁剪后的圆形图片
 */
+ (instancetype)tb_circleImage:(NSString *)name {
    return [[self imageNamed:name] tb_circleImage];
}

/**
 *  把一个图片裁剪为圆角矩形
 *
 *  @param name         需要裁剪的图片名称
 *  @param cornerRadius 圆角值
 *
 *  @return 裁剪后的圆角矩形图片
 */
+ (instancetype)tb_roundedRectImage:(NSString *)name cornerRadius:(CGFloat)cornerRadius {

    return [[self imageNamed:name] tb_roundedRectImageWithCornerRadius:cornerRadius];
}

/**
 *   给定一个图片名称生成一个不会被渲染的图片
 *
 *  @param imageName 原始图片
 *
 *  @return 不会被渲染的图片
 */
+ (instancetype)tb_imageWithOriginalImageNamed:(NSString *)imageName {
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

/**
 *  从给定view生成一张图片
 *
 *  @param view 给定的view
 *
 *  @return 生成的图片
 */
+ (UIImage *)tb_getImageFromView:(UIView *)view {

    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


/**
 为image生成一张带边框的图片

 @param image 原始图片
 @param size 原始图片尺寸
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @return 带边框的图片
 */
+ (UIImage *)tb_bolderImageWithImage:(UIImage *)image imageSize:(CGSize)size borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    CGSize newSize = CGSizeMake(size.width + 2 * borderWidth, size.height + 2 * borderWidth);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    [borderColor set];
    [path fill];
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, size.width, size.height)];
    [path addClip];
    [image drawInRect:CGRectMake(borderWidth, borderWidth, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 生成一张带边框的图片

 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @return 带边框的图片
 */
- (UIImage *)tb_getBolderImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    CGSize newSize = CGSizeMake(self.size.width + 2 * borderWidth, self.size.height + 2 * borderWidth);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    [borderColor set];
    [path fill];
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    [path addClip];
    [self drawInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 缩放图片至给定尺寸

 @param image 原始图片
 @param size 给定尺寸
 @return 缩放后的图片
 */
+ (UIImage *)tb_originImage:(UIImage *)image scaleToSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}


/**
 缩放至给定尺寸

 @param size 给定尺寸
 @return 缩放后的图片
 */
- (UIImage *)tb_scaleToSize:(CGSize)size {
    
    UIGraphicsBeginImageContext(size);
    
    [self drawInRect:CGRectMake(0,0, size.width, size.height)];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}


@end
