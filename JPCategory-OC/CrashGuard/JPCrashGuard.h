//
//  JPCrashGuard.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/8/19.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+JPCrashGuard.h"
#import "NSArray+JPCrashGuard.h"
#import "NSMutableDictionary+JPCrashGuard.h"
#import "NSDictionary+JPCrashGuard.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *JPCrashGuard_Array_NotificationName = @"JPCrashGuard_Array_NotificationName";
static NSString *JPCrashGuard_Dictionary_NotificationName = @"JPCrashGuard_Dictionary_NotificationName";

typedef NS_ENUM(NSUInteger, JPCrashGuardType) {
    JPCrashGuardType_None,
    JPCrashGuardType_Array,
    JPCrashGuardType_Dictionary,
    JPCrashGuardType_All
};

@interface JPCrashGuard : NSObject<NSCopying>

/// 单例
+ (instancetype)sharedInstance;

/// 开启所有的防护
- (void)jp_startCrashGuard;

/// 开启一个防护
/// @param type 防护的类型
- (void)jp_startCrashGuard:(JPCrashGuardType)type;

@end

NS_ASSUME_NONNULL_END
