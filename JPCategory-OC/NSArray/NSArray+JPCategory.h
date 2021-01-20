//
//  NSArray+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable (^JPNSArrayMapComplete)(id obj);
typedef BOOL(^JPNSArrayFilterComplete)(id obj);

@interface NSArray (JPCategory)

/**
 * map 一个数组
 * @param mapComplete
 * @return 数组
 */
- (NSArray *)jp_map:(JPNSArrayMapComplete)mapComplete;

/**
 * filter 数组
 * @param filterComplete
 * @return 数组
 */
- (NSArray *)jp_filter:(JPNSArrayFilterComplete)filterComplete;

/**
 * 数组倒序排列
 * @return 数组
 */
- (NSArray *)jp_reversedArray;

@end

NS_ASSUME_NONNULL_END
