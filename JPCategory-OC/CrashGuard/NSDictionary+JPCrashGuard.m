//
//  NSDictionary+CrashGuard.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "NSDictionary+JPCrashGuard.h"
#import "NSObject+JPSwizzledMethod.h"

@implementation NSDictionary (JPCrashGuard)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        Class cls = NSClassFromString(@"__NSPlaceholderDictionary");
        [NSObject jp_swizzledInstanceMethodWithClass:cls originalSelector:@selector(initWithObjects:forKeys:count:) swizzledSelector:@selector(jp_initWithObjects:forKeys:count:)];
        
    });
}

- (instancetype)jp_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
 
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (obj == nil || key == nil) {
            NSString *errorString = [NSString stringWithFormat:@"Crash⚠️ - initWithObjects:forKeys:count: attempt to insert nil object from objects[%zd]", i];
            #ifdef DEBUG
            NSAssert((obj != nil && key != nil), errorString);
            #else
            NSLog(@"%@", errorString);
            return [NSDictionary dictionary];
            #endif
        }
    }
    return [self jp_initWithObjects:objects forKeys:keys count:cnt];
}

@end
