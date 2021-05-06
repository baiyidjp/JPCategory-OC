//
//  UIButton+JPImagePosition.h
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JPButtonImagePosition) {
    JPButtonImagePosition_None,
    JPButtonImagePosition_Top,
    JPButtonImagePosition_Left,
    JPButtonImagePosition_Bottom,
    JPButtonImagePosition_Right
};

typedef NS_ENUM(NSInteger, JPButtonImageAutoMargin) {
    JPButtonImageAutoMargin_None,
    JPButtonImageAutoMargin_YES,
    JPButtonImageAutoMargin_NO
};

@interface UIButton (JPImagePosition)

/********单独设置属性需要写在 imagePosition 方法之前***********/

/** 手动设置图片位置 */
@property(nonatomic,assign) JPButtonImagePosition jp_Position;
/** 手动设置图片文字间距 */
@property(nonatomic,assign) CGFloat jp_Margin;
/** 手动设置是否自动适配间距 */
@property(nonatomic,assign) JPButtonImageAutoMargin jp_AutoMargin;

/********单独设置属性需要写在 imagePosition 方法之前***********/

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
- (void)jp_imagePositionWithAutoMargin:(JPButtonImageAutoMargin)autoMargin;

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
- (void)jp_imagePosition:(JPButtonImagePosition)position autoMargin:(JPButtonImageAutoMargin)autoMargin;

/**
 * 默认图片相对于文字居左
 * @param margin 自定义图片文字间距
 * @param autoMargin 是否在宽高不足时自动适配图片文字间距
 */
- (void)jp_imagePositionWithMargin:(CGFloat)margin autoMargin:(JPButtonImageAutoMargin)autoMargin;

/**
 * 完全自定义
 * @param position 自定义图片相对于文字方向
 * @param margin 自定义图片文字间距
 * @param autoMargin 是否在宽高不足时自动适配图片文字间距
 */
- (void)jp_imagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(JPButtonImageAutoMargin)autoMargin;

@end

NS_ASSUME_NONNULL_END
