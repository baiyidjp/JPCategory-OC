//
//  NSObject+JPNavigationBar.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/19.
//

#import "NSObject+JPNavigationBar.h"
#import <UIKit/UIKit.h>
#import "NSObject+JPCategory.h"

@implementation NSObject (JPNavigationBar)

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

@end
