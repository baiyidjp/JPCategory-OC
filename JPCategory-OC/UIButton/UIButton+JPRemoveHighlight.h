//
//  UIButton+JPRemoveHighlight.h
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JPRemoveHighlight)

/**
 *如果指定为YES,那么Button的高亮效果就移除
 */
@property(nonatomic, assign) BOOL jp_removeHighlightState;

@end

NS_ASSUME_NONNULL_END
