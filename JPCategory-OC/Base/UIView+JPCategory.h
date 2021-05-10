//
//  UIView+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecognizer);

@interface UIView (JPCategory)

@property(nonatomic, assign) CGFloat jp_x;
@property(nonatomic, assign) CGFloat jp_y;
@property(nonatomic, assign) CGFloat jp_w;
@property(nonatomic, assign) CGFloat jp_h;
@property(nonatomic, assign) CGSize jp_size;
@property(nonatomic, assign) CGFloat jp_centerX;
@property(nonatomic, assign) CGFloat jp_centerY;
@property(nonatomic, assign) CGFloat jp_maxX;
@property(nonatomic, assign) CGFloat jp_maxY;

/**
 * 移除当前View的所有子view
 */
- (void)jp_removeAllSubViews;

/**
 * 给View添加单击手势
 * @param block
 */
- (void)jp_addTapActionWithBlock:(GestureActionBlock)block;

/**
 * 给View添加长按手势
 * @param block
 */
- (void)jp_addLongPressActionWithBlock:(GestureActionBlock)block;

/**
 * 给View添加长按手势
 * @param minimumPressDuration
 * @param block
 */
- (void)jp_addLongPressActionWithDuration:(NSTimeInterval)minimumPressDuration block:(GestureActionBlock)block;

/**
 获取当前view所在的控制器

 @return 当前控制器
 */
- (UIViewController *)jp_currentController;

/**
 切圆角->已知size(杜绝离屏渲染)

 @param cornerRadius 圆角半径
 */
- (void)jp_addCornerRadius:(CGFloat)cornerRadius;

/**
 切圆角->已知size

 @param corner 可选择圆角位置
 @param cornerRadius 圆角半径
 */
- (void)jp_addCorner:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius;

/**
 切圆角

 @param corner 选择圆角位置
 @param cornerRadius 圆角半径
 @param targetSize size
 */
- (void)jp_addCorner:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius size:(CGSize)targetSize;

@end

NS_ASSUME_NONNULL_END
