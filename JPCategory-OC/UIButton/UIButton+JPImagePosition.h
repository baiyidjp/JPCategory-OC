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
 * 设置图片居左,默认间距 8
 */
- (void)setImagePosition;

/**
 * 设置图片居左,自动适配间距
 */
- (void)setImagePositionAutoMargin:(BOOL)autoMargin;

/**
 * 设置图片居左,自定义间距
 * @param margin
 */
- (void)setImagePositionWithMargin:(CGFloat)margin;

/**
 * 设置图片，默认自动适配间距
 * @param position
 * @param margin
 */
- (void)setImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin;

/**
 * 设置图片位置，自定义
 * @param position
 * @param margin
 * @param autoMargin
 */
- (void)setImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(BOOL)autoMargin;

@end

NS_ASSUME_NONNULL_END
