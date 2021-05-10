//
//  NSObject+SwizzledMethod.h
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JPSwizzledMethod)

/**
 * 使用runtime交换对象方法
 * @param cls 方法的调用者 class
 * @param originalSelector 原方法（系统方法）
 * @param swizzledSelector 替换方法（自定义方法）
 */
+ (void)jp_swizzledInstanceMethodWithClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

/**
 * 使用runtime交换对象方法
 * @param originalClass 原方法的调用者
 * @param swizzledClass 替换方法的调用者
 * @param originalSelector 原方法
 * @param swizzledSelector 替换方法
 */
+ (void)jp_swizzledInstanceMethodWithOriginalClass:(Class)originalClass swizzledClass:(Class)swizzledClass originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

/**
 * 使用runtime交换类方法
 * @param cls 方法的调用者 class
 * @param originalSelector 原方法（系统方法）
 * @param swizzledSelector 替换方法（自定义方法）
 */
+ (void)jp_swizzledClassMethodWithClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

/**
 * 使用runtime交换类方法
 * @param originalClass 原方法的调用者
 * @param swizzledClass 替换方法的调用者
 * @param originalSelector 原方法
 * @param swizzledSelector 替换方法
 */
+ (void)jp_swizzledClassMethodWithOriginalClass:(Class)originalClass swizzledClass:(Class)swizzledClass originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
