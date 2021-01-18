//
//  UIButton+JPInitMethod.h
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import <UIKit/UIKit.h>

@interface UIButton (JPInitMethod)

/**
 * init button (title/font/titleColor)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                                 frame:(CGRect)frame;

/**
 * init button (title/font/titleColor/normalImage)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param normalImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                           normalImage:(UIImage *)normalImage
                                 frame:(CGRect)frame;

/**
 * init button (title/selectedTitle/font/titleColor/selectedTitleColor)
 * @param normalTitle
 * @param selectedTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                                 frame:(CGRect)frame;

/**
 init button (title/font/titleColor/normalImage/selectedImage)

 @param normalTitle normalTitle description
 @param titleFont titleFont description
 @param normalTitleColor normalTitleColor description
 @param normalImage normalImage description
 @param selectedImage
 @param frame frame description
 @return return value description
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame;

/**
 * init button (normalTitle/selectedTitle/titleFont/normalTitleColor/selectedTitleColor/normalImage/selectedImage)
 * @param normalTitle
 * @param selectedTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param normalImage
 * @param selectedImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame;

/**
 * init button (title/font/titleColor/selectedTitleColor/normalBackgroundImage/selectedBackgroundImage)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param normalBackgroundImage
 * @param selectedBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame;

/**
 * init button (title/selectedTitle/font/titleColor/selectedTitleColor/normalBackgroundImage/selectedBackgroundImage)
 * @param normalTitle
 * @param selectedTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param normalBackgroundImage
 * @param selectedBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame;

/**
 * init button (title/font/titleColor/normalBackgroundImage)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param normalBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
                                 frame:(CGRect)frame;


/**
 * init button (title/font/titleColor/selectedTitleColor)
 * @param normalTitle
 * @param titleFont
 * @param normalTitleColor
 * @param selectedTitleColor
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                                 frame:(CGRect)frame;

/**
 * init button (normalBackgroundImage/selectedBackgroundImage)
 * @param normalBackgroundImage
 * @param selectedBackgroundImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                         selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                           frame:(CGRect)frame;

/**
 * init button (normalImage/selectedImage)
 * @param normalImage
 * @param selectedImage
 * @param frame
 * @return
 */
+ (UIButton *)jp_buttonWithNormalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame;

 /**
  * init button 全部属性
  * @param normalTitle normal 文本
  * @param selectedTitle selected 文本
  * @param titleFont 字号
  * @param normalTitleColor normal 文本颜色
  * @param selectedTitleColor selected 文本颜色
  * @param normalImage normal 图片
  * @param selectedImage selected 图片
  * @param normalBackgroundImage normal 背景图
  * @param selectedBackgroundImage selected 背景图
  * @param frame
  * @return
  */
+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame;

@end

