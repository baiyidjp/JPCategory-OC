//
//  NSMutableDictionary+CrashGuard.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "NSMutableDictionary+JPCrashGuard.h"
#import "NSObject+JPSwizzledMethod.h"

@implementation NSMutableDictionary (JPCrashGuard)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Class cls = NSClassFromString(@"__NSDictionaryM");
        [NSObject jp_swizzledInstanceMethodWithClass:cls originalSelector:@selector(setObject:forKey:) swizzledSelector:@selector(jp_setObject:forKey:)];
        [NSObject jp_swizzledInstanceMethodWithClass:cls originalSelector:@selector(setObject:forKeyedSubscript:) swizzledSelector:@selector(jp_setObject:forKeyedSubscript:)];

        Class cls2 = NSClassFromString(@"__NSDictionaryI");
        [NSObject jp_swizzledInstanceMethodWithClass:cls2 originalSelector:@selector(objectForKeyedSubscript:) swizzledSelector:@selector(jp_objectForKeyedSubscript:)];
    });
}

- (void)jp_setObject:(id)anObject forKey:(id <NSCopying>)aKey {

    if (aKey == nil) {
        NSString *errorString = @"CrashGuard⚠️ - setObject:forKey: key cannot be nil";
        #ifdef DEBUG
        NSAssert(aKey != nil, errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }
    
    if (anObject == nil) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - setObject:forKey: object cannot be nil (key: %@)", aKey];
        #ifdef DEBUG
        NSAssert(anObject != nil, errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }

    [self jp_setObject:anObject forKey:aKey];
}

- (void)jp_setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    
    if (key == nil) {
        NSString *errorString = @"CrashGuard⚠️ - setObject:forKeyedSubscript: key cannot be nil";
        #ifdef DEBUG
        NSAssert(key != nil, errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }

    [self jp_setObject:obj forKeyedSubscript:key];
}

- (id)jp_objectForKeyedSubscript:(id)key {
    
    if (key == nil) {
        NSString *errorString = @"CrashGuard⚠️ - objectForKeyedSubscript: key cannot be nil";
        #ifdef DEBUG
        NSAssert(key != nil, errorString);
        #else
        NSLog(@"%@", errorString);
        return [NSNull null];
        #endif
    }

    return [self jp_objectForKeyedSubscript:key];
}

@end
