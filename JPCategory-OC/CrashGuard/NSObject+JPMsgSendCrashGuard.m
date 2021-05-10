//
//  NSObject+JPMsgSendCrashGuard.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/5/10.
//

#import "NSObject+JPMsgSendCrashGuard.h"
#import "NSObject+JPSwizzledMethod.h"

// 拦截 unrecognized selector sent to class/instance 的crash 
@implementation NSObject (JPMsgSendCrashGuard)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [NSObject jp_swizzledInstanceMethodWithClass:[NSObject class] originalSelector:@selector(forwardingTargetForSelector:) swizzledSelector:@selector(jp_instance_forwardingTargetForSelector:)];
        [NSObject jp_swizzledClassMethodWithClass:[NSObject class] originalSelector:@selector(forwardingTargetForSelector:) swizzledSelector:@selector(jp_class_forwardingTargetForSelector:)];
        
    });
}

- (id)jp_instance_forwardingTargetForSelector:(SEL)aSelector {
    
    SEL forwardingSelector = @selector(forwardingTargetForSelector:);
    // 获取 NSObject 消息转发方法的函数指针IMP
    Method rootForwardingMethod = class_getInstanceMethod([NSObject class], forwardingSelector);
    IMP rootForwardingIMP = method_getImplementation(rootForwardingMethod);
    // 获取 当前类 消息转发方法的函数指针IMP
    Method currentForwardingMethod = class_getInstanceMethod([self class], forwardingSelector);
    IMP currentForwardingIMP = method_getImplementation(currentForwardingMethod);
//    NSLog(@"instance %@ rootForwardingIMP: %p, currentForwardingIMP: %p",self, rootForwardingIMP, currentForwardingIMP);
    // 判断当前类本身是否重写了 消息转发
    BOOL isRealizeForwarding = (rootForwardingIMP != currentForwardingIMP);
    // 如果没有重写 消息转发
    if (!isRealizeForwarding) {
        // 判断有没有重写 返回方法签名
        SEL methodSignatureSelector = @selector(methodSignatureForSelector:);
        // 获取 NSObject 返回方法签名的函数指针IMP
        Method rootMethodSignatureMethod = class_getInstanceMethod([NSObject class], methodSignatureSelector);
        IMP rootMethodSignatureIMP = method_getImplementation(rootMethodSignatureMethod);
        // 获取 当前类 返回方法签名的函数指针IMP
        Method currentMethodSignatureMethod = class_getInstanceMethod([self class], methodSignatureSelector);
        IMP currentMethodSignatureIMP = method_getImplementation(currentMethodSignatureMethod);
        // 判断当前类本身是否重写了 返回方法签名
        BOOL isRealizeMethodSignature = (rootMethodSignatureIMP != currentMethodSignatureIMP);
//        NSLog(@"instance %@ rootMethodSignatureIMP: %p, currentMethodSignatureIMP: %p",self, rootMethodSignatureIMP, currentMethodSignatureIMP);
        // 如果没有重写，则转发到自定义的类上，防止crash
        if (!isRealizeMethodSignature) {
            NSString *errorString = [NSString stringWithFormat:@"Crash⚠️  -[%@ %@]: unrecognized selector sent to instance %p", NSStringFromClass([self class]), NSStringFromSelector(aSelector), self];
            #ifdef DEBUG
            NSAssert(isRealizeMethodSignature, errorString);
            #else
            NSLog(@"%@", errorString);
            #endif
            // 创建一个 转发目标类
            NSString *crashGuardClassName = @"CrashGuardCLass";
            Class crashGuardClass = NSClassFromString(crashGuardClassName);
            // 如果 转发目标类 不存在，使用runtime动态创建一个
            if (!crashGuardClass) {
                crashGuardClass = objc_allocateClassPair([self class], crashGuardClassName.UTF8String, 0);
                // 注册 转发目标类
                objc_registerClassPair(crashGuardClass);
            }
            // 如果 转发目标类 没有调用的aSelector，则动态添加一个
            if (!class_getInstanceMethod(crashGuardClass, aSelector)) {
                Method method = class_getInstanceMethod([self class], @selector(crashGuardMethod));
                class_addMethod(crashGuardClass, aSelector, method_getImplementation(method), method_getTypeEncoding(method));
            }
            // 把消息转发到当前动态生成类的实例对象上
            return [[crashGuardClass alloc] init];
        }
    }
    
    return [self jp_instance_forwardingTargetForSelector:aSelector];
}

