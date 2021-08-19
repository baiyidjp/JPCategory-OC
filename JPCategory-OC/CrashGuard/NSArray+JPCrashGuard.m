//
//  NSArray+CrashGuard.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "NSArray+JPCrashGuard.h"
#import "NSObject+JPSwizzledMethod.h"

@implementation NSArray (JPCrashGuard)

+ (void)jp_startCrashGuard {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject jp_swizzledInstanceMethodWithClass:[NSArray class] originalSelector:@selector(objectsAtIndexes:) swizzledSelector:@selector(jp_objectsAtIndexes:)];
    });
}

- (NSArray *)jp_objectsAtIndexes:(NSIndexSet *)indexes {
    
    if (indexes.count > 0 && indexes.lastIndex >= self.count) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectsAtIndexes: index %zd in index set beyond bounds [0 .. %zd]", indexes.lastIndex, indexes.count+self.count-1];
        if (self.count == 0) {
            errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectAtIndex: index %zd beyond bounds for empty array", indexes.lastIndex];
        }
        #ifdef DEBUG
        NSAssert(indexes.lastIndex < self.count, errorString);
        #else
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"JPCrashGuard_Array_NotificationName" object:nil userInfo:@{@"crashInfo": errorString}];
        });
        return @[];
        #endif
    }

    
    return [self jp_objectsAtIndexes:indexes];
}

@end
