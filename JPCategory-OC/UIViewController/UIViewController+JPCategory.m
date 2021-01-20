//
//  UIViewController+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "UIViewController+JPCategory.h"
#import "objc/runtime.h"

@implementation UIViewController (JPCategory)

- (void)setJp_parameters:(NSDictionary *)jp_parameters {

    if (!jp_parameters) {
        return;
    }
    objc_setAssociatedObject(self, @selector(jp_parameters), jp_parameters, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)jp_parameters {

    return objc_getAssociatedObject(self, _cmd);
}

@end
