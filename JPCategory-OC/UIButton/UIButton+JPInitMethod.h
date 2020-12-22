//
//  UIButton+JPInitMethod.h
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import <UIKit/UIKit.h>

@interface UIButton (JPInitMethod)

/**
 init new button

 @param normalTitle normal 文本
 @param selectedTitle selected 文本
 @param titleFont 字号
 @param normalTitleColor normal 文本颜色
 @param selectedTitleColor selected 文本颜色
 @param normalBackgroundImage normal 背景图
 @param selectedBackgroundImage selected 背景图
 @param normalImage normal 图片
 @param selectedImage selected 图片
 @param frame frame
 @return UIButton
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                      selectedTitle:(NSString *)selectedTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
              normalBackgroundImage:(UIImage *)normalBackgroundImage
            selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                        normalImage:(UIImage *)normalImage
                      selectedImage:(UIImage *)selectedImage
                              frame:(CGRect)frame;

/**
 title/font/titleColor/backImage

 @param normalTitle normalTitle description
 @param selectedTitle selected 文本
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param selectedTitleColor selectedTitleColor description
 @param normalBackgroundImage normalBackgroundImage description
 @param selectedBackgroundImage selectedBackgroundImage description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                      selectedTitle:(NSString *)selectedTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
              normalBackgroundImage:(UIImage *)normalBackgroundImage
            selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                              frame:(CGRect)frame;

/**
 title/font/titleColor/backImage

 @param normalTitle normalTitle description
 @param selectedTitle selected 文本
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param selectedTitleColor selectedTitleColor description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                      selectedTitle:(NSString *)selectedTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
                              frame:(CGRect)frame;

/**
 title/font/titleColor/backImage

 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param selectedTitleColor selectedTitleColor description
 @param normalBackgroundImage normalBackgroundImage description
 @param selectedBackgroundImage selectedBackgroundImage description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
              normalBackgroundImage:(UIImage *)normalBackgroundImage
            selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                              frame:(CGRect)frame;

/**
 title/font/titleColor/normalImage
 
 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param normalImage normalImage description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                        normalImage:(UIImage *)normalImage
                              frame:(CGRect)frame;

/**
 title/font/titleColor/backImage

 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param normalBackgroundImage normalBackgroundImage description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
              normalBackgroundImage:(UIImage *)normalBackgroundImage
                              frame:(CGRect)frame;

/**
 title/font/titleColor

 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                              frame:(CGRect)frame;

/**
 title/font/titleColor/selectedTitleColor

 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param selectedTitleColor selectedTitleColor description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
                              frame:(CGRect)frame;

/**
 backImage

 @param normalBackgroundImage normalBackgroundImage description
 @param selectedBackgroundImage selectedBackgroundImage description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                      selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                        frame:(CGRect)frame;

/**
 image
 
 @param normalImage normalImage description
 @param selectedImage selectedImage description
 @param frame frame description
 @return return value description
 */
+ (UIButton *)buttonWithNormalImage:(UIImage *)normalImage
                      selectedImage:(UIImage *)selectedImage
                                        frame:(CGRect)frame;

@end

