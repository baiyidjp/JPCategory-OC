//
//  NSMutableDictionary+CrashGuard.h
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (JPCrashGuard)

+ (void)jp_startCrashGuard;

@end

NS_ASSUME_NONNULL_END
