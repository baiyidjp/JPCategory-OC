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

+ (void)jp_cancelApproveUseJPNavigationBar {

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSObject_JPCategory_Approve];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSObject_JPCategory_ScreenWidth];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSObject_JPCategory_Margin];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSObject_JPCategory_BigMargin];
}

+ (void)jp_approveUseJPNavigationBar {

    [self jp_approveUseJPNavigationBarWithMargin:16];
}

+ (void)jp_approveUseJPNavigationBarWithMargin:(CGFloat)margin {

    [self jp_approveUseJPNavigationBarWithDefaultScreenWidth:375.0 margin:margin bigMargin:margin];
}

+ (void)jp_approveUseJPNavigationBarWithMargin:(CGFloat)margin bigMargin:(CGFloat)bigMargin {

    [self jp_approveUseJPNavigationBarWithDefaultScreenWidth:375.0 margin:margin bigMargin:bigMargin];
}

+ (void)jp_approveUseJPNavigationBarWithDefaultScreenWidth:(CGFloat)screenWidth margin:(CGFloat)margin bigMargin:(CGFloat)bigMargin {
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:NSObject_JPCategory_Approve];
    [[NSUserDefaults standardUserDefaults] setFloat:(float) screenWidth forKey:NSObject_JPCategory_ScreenWidth];
    [[NSUserDefaults standardUserDefaults] setFloat:(float) margin forKey:NSObject_JPCategory_Margin];
    [[NSUserDefaults standardUserDefaults] setFloat:(float) bigMargin forKey:NSObject_JPCategory_BigMargin];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
