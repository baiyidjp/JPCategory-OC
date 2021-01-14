//
//  UILabel+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JPCategory)

+ (UILabel *)jp_labelWith:(NSString *)text;

+ (UILabel *)jp_labelWith:(NSString *)text textColor:(UIColor *)color;

+ (UILabel *)jp_labelWith:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor;

+ (UILabel *)jp_centerLabelWith:(NSString *)text;

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size;

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor;

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame;

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size;

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor;

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame;

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size;

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor;

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
