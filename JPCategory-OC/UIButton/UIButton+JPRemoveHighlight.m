//
//  UIButton+JPRemoveHighlight.m
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import "UIButton+JPRemoveHighlight.h"
#import <objc/runtime.h>

#define KEY @"JPRemoveHighlightKey"

@implementation UIButton (JPRemoveHighlight)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(setHighlighted:);
        SEL swizzledSelector = @selector(jp_SetHighlighted:);

        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)jp_SetHighlighted:(BOOL)highlighted {
    if (!self.jp_removeHighlightState) {
        //如果没有设置removeHighlight为Yes,就执行原有的方法,而原有的方法已经被我们替换,所以就执行当前这个方法
        [self jp_SetHighlighted:highlighted];
    }
}

- (void)setJp_removeHighlightState:(BOOL)jp_removeHighlightState {
    
    objc_setAssociatedObject(self, KEY, @(jp_removeHighlightState), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)jp_removeHighlightState {
    
    return [objc_getAssociatedObject(self, KEY) boolValue];
}

@end
