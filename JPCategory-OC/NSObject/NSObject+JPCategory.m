//
//  NSObject+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import "NSObject+JPCategory.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation NSObject (JPCategory)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            NSDictionary *oriSelectors = @{@"_UINavigationBarContentViewLayout": @"_updateMarginConstraints"};
            [oriSelectors enumerateKeysAndObjectsUsingBlock:^(NSString *originalClass, NSString *originalSelector, BOOL * _Nonnull stop) {
                [NSObject jp_swizzledMethodWithOriginalClass:NSClassFromString(originalClass) newClass:self selector:originalSelector newSelector:@"jp_updateMarginConstraints"];
            }];
        }
    });
}

- (void)jp_updateMarginConstraints {
    [self jp_updateMarginConstraints];
    
    if (![self isMemberOfClass:NSClassFromString(@"_UINavigationBarContentViewLayout")]) return;
    [self jp_adjustLeadingBarConstraints];
    [self jp_adjustTrailingBarConstraints];
}

- (void)jp_adjustLeadingBarConstraints {
    
    NSArray<NSLayoutConstraint *> *leadingBarConstraints = [self valueForKey:@"_leadingBarConstraints"];
    if (!leadingBarConstraints) return;
    CGFloat fixedSpace = [UIScreen mainScreen].bounds.size.width > 375 ? 20 : 16;
    CGFloat constant = -fixedSpace+8;
    for (NSLayoutConstraint *constraint in leadingBarConstraints) {
        if (constraint.firstAttribute == NSLayoutAttributeLeading && constraint.secondAttribute == NSLayoutAttributeLeading) {
            constraint.constant = constant;
        }
    }
}

- (void)jp_adjustTrailingBarConstraints {
    
    NSArray<NSLayoutConstraint *> *trailingBarConstraints = [self valueForKey:@"_trailingBarConstraints"];
    if (!trailingBarConstraints) return;
    CGFloat fixedSpace = [UIScreen mainScreen].bounds.size.width > 375 ? 20 : 16;
    CGFloat constant = fixedSpace-8;
    for (NSLayoutConstraint *constraint in trailingBarConstraints) {
        if (constraint.firstAttribute == NSLayoutAttributeTrailing && constraint.secondAttribute == NSLayoutAttributeTrailing) {
            constraint.constant = constant;
        }
    }
}

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
