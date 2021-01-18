//
//  UIView+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;
static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;

#import "UIView+JPCategory.h"
#import <objc/runtime.h>

@implementation UIView (JPCategory)

- (CGFloat)jp_x {

    return self.frame.origin.x;
}

- (void)setStey_x:(CGFloat)jp_x {

    CGRect frame = self.frame;
    frame.origin.x = jp_x;
    self.frame = frame;
}

- (CGFloat)jp_y {

    return self.frame.origin.y;
}

- (void)setStey_y:(CGFloat)jp_y {

    CGRect frame = self.frame;
    frame.origin.y = jp_y;
    self.frame = frame;
}

- (CGFloat)jp_w {

    return self.frame.size.width;
}

- (void)setStey_w:(CGFloat)jp_w {

    CGRect frame = self.frame;
    frame.size.width = jp_w;
    self.frame = frame;
}

- (CGFloat)jp_h {

    return self.frame.size.height;
}

- (void)setStey_h:(CGFloat)jp_h {

    CGRect frame = self.frame;
    frame.size.height = jp_h;
    self.frame = frame;
}

- (CGSize)jp_size {

    return self.frame.size;
}

- (void)setStey_size:(CGSize)jp_size {

    CGRect frame = self.frame;
    frame.size = jp_size;
    self.frame = frame;
}

- (CGFloat)jp_centerX {

    return self.center.x;
}

- (void)setStey_centerX:(CGFloat)jp_centerX {

    CGPoint center = self.center;
    center.x = jp_centerX;
    self.center = center;
}

- (CGFloat)jp_centerY {

    return self.center.y;
}

- (void)setStey_centerY:(CGFloat)jp_centerY {

    CGPoint center = self.center;
    center.y = jp_centerY;
    self.center = center;
}

- (CGFloat)jp_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)jp_maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)jp_removeAllSubViews {

    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)jp_addTapActionWithBlock:(GestureActionBlock)block {

    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

- (void)jp_addLongPressActionWithBlock:(GestureActionBlock)block {

    [self jp_addLongPressActionWithDuration:0.5 block:block];
}

- (void)jp_addLongPressActionWithDuration:(NSTimeInterval)minimumPressDuration block:(GestureActionBlock)block {

    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey);
    if (!gesture) {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        gesture.minimumPressDuration = minimumPressDuration;
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture {

    if (gesture.state == UIGestureRecognizerStateRecognized) {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

- (UIViewController *)jp_currentController {

    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *) nextResponder;
        }
    }
    return nil;
}

- (void)jp_addCornerRadius:(CGFloat)cornerRadius {
    [self jp_addCorner:UIRectCornerAllCorners cornerRadius:cornerRadius];
}

- (void)jp_addCorner:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius {
    [self jp_addCorner:corner cornerRadius:cornerRadius size:self.bounds.size];
}


- (void)jp_addCorner:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius size:(CGSize)targetSize {
    
    CGRect frame = CGRectMake(0, 0, targetSize.width, targetSize.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame
                                               byRoundingCorners:corner
                                                     cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = frame;
    layer.path = path.CGPath;
    
    self.layer.mask = layer;
}


@end
