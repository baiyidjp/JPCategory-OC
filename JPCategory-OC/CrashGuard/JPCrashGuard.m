//
//  JPCrashGuard.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/8/19.
//

#import "JPCrashGuard.h"

@implementation JPCrashGuard

+ (instancetype)sharedInstance {
    
    static JPCrashGuard *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [JPCrashGuard sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (void)jp_startCrashGuard {
    
    [self _startArrayCrashGuard];
    [self _startDictionaryCrashGuard];
}

- (void)jp_startCrashGuard:(JPCrashGuardType)type {
    
    switch (type) {
        case JPCrashGuardType_All:
            [self jp_startCrashGuard];
            break;
        case JPCrashGuardType_Array:
            [self _startArrayCrashGuard];
            break;
        case JPCrashGuardType_Dictionary:
            [self _startDictionaryCrashGuard];
            break;
        default:
            break;
    }
}

- (void)_startArrayCrashGuard {
 
    [NSArray jp_startCrashGuard];
    [NSMutableArray jp_startCrashGuard];
}

- (void)_startDictionaryCrashGuard {
 
    [NSDictionary jp_startCrashGuard];
    [NSMutableDictionary jp_startCrashGuard];
}


@end
