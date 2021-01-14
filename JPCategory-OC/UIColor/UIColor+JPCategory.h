//
//  UIColor+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JPCategory)

/**
 iOS十六进制颜色转换为UIColor(默认透明度为1.0)
 带A或者AA的色值 透明度不适用默认的
 
 @param hexString 包括8种格式(RGB,ARGB,RRGGBB,AARRGGBB,#RGB,#ARGB,#RRGGBB,#AARRGGBB)
 @return 颜色
 */
+ (UIColor *)jp_colorWithHexString:(NSString *)hexString;

/**
 iOS十六进制颜色转换为UIColor
 带A或者AA的色值 透明度不适用默认的
 
 @param hexString 包括8种格式(RGB,ARGB,RRGGBB,AARRGGBB,#RGB,#ARGB,#RRGGBB,#AARRGGBB)
 @param alpha 颜色的透明度
 @return 颜色
 */
+ (UIColor *)jp_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
