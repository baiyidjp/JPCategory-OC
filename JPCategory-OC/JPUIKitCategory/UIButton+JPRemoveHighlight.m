//
//  UIButton+JPRemoveHighlight.m
//  JPButtonCategoryDemo
//
//  Created by baiyidjp on 2020/12/18.
//

#import "UIButton+JPRemoveHighlight.h"
#import "NSObject+JPSwizzledMethod.h"

@implementation UIButton (JPRemoveHighlight)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject jp_swizzledInstanceMethodWithClass:[UIButton class] originalSelector:@selector(setHighlighted:) swizzledSelector:@selector(jp_SetHighlighted:)];
    });
}

- (void)jp_SetHighlighted:(BOOL)highlighted {
    if (!self.jp_removeHighlightState) {
        //如果没有设置 jp_removeHighlightState 为Yes,就执行原有的方法,而原有的方法已经被我们替换,所以就执行当前这个方法
        [self jp_SetHighlighted:highlighted];
    }
}

- (void)setJp_removeHighlightState:(BOOL)jp_removeHighlightState {
    
    objc_setAssociatedObject(self, @selector(jp_removeHighlightState), @(jp_removeHighlightState), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)jp_removeHighlightState {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
