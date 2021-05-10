//
//  NSMutableArray+CrashGuard.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "NSMutableArray+JPCrashGuard.h"
#import "NSObject+JPSwizzledMethod.h"

@implementation NSMutableArray (JPCrashGuard)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSArrayM");
        [NSObject jp_swizzledInstanceMethodWithClass:cls originalSelector:@selector(insertObject:atIndex:) swizzledSelector:@selector(jp_insertObject:atIndex:)];
        [NSObject jp_swizzledInstanceMethodWithClass:[NSMutableArray class] originalSelector:@selector(insertObjects:atIndexes:) swizzledSelector:@selector(jp_insertObjects:atIndexes:)];
        [NSObject jp_swizzledInstanceMethodWithClass:cls originalSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(jp_objectAtIndexedSubscript:)];
        [NSObject jp_swizzledInstanceMethodWithClass:cls originalSelector:@selector(objectAtIndex:) swizzledSelector:@selector(jp_objectAtIndex:)];
    });
}

- (void)jp_insertObject:(id)anObject atIndex:(NSUInteger)index {

    if (!anObject) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - insertObject️: object cannot be nil (index: %zd)", index];
        #ifdef DEBUG
        NSAssert(anObject != nil, errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }
    
    if (index > self.count) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - insertObject️: index %zd beyond bounds [0 .. %zd]", index, self.count-1];
        if (self.count == 0) {
            errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - insertObject️: index %zd beyond bounds for empty array", index];
        }
        #ifdef DEBUG
        NSAssert(index <= self.count, errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }

    [self jp_insertObject:anObject atIndex:index];
}


- (void)jp_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
 
    if (objects.count != indexes.count) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - insertObjects: count of array (%zd) differs from count of index set (%zd)", objects.count, indexes.count];
        #ifdef DEBUG
        NSAssert(objects.count == indexes.count, errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }
    
    if (indexes.lastIndex >= (self.count + indexes.count)) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - insertObjects: index %zd in index set beyond bounds [0 .. %zd]", indexes.lastIndex, indexes.count+self.count-1];
        if (self.count == 0) {
            errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectAtIndex: index %zd beyond bounds for empty array", indexes.lastIndex];
        }
        #ifdef DEBUG
        NSAssert(indexes.lastIndex < (self.count + indexes.count), errorString);
        #else
        NSLog(@"%@", errorString);
        return;
        #endif
    }

    
    [self jp_insertObjects:objects atIndexes:indexes];
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
        NSLog(@"%@", errorString);
        return [NSNull null];
        #endif
    }
    
    return [self jp_objectAtIndex:index];
}

- (id)jp_objectAtIndexedSubscript:(NSUInteger)idx {

    if (idx >= self.count) {
        NSString *errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectAtIndexedSubscript: index %zd beyond bounds [0 .. %zd]", idx, self.count-1];
        if (self.count == 0) {
            errorString = [NSString stringWithFormat:@"CrashGuard⚠️ - objectAtIndexedSubscript: index %zd beyond bounds for empty array", idx];
        }
        #ifdef DEBUG
        NSAssert(idx < self.count, errorString);
        #else
        NSLog(@"%@", errorString);
        return [NSNull null];
        #endif
    }

    return [self jp_objectAtIndexedSubscript:idx];
}


@end