- (int)crashGuardMethod {
    return 0;
}

+ (id)jp_class_forwardingTargetForSelector:(SEL)aSelector {
    
    SEL forwardingSelector = @selector(forwardingTargetForSelector:);
    // 获取 NSObject 消息转发方法的函数指针IMP
    Method rootForwardingMethod = class_getClassMethod([NSObject class], forwardingSelector);
    IMP rootForwardingIMP = method_getImplementation(rootForwardingMethod);
    // 获取 当前类 消息转发方法的函数指针IMP
    Method currentForwardingMethod = class_getClassMethod([self class], forwardingSelector);
    IMP currentForwardingIMP = method_getImplementation(currentForwardingMethod);
//    NSLog(@"class %@ rootForwardingIMP: %p, currentForwardingIMP: %p",self, rootForwardingIMP, currentForwardingIMP);
    // 判断当前类本身是否重写了 消息转发
    BOOL isRealizeForwarding = (rootForwardingIMP != currentForwardingIMP);
    // 如果没有重写 消息转发
    if (!isRealizeForwarding) {
        // 判断有没有重写 返回方法签名
        SEL methodSignatureSelector = @selector(methodSignatureForSelector:);
        // 获取 NSObject 返回方法签名的函数指针IMP
        Method rootMethodSignatureMethod = class_getClassMethod([NSObject class], methodSignatureSelector);
        IMP rootMethodSignatureIMP = method_getImplementation(rootMethodSignatureMethod);
        // 获取 当前类 返回方法签名的函数指针IMP
        Method currentMethodSignatureMethod = class_getClassMethod([self class], methodSignatureSelector);
        IMP currentMethodSignatureIMP = method_getImplementation(currentMethodSignatureMethod);
        // 判断当前类本身是否重写了 返回方法签名
        BOOL isRealizeMethodSignature = (rootMethodSignatureIMP != currentMethodSignatureIMP);
//        NSLog(@"class %@ rootMethodSignatureIMP: %p, currentMethodSignatureIMP: %p",self, rootMethodSignatureIMP, currentMethodSignatureIMP);
        // 如果没有重写，则转发到自定义的类上，防止crash
        if (!isRealizeMethodSignature) {
            NSString *errorString = [NSString stringWithFormat:@"Crash⚠️  +[%@ %@]: unrecognized selector sent to class %p", NSStringFromClass([self class]), NSStringFromSelector(aSelector), [self class]];
            #ifdef DEBUG
            NSAssert(isRealizeMethodSignature, errorString);
            #else
            NSLog(@"%@", errorString);
            #endif
            // 创建一个 转发目标类
            NSString *crashGuardClassName = @"CrashGuardCLass";
            Class crashGuardClass = NSClassFromString(crashGuardClassName);
            // 如果 转发目标类 不存在，使用runtime动态创建一个
            if (!crashGuardClass) {
                crashGuardClass = objc_allocateClassPair([self class], crashGuardClassName.UTF8String, 0);
                // 注册 转发目标类
                objc_registerClassPair(crashGuardClass);
            }
            // 如果 转发目标类 没有调用的aSelector，则动态添加一个
            if (!class_getClassMethod(crashGuardClass, aSelector)) {
                Method method = class_getClassMethod([self class], @selector(crashGuardMethod));
                class_addMethod(crashGuardClass, aSelector, method_getImplementation(method), method_getTypeEncoding(method));
            }
            // 把消息转发到当前动态生成类的实例对象上
            return [[crashGuardClass alloc] init];
        }
    }
    
    return [[self class] jp_class_forwardingTargetForSelector:aSelector];
}

+ (int)crashGuardMethod {
    return 0;
}

@end
