//
//  NSObject+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import "NSObject+JPCategory.h"
#import <objc/runtime.h>

@implementation NSObject (JPCategory)

+ (void)jp_swizzledMethodWithClass:(Class)cls selector:(NSString *)selector newSelector:(NSString *)newSelector {

    if (cls == nil) {
        cls = [self class];
    }

    [NSObject jp_swizzledMethodWithOriginalClass:cls newClass:cls selector:selector newSelector:newSelector];
}

+ (void)jp_swizzledMethodWithOriginalClass:(Class)originalClass newClass:(Class)newClass selector:(NSString *)selector newSelector:(NSString *)newSelector {

    if (originalClass == nil) {
        originalClass = [self class];
    }

    if (newClass == nil) {
        newClass = [self class];
    }

    SEL originalSelector = NSSelectorFromString(selector);
    SEL swizzledSelector = NSSelectorFromString(newSelector);

    Method originalMethod = class_getInstanceMethod(originalClass, NSSelectorFromString(selector));
    Method swizzledMethod = class_getInstanceMethod(newClass, NSSelectorFromString(newSelector));

    BOOL isAddSuccess = class_addMethod(originalClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isAddSuccess) {
        class_replaceMethod(newClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}

@end
