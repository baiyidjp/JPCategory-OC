//
//  NSObject+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
