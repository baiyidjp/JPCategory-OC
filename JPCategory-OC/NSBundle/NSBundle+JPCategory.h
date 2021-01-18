//
//  NSBundle+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (JPCategory)

/**
 * 设置当前App的本地语言
 * @param language
 */
+ (void)jp_setLocalLanguage:(NSString *)language;

@end

NS_ASSUME_NONNULL_END
