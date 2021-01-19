//
//  NSObject+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *NSObject_JPCategory_Approve = @"NSObject_JPCategory_Approve";
static NSString *NSObject_JPCategory_ScreenWidth = @"NSObject_JPCategory_ScreenWidth";
static NSString *NSObject_JPCategory_Margin = @"NSObject_JPCategory_Margin";
static NSString *NSObject_JPCategory_BigMargin = @"NSObject_JPCategory_BigMargin";

@interface NSObject (JPCategory)

/**
 * 使用runtime交换方法
 * @param cls 方法的调用者 class
 * @param selector 原方法（系统方法）
 * @param newSelector 替换方法（自定义方法）
 */
+ (void)jp_swizzledMethodWithClass:(Class)cls selector:(NSString *)selector newSelector:(NSString *)newSelector;

/**
 * 使用runtime交换方法
 * @param originalClass 原方法的调用者
 * @param newClass 替换方法的调用者
 * @param selector 原方法
 * @param newSelector 替换方法
 */
+ (void)jp_swizzledMethodWithOriginalClass:(Class)originalClass newClass:(Class)newClass selector:(NSString *)selector newSelector:(NSString *)newSelector;

/**
 * 取消 - 同意使用JPNavigationBar的分类
 */
+ (void)jp_cancelApproveUseJPNavigationBar;

/**
 * 同意使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * 默认是左右Item距离边界间距是16.
 */
+ (void)jp_approveUseJPNavigationBar;

/**
 * 同意使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * @param margin 左右的Item距离左右边界的距离
 */
+ (void)jp_approveUseJPNavigationBarWithMargin:(CGFloat)margin;

/**
 * 同意使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * @param margin 基准屏幕宽度375的间距
 * @param bigMargin 大于375屏幕的间距
 */
+ (void)jp_approveUseJPNavigationBarWithMargin:(CGFloat)margin bigMargin:(CGFloat)bigMargin;

/**
 * 同意使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * @param screenWidth 自定义一个基准屏幕宽度
 * @param margin 基准屏幕上的间距
 * @param bigMargin 大于基准屏幕上的间距
 */
+ (void)jp_approveUseJPNavigationBarWithDefaultScreenWidth:(CGFloat)screenWidth margin:(CGFloat)margin bigMargin:(CGFloat)bigMargin;

@end

NS_ASSUME_NONNULL_END
