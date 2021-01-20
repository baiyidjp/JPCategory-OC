//
//  JPCategoryConfig.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *JPCategory_UINavigationBar_Config = @"JPCategory_UINavigationBar_Config";
static NSString *JPCategory_UINavigationBar_ScreenWidth = @"JPCategory_UINavigationBar_ScreenWidth";
static NSString *JPCategory_UINavigationBar_Margin = @"JPCategory_UINavigationBar_Margin";
static NSString *JPCategory_UINavigationBar_BigMargin = @"JPCategory_UINavigationBar_BigMargin";
static NSString *JPCategory_UILabel_FontName_Regular = @"JPCategory_UILabel_FontName_Regular";
static NSString *JPCategory_UILabel_FontName_Bold = @"JPCategory_UILabel_FontName_Bold";

@interface JPCategoryConfig : NSObject

/**
 * 移除 - 使用JPNavigationBar的分类
 */
+ (void)jp_removeNavigationBarCategory;

/**
 * 配置使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * 默认是左右Item距离边界间距基准屏幕16，大于基准屏幕20.
 */
+ (void)jp_configNavigationBarCategory;

/**
 * 配置使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * @param margin 左右的Item距离左右边界的距离
 */
+ (void)jp_configNavigationBarCategoryWithMargin:(CGFloat)margin;

/**
 * 配置使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * @param margin 基准屏幕宽度375的间距
 * @param bigMargin 大于375屏幕的间距
 */
+ (void)jp_configNavigationBarCategoryWithMargin:(CGFloat)margin bigMargin:(CGFloat)bigMargin;

/**
 * 配置使用JPNavigationBar的分类，适配iOS11自定义导航栏间距问题
 * @param screenWidth 自定义一个基准屏幕宽度
 * @param margin 基准屏幕上的间距
 * @param bigMargin 大于基准屏幕上的间距
 */
+ (void)jp_configNavigationBarCategoryWithDefaultScreenWidth:(CGFloat)screenWidth margin:(CGFloat)margin bigMargin:(CGFloat)bigMargin;

/**
 * 移除已配置的自定义字体名
 */
+ (void)jp_removeCustomFontName;

/**
 * 可在程序开始时配置自定义的文字名
 * @param regularName
 * @param boldName
 */
+ (void)jp_configCustomFontNameWithRegular:(NSString *)regularName bold:(NSString *)boldName;

/**
 * 同时配置NavigationBar分类和自定义字体
 * @param regularName
 * @param boldName
 */
+ (void)jp_configNavigationBarCategoryAndCustomFontNameWithRegular:(NSString *)regularName bold:(NSString *)boldName;

@end

NS_ASSUME_NONNULL_END
