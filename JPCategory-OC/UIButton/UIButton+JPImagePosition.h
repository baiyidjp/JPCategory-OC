//
//  UIButton+JPImagePosition.h
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JPButtonImagePosition) {
    JPButtonImagePosition_Top,
    JPButtonImagePosition_Left,
    JPButtonImagePosition_Bottom,
    JPButtonImagePosition_Right
};

@interface UIButton (JPImagePosition)

- (void)setImagePosition;

- (void)setImagePositionAutoMargin:(BOOL)autoMargin;

- (void)setImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin;

- (void)setImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(BOOL)autoMargin;

@end

NS_ASSUME_NONNULL_END
