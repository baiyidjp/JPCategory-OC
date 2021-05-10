//
//  UILabel+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JPCategory)

/**
 * init label (text)
 * @param text
 * @return
 */
+ (UILabel *)jp_labelWith:(NSString *)text;

/**
 * init label (text/color)
 * @param text
 * @param color
 * @return
 */
+ (UILabel *)jp_labelWith:(NSString *)text textColor:(UIColor *)color;

/**
 * init label (text/color/backgroundColor)
 * @param text
 * @param color
 * @param bgColor
 * @return
 */
+ (UILabel *)jp_labelWith:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor;

/**
 * init label center
 * @param text
 * @return
 */
+ (UILabel *)jp_centerLabelWith:(NSString *)text;

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size;

+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor;

/**
 * init label (text/font/color/frame)
 * @param text
 * @param size 自定义文字在程序启动时可在 NSUserDefaults 里存下文字名字， key 为 JPCategory_UILabel_FontName_Regular
 * @param textColor
 * @param frame
 * @return
 */
+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame;

/**
 * init label (text/font/color/backgroundColor/frame)
 * @param text
 * @param size 自定义文字在程序启动时可在 NSUserDefaults 里存下文字名字， key 为 JPCategory_UILabel_FontName_Regular
 * @param textColor
 * @param backgroundColor
 * @param frame
 * @return
 */
+ (UILabel *)jp_labelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame;

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size;

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor;

/**
 * init label (text/boldFont/color/frame)
 * @param text
 * @param size 自定义文字可在 NSUserDefaults 里存下文字名字， key 为 JPCategory_UILabel_FontName_Bold
 * @param textColor
 * @param frame
 * @return
 */
+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame;

+ (UILabel *)jp_labelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame;

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size;

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor;

/**
 * init label center (text/font/color/frame)
 * @param text
 * @param size 自定义文字在程序启动时可在 NSUserDefaults 里存下文字名字， key 为 JPCategory_UILabel_FontName_Regular
 * @param textColor
 * @param frame
 * @return
 */
+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame;

+ (UILabel *)jp_centerLabelWith:(NSString *)text font:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame;

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size;

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor;

/**
 * init label center (text/boldFont/color/frame)
 * @param text
 * @param size 自定义文字可在 NSUserDefaults 里存下文字名字， key 为 JPCategory_UILabel_FontName_Bold
 * @param textColor
 * @param frame
 * @return
 */
+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor frame:(CGRect)frame;

+ (UILabel *)jp_centerLabelWith:(NSString *)text boldFont:(CGFloat)size textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame;



@end

NS_ASSUME_NONNULL_END
