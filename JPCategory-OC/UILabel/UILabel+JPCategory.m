//
//  UILabel+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import "UILabel+JPCategory.h"
#import "JPCategoryConfig.h"

@implementation UILabel (JPCategory)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [JPCategoryConfig jp_removeCustomFontName];
    });
}

+ (UILabel *)label
{
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text;
{
    UILabel *label = [UILabel label];
    label.text = text;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor
{
    UILabel *label = [UILabel jp_labelWith:text textColor:color];
    label.backgroundColor = bgColor;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text
{
    UILabel *label = [UILabel jp_labelWith:text];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}


+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size
{
    UILabel *label = [UILabel jp_labelWith:text];
    NSString *fontName = [self regularFontName];
    if (fontName && fontName.length > 0) {
        label.font = [UIFont fontWithName:fontName size:size];
    } else {
        label.font = [UIFont systemFontOfSize:size];
    }
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor
{
    UILabel *label = [UILabel jp_labelWith:text font:size];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_labelWith:text font:size textColor:textColor];
    label.frame = frame;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_labelWith:text font:size textColor:textColor frame:frame];
    label.backgroundColor = backgroundColor;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size
{
    UILabel *label = [UILabel jp_labelWith:text];
    NSString *fontName = [self boldFontName];
    if (fontName && fontName.length > 0) {
        label.font = [UIFont fontWithName:fontName size:size];
    } else {
        label.font = [UIFont boldSystemFontOfSize:size];
    }
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor
{
    UILabel *label = [UILabel jp_labelWith:text boldFont:size];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_labelWith:text boldFont:size textColor:textColor];
    label.frame = frame;
    return label;
}

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_labelWith:text boldFont:size textColor:textColor frame:frame];
    label.backgroundColor = backgroundColor;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size
{
    UILabel *label = [UILabel jp_centerLabelWith:text];
    NSString *fontName = [self regularFontName];
    if (fontName && fontName.length > 0) {
        label.font = [UIFont fontWithName:fontName size:size];
    } else {
        label.font = [UIFont systemFontOfSize:size];
    }
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor
{
    UILabel *label = [UILabel jp_centerLabelWith:text font:size];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_centerLabelWith:text font:size textColor:textColor];
    label.frame = frame;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_centerLabelWith:text font:size textColor:textColor frame:frame];
    label.backgroundColor = backgroundColor;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size
{
    UILabel *label = [UILabel jp_centerLabelWith:text];
    NSString *fontName = [self boldFontName];
    if (fontName && fontName.length > 0) {
        label.font = [UIFont fontWithName:fontName size:size];
    } else {
        label.font = [UIFont boldSystemFontOfSize:size];
    }
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor {

    UILabel *label = [UILabel jp_centerLabelWith:text boldFont:size];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_centerLabelWith:text boldFont:size textColor:textColor];
    label.frame = frame;
    return label;
}

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame {

    UILabel *label = [UILabel jp_centerLabelWith:text boldFont:size textColor:textColor frame:frame];
    label.backgroundColor = backgroundColor;
    return label;
}

+ (NSString *)regularFontName {

    return [[NSUserDefaults standardUserDefaults] objectForKey:JPCategory_UILabel_FontName_Regular];
}

+ (NSString *)boldFontName {

    return [[NSUserDefaults standardUserDefaults] objectForKey:JPCategory_UILabel_FontName_Bold];
}

@end
