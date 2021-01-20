//
//  UIImage+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JPCategory)

/**
 * 通过颜色获取图片
 * @param color
 * @return
 */
+ (UIImage *)jp_imageWithColor:(UIColor *)color;

/**
 * 通过颜色获取图片
 * @param color
 * @param size
 * @return
 */
+ (UIImage *)jp_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 获取随机颜色的图片
 * @param size
 * @return
 */
+ (UIImage *)jp_randomColorImageWith:(CGSize)size;

/**
 * 圆形图片
 * @param size
 * @return
 */
- (UIImage *)jp_cornerImageWithSize:(CGSize)size;

/**
 * 直接切圆角 返回图片
 * @param size
 * @param cornerRadius
 * @return
 */
- (UIImage *)jp_cornerImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

/**
 * 异步圆形图片 适用于正方形切成圆形
 * @param size
 * @param completion
 */
- (void)jp_asyncCornerImageWithSize:(CGSize)size completion:(void (^)(UIImage *image))completion;

/**
 * 异步图片切圆角 适用于只切圆角
 * @param size
 * @param cornerRadius
 * @param completion
 */
- (void)jp_asyncCornerImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *cornerImage))completion;

/**
 * 图片剪切为圆形 默认的边框颜色和边框宽度
 * @param size
 * @param cornerRadius
 * @param completion
 */
- (void)jp_asyncRoundImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius completion:(void (^)(UIImage *))completion;

 /**
  * 图片剪切为圆形
  * @param size 圆的外围
  * @param cornerRadius 圆角
  * @param borderWidth 边框的宽度
  * @param borderColor 边框的颜色
  * @param completion 回调图片
  */
- (void)jp_asyncRoundImageWithSize:(CGSize)size cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor completion:(void (^)(UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
