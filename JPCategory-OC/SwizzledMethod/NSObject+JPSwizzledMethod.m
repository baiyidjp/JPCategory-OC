//
//  NSObject+SwizzledMethod.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "NSObject+JPSwizzledMethod.h"

@implementation NSObject (JPSwizzledMethod)

+ (void)jp_swizzledInstanceMethodWithClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {

    if (cls == nil) {
        cls = [self class];
    }

    [NSObject jp_swizzledInstanceMethodWithOriginalClass:cls swizzledClass:cls originalSelector:originalSelector swizzledSelector:swizzledSelector];
}

+ (void)jp_swizzledInstanceMethodWithOriginalClass:(Class)originalClass swizzledClass:(Class)swizzledClass originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {

    if (originalClass == nil) {
        originalClass = [self class];
    }

    if (swizzledClass == nil) {
        swizzledClass = [self class];
    }

    Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);

    BOOL isAddSuccess = class_addMethod(originalClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isAddSuccess) {
        class_replaceMethod(swizzledClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)jp_swizzledClassMethodWithClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {

    if (cls == nil) {
        cls = [self class];
    }

    [NSObject jp_swizzledClassMethodWithOriginalClass:cls swizzledClass:cls originalSelector:originalSelector swizzledSelector:swizzledSelector];
}

+ (void)jp_swizzledClassMethodWithOriginalClass:(Class)originalClass swizzledClass:(Class)swizzledClass originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {

    if (originalClass == nil) {
        originalClass = [self class];
    }

    if (swizzledClass == nil) {
        swizzledClass = [self class];
    }

    Method originalMethod = class_getClassMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getClassMethod(swizzledClass, swizzledSelector);

    BOOL isAddSuccess = class_addMethod(originalClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isAddSuccess) {
        class_replaceMethod(swizzledClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
