//
//  UIButton+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "../Base/UIButton+JPCategory.h"

@implementation UIButton (JPCategory)

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalImage:nil selectedImage:nil normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                           normalImage:(UIImage *)normalImage
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalImage:normalImage selectedImage:normalImage normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:selectedTitle titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:selectedTitleColor normalImage:nil selectedImage:nil normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalImage:normalImage selectedImage:selectedImage normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame {
    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:selectedTitle titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:selectedTitleColor normalImage:normalImage selectedImage:selectedImage normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalImage:nil selectedImage:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:selectedBackgroundImage frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:selectedTitle titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:selectedTitleColor normalImage:nil selectedImage:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:selectedBackgroundImage frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalImage:nil selectedImage:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                                 frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalImage:nil selectedImage:nil normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage
                         selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                           frame:(CGRect)frame {

    return [self jp_buttonWithNormalTitle:nil selectedTitle:nil titleFont:nil normalTitleColor:nil selectedTitleColor:nil normalImage:nil selectedImage:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:selectedBackgroundImage frame:frame];
}

+ (UIButton *)jp_buttonWithNormalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                                 frame:(CGRect)frame {

        return [self jp_buttonWithNormalTitle:nil selectedTitle:nil titleFont:nil normalTitleColor:nil selectedTitleColor:nil normalImage:normalImage selectedImage:selectedImage normalBackgroundImage:nil selectedBackgroundImage:nil frame:frame];
}

+ (UIButton *)jp_buttonWithNormalTitle:(NSString *)normalTitle
                         selectedTitle:(NSString *)selectedTitle
                             titleFont:(UIFont *)titleFont
                      normalTitleColor:(UIColor *)normalTitleColor
                    selectedTitleColor:(UIColor *)selectedTitleColor
                           normalImage:(UIImage *)normalImage
                         selectedImage:(UIImage *)selectedImage
                 normalBackgroundImage:(UIImage *)normalBackgroundImage
               selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                                 frame:(CGRect)frame {

    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    if (normalTitle) {
        [button setTitle:normalTitle forState:UIControlStateNormal];
    }
    if (selectedTitle) {
        [button setTitle:selectedTitle forState:UIControlStateSelected];
    }
    if (titleFont) {
        [button.titleLabel setFont:titleFont];
    }
    if (normalTitleColor) {
        [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    }
    if (selectedTitleColor) {
        [button setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    }
    if (normalBackgroundImage) {
        [button setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
    }
    if (selectedBackgroundImage) {
        [button setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
    }
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    return button;
}

@end
