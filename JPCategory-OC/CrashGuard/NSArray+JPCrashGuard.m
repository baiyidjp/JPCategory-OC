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
        Class cls1 = NSClassFromString(@"__NSSingleObjectArrayI");
        if (cls1) {
            [NSObject jp_swizzledInstanceMethodWithClass:cls1 originalSelector:@selector(objectAtIndex:) swizzledSelector:@selector(jp_objectAtIndex:)];            
        }
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

- (id)jp_objectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectAtIndex: index %zd beyond bounds [0 .. %zd]", index, self.count-1];
        if (self.count == 0) {
            errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectAtIndex: index %zd beyond bounds for empty array", index];
        }
        #ifdef DEBUG
        NSAssert(index < self.count, errorString);
        #else
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"JPCrashGuard_Array_NotificationName" object:nil userInfo:@{@"crashInfo": errorString}];
        });
        return [NSNull null];
        #endif
    }
    
    return [self jp_objectAtIndex:index];
}

@end
