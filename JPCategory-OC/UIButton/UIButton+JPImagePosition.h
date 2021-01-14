//
//  UIButton+JPImagePosition.h
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JPButtonImagePosition) {
    JPButtonImagePosition_Top,
    JPButtonImagePosition_Left,
    JPButtonImagePosition_Bottom,
    JPButtonImagePosition_Right
};

@interface UIButton (JPImagePosition)

/**
 * 默认图片相对于文字居左,默认图片文字间距为8,默认宽高不足自动适配图片文字间距
 */
- (void)jp_imagePosition;

/**
 * 默认图片文字间距为8,默认宽高不足自动适配图片文字间距
 * @param position 自定义图片相对于文字方向
 */
- (void)jp_imagePosition:(JPButtonImagePosition)position;

/**
 * 默认图片相对于文字居左,默认宽高不足自动适配图片文字间距
 * @param margin 自定义图片文字间距
 */
- (void)jp_imagePositionWithMargin:(CGFloat)margin;

/**
 * 默认图片相对于文字居左,默认图片文字间距为8
 * @param autoMargin 是否在宽高不足时自动适配图片文字间距
 */
- (void)jp_imagePositionWithAutoMargin:(BOOL)autoMargin;

/**
 * 默认宽高不足自动适配图片文字间距
 * @param position 自定义图片相对于文字方向
 * @param margin 自定义图片文字间距
 */
- (void)jp_imagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin;

/**
 * 默认图片文字间距为8
 * @param position 自定义图片相对于文字方向
 * @param autoMargin 是否在宽高不足时自动适配图片文字间距
 */
- (void)jp_imagePosition:(JPButtonImagePosition)position autoMargin:(BOOL)autoMargin;

/**
 * 默认图片相对于文字居左
 * @param margin 自定义图片文字间距
 * @param autoMargin 是否在宽高不足时自动适配图片文字间距
 */
- (void)jp_imagePositionWithMargin:(CGFloat)margin autoMargin:(BOOL)autoMargin;

/**
 * 完全自定义
 * @param position 自定义图片相对于文字方向
 * @param margin 自定义图片文字间距
 * @param autoMargin 是否在宽高不足时自动适配图片文字间距
 */
- (void)jp_imagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(BOOL)autoMargin;

@end

NS_ASSUME_NONNULL_END
