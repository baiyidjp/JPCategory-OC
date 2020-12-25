//
//  UIButton+JPInitMethod.m
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import "UIButton+JPInitMethod.h"

@implementation UIButton (JPInitMethod)

+ (UIButton *)buttonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage frame:(CGRect)frame {
    
        return [self buttonWithNormalTitle:nil selectedTitle:nil titleFont:nil normalTitleColor:nil selectedTitleColor:nil normalBackgroundImage:nil selectedBackgroundImage:nil normalImage:normalImage selectedImage:selectedImage frame:frame];
}
+ (UIButton *)buttonWithNormalBackgroundImage:(UIImage *)normalBackgroundImage selectedBackgroundImage:(UIImage *)selectedBackgroundImage frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:nil selectedTitle:nil titleFont:nil normalTitleColor:nil selectedTitleColor:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:selectedBackgroundImage normalImage:nil selectedImage:nil frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalBackgroundImage:nil selectedBackgroundImage:nil normalImage:nil selectedImage:nil frame:frame];

}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor normalImage:(UIImage *)normalImage frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalBackgroundImage:nil selectedBackgroundImage:nil normalImage:normalImage selectedImage:normalImage frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage frame:(CGRect)frame {
    return [self buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalBackgroundImage:nil selectedBackgroundImage:nil normalImage:normalImage selectedImage:selectedImage frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor normalBackgroundImage:(UIImage *)normalBackgroundImage frame:(CGRect)frame {

    return [self buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:nil normalImage:nil selectedImage:nil frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle titleFont:(UIFont *)titleFont normalTitleColor:(UIColor *)normalTitleColor selectedTitleColor:(UIColor *)selectedTitleColor frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalBackgroundImage:nil selectedBackgroundImage:nil normalImage:nil selectedImage:nil frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle titleFont:(UIFont*)titleFont normalTitleColor:(UIColor *)normalTitleColor selectedTitleColor:(UIColor *)selectedTitleColor normalBackgroundImage:(UIImage *)normalBackgroundImage selectedBackgroundImage:(UIImage *)selectedBackgroundImage frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:normalTitle selectedTitle:nil titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:nil normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:selectedBackgroundImage normalImage:nil selectedImage:nil frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                      selectedTitle:(NSString *)selectedTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
                              frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:normalTitle selectedTitle:selectedTitle titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:selectedTitleColor normalBackgroundImage:nil selectedBackgroundImage:nil normalImage:nil selectedImage:nil frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
          selectedTitle:(NSString *)selectedTitle
              titleFont:(UIFont *)titleFont
       normalTitleColor:(UIColor *)normalTitleColor
     selectedTitleColor:(UIColor *)selectedTitleColor
  normalBackgroundImage:(UIImage *)normalBackgroundImage
selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                              frame:(CGRect)frame {
    
    return [self buttonWithNormalTitle:normalTitle selectedTitle:selectedTitle titleFont:titleFont normalTitleColor:normalTitleColor selectedTitleColor:selectedTitleColor normalBackgroundImage:normalBackgroundImage selectedBackgroundImage:selectedBackgroundImage normalImage:nil selectedImage:nil frame:frame];
}

+ (UIButton *)buttonWithNormalTitle:(NSString *)normalTitle
                      selectedTitle:(NSString *)selectedTitle
                          titleFont:(UIFont *)titleFont
                   normalTitleColor:(UIColor *)normalTitleColor
                 selectedTitleColor:(UIColor *)selectedTitleColor
              normalBackgroundImage:(UIImage *)normalBackgroundImage
            selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                        normalImage:(UIImage *)normalImage
                      selectedImage:(UIImage *)selectedImage
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
