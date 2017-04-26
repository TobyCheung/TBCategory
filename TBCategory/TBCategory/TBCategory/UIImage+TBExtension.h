//
//  UIImage+TBExtension.h
//
//  Created by 张天兵 on 16/6/4.
//  Copyright © 2016年 张天兵. All rights reserved.
//
// 返回圆形图片

#import <UIKit/UIKit.h>

@interface UIImage (TBExtension)

/** 
 把方形图片裁剪为圆形 
 */
- (instancetype)tb_circleImage;

/** 
 把方形图片裁剪为圆形 
 */
+ (instancetype)tb_circleImage:(NSString *)name;

/** 
 把方形图片裁剪为圆角矩形 
 */
- (instancetype)tb_roundedRectImageWithCornerRadius:(CGFloat)cornerRadius;

/** 
 把方形图片裁剪为圆角矩形
 */
+ (instancetype)tb_roundedRectImage:(NSString *)name cornerRadius:(CGFloat)cornerRadius;

/** 
 给定一个图片名称生成一个不会被渲染的图片
 */
+ (instancetype)tb_imageWithOriginalImageNamed:(NSString *)imageName;

/** 
 从给定view生成一张图片 
 */
+ (UIImage *)tb_getImageFromView:(UIView *)view;

/** 
 合成两张图片 
 */
+ (UIImage *)tb_coverImage:(UIImage *)image1 withImage:(UIImage *)image2;

/** 
 为给定图片生成一张带蒙版的圆角矩形图片
 */
- (instancetype)tb_roundedRectImageWithCornerRadius:(CGFloat)cornerRadius coverAlpha:(CGFloat)alpha;

/** 
 为image生成一张带边框的图片
 */
+ (UIImage *)tb_bolderImageWithImage:(UIImage *)image imageSize:(CGSize)size borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/** 
 生成一张带边框的图片
 */
- (UIImage *)tb_getBolderImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/** 
 缩放图片至给定尺寸
 */
+ (UIImage *)tb_originImage:(UIImage *)image scaleToSize:(CGSize)size;

/** 
 缩放至给定尺寸
 */
- (UIImage *)tb_scaleToSize:(CGSize)size;

@end
