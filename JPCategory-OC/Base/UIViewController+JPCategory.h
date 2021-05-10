//
//  UIViewController+JPCategory.h
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JPRouteCompletion)(id data);

@interface UIViewController (JPCategory)

/** jp_parameters */
@property(nonatomic,strong) NSDictionary *jp_parameters;

/** jp_routeCompletion */
@property(nonatomic,copy) JPRouteCompletion jp_routeCompletion;

@end

NS_ASSUME_NONNULL_END
