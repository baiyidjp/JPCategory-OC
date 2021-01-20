//
//  NSObject+JPNavigationBar.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/19.
//

#import "NSObject+JPNavigationBar.h"
#import "NSObject+JPCategory.h"

@implementation NSObject (JPNavigationBar)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {

            [NSObject jp_cancelApproveUseJPNavigationBar];

            NSDictionary *oriSelectors = @{@"_UINavigationBarContentViewLayout": @"_updateMarginConstraints"};
            [oriSelectors enumerateKeysAndObjectsUsingBlock:^(NSString *originalClass, NSString *originalSelector, BOOL * _Nonnull stop) {
                [NSObject jp_swizzledMethodWithOriginalClass:NSClassFromString(originalClass) newClass:self selector:originalSelector newSelector:@"jp_updateMarginConstraints"];
            }];
        }
    });
}

- (void)jp_updateMarginConstraints {
    [self jp_updateMarginConstraints];

    // 取出保存的数据
    BOOL isApprove = [[NSUserDefaults standardUserDefaults] boolForKey:NSObject_JPCategory_Approve];
    if (isApprove) {
        if (![self isMemberOfClass:NSClassFromString(@"_UINavigationBarContentViewLayout")]) return;
        CGFloat screenWidth = [[NSUserDefaults standardUserDefaults] floatForKey:NSObject_JPCategory_ScreenWidth];
        CGFloat margin = [[NSUserDefaults standardUserDefaults] floatForKey:NSObject_JPCategory_Margin];
        CGFloat bigMargin = [[NSUserDefaults standardUserDefaults] floatForKey:NSObject_JPCategory_BigMargin];
        [self jp_adjustLeadingBarConstraintsWithScreenWidth:screenWidth margin:margin bigMargin:bigMargin];
        [self jp_adjustTrailingBarConstraintsWithScreenWidth:screenWidth margin:margin bigMargin:bigMargin];
    }
}

- (void)jp_adjustLeadingBarConstraintsWithScreenWidth:(CGFloat)screenWidth margin:(CGFloat)margin bigMargin:(CGFloat)bigMargin {

    NSArray<NSLayoutConstraint *> *leadingBarConstraints = [self valueForKey:@"_leadingBarConstraints"];
    if (!leadingBarConstraints) return;
    CGFloat fixedSpace = [UIScreen mainScreen].bounds.size.width > screenWidth ? bigMargin : margin;
    CGFloat constant = -fixedSpace + 8;
    for (NSLayoutConstraint *constraint in leadingBarConstraints) {
        if (constraint.firstAttribute == NSLayoutAttributeLeading && constraint.secondAttribute == NSLayoutAttributeLeading) {
            constraint.constant = constant;
        }
    }
}

- (void)jp_adjustTrailingBarConstraintsWithScreenWidth:(CGFloat)screenWidth margin:(CGFloat)margin bigMargin:(CGFloat)bigMargin {
    
    NSArray<NSLayoutConstraint *> *trailingBarConstraints = [self valueForKey:@"_trailingBarConstraints"];
    if (!trailingBarConstraints) return;
    CGFloat fixedSpace = [UIScreen mainScreen].bounds.size.width > screenWidth ? bigMargin : margin;
    CGFloat constant = fixedSpace-8;
    for (NSLayoutConstraint *constraint in trailingBarConstraints) {
        if (constraint.firstAttribute == NSLayoutAttributeTrailing && constraint.secondAttribute == NSLayoutAttributeTrailing) {
            constraint.constant = constant;
        }
    }
}

@end
