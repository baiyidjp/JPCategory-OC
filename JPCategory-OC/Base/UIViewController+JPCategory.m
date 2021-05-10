//
//  UIViewController+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/1/20.
//

#import "../Base/UIViewController+JPCategory.h"
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

- (void)setJp_routeCompletion:(JPRouteCompletion)jp_routeCompletion {

    if (!jp_routeCompletion) {
        return;
    }
    objc_setAssociatedObject(self, @selector(jp_routeCompletion), jp_routeCompletion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JPRouteCompletion)jp_routeCompletion {

    return objc_getAssociatedObject(self, _cmd);
}

@end
