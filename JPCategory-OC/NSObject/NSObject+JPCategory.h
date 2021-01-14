//
//  NSObject+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JPCategory)

+ (void)jp_swizzledMethodWithClass:(Class)cls selector:(NSString *)selector newSelector:(NSString *)newSelector;

+ (void)jp_swizzledMethodWithOriginalClass:(Class)originalClass newClass:(Class)newClass selector:(NSString *)selector newSelector:(NSString *)newSelector;

@end

NS_ASSUME_NONNULL_END
