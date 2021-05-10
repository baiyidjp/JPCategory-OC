//
//  NSArray+CrashGuard.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "NSArray+JPCrashGuard.h"
#import "NSObject+JPSwizzledMethod.h"

@implementation NSArray (JPCrashGuard)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject jp_swizzledInstanceMethodWithClass:[NSArray class] originalSelector:@selector(objectsAtIndexes:) swizzledSelector:@selector(jp_objectsAtIndexes:)];
    });
}

- (NSArray *)jp_objectsAtIndexes:(NSIndexSet *)indexes {
    
    if (indexes.lastIndex >= (self.count + indexes.count)) {
        NSString *errorString = [NSString stringWithFormat:@"Crash⚠️ - objectsAtIndexes: index %zd in index set beyond bounds [0 .. %zd]", indexes.lastIndex, indexes.count+self.count-1];
        if (self.count == 0) {
            errorString = [NSString stringWithFormat:@"Crash⚠️ - objectAtIndex: index %zd beyond bounds for empty array", indexes.lastIndex];
        }
        #ifdef DEBUG
        NSAssert(indexes.lastIndex < (self.count + indexes.count), errorString);
        #else
        NSLog(@"%@", errorString);
        return @[];
        #endif
    }

    
    return [self jp_objectsAtIndexes:indexes];
}

@end
