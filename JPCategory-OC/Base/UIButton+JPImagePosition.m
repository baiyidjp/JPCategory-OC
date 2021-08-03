//
//  UIButton+JPImagePosition.m
//  JPButtonCategoryDemo
//
//  Created by baiyidjp on 2020/12/18.
//

#import "UIButton+JPImagePosition.h"
#import <objc/runtime.h>

#define TitleKeyPath @"titleLabel.text"
#define TitleAttributedTextPath @"titleLabel.attributedText"
#define ImageKeyPath @"imageView.image"

@implementation UIButton (JPImagePosition)

- (void)setJp_observed:(BOOL)jp_observed {
 
    objc_setAssociatedObject(self, @selector(jp_observed), @(jp_observed), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)jp_observed {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setJp_position:(JPButtonImagePosition)jp_position {
    
    objc_setAssociatedObject(self, @selector(jp_position), @(jp_position), OBJC_ASSOCIATION_ASSIGN);
}

- (JPButtonImagePosition)jp_position {
    
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setJp_margin:(CGFloat)jp_margin {
 
    objc_setAssociatedObject(self, @selector(jp_margin), @(jp_margin), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)jp_margin {
    
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setJp_autoMargin:(JPButtonImageAutoMargin)jp_autoMargin {
    
    objc_setAssociatedObject(self, @selector(jp_autoMargin), @(jp_autoMargin), OBJC_ASSOCIATION_ASSIGN);
}

- (JPButtonImageAutoMargin)jp_autoMargin {
    
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)jp_buttonImagePosition {

    JPButtonImagePosition position = self.jp_position;
    if (position == JPButtonImagePosition_None) {
        position = JPButtonImagePosition_Left;
    }
    CGFloat margin = self.jp_margin;
    if (margin == 0) {
        margin = 8;
    }
    JPButtonImageAutoMargin autoMargin = self.jp_autoMargin;
    if (autoMargin == JPButtonImageAutoMargin_None) {
        autoMargin = JPButtonImageAutoMargin_YES;
    }
    
    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePosition:(JPButtonImagePosition)position {

    CGFloat margin = self.jp_margin;
    if (margin == 0) {
        margin = 8;
    }
    JPButtonImageAutoMargin autoMargin = self.jp_autoMargin;
    if (autoMargin == JPButtonImageAutoMargin_None) {
        autoMargin = JPButtonImageAutoMargin_YES;
    }
    
    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePositionWithMargin:(CGFloat)margin {

    JPButtonImagePosition position = self.jp_position;
    if (position == JPButtonImagePosition_None) {
        position = JPButtonImagePosition_Left;
    }
    JPButtonImageAutoMargin autoMargin = self.jp_autoMargin;
    if (autoMargin == JPButtonImageAutoMargin_None) {
        autoMargin = JPButtonImageAutoMargin_YES;
    }
    
    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePositionWithAutoMargin:(JPButtonImageAutoMargin)autoMargin {

    JPButtonImagePosition position = self.jp_position;
    if (position == JPButtonImagePosition_None) {
        position = JPButtonImagePosition_Left;
    }
    CGFloat margin = self.jp_margin;
    if (margin == 0) {
        margin = 8;
    }
    
    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin {

    JPButtonImageAutoMargin autoMargin = self.jp_autoMargin;
    if (autoMargin == JPButtonImageAutoMargin_None) {
        autoMargin = JPButtonImageAutoMargin_YES;
    }
    
    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePosition:(JPButtonImagePosition)position autoMargin:(JPButtonImageAutoMargin)autoMargin {

    CGFloat margin = self.jp_margin;
    if (margin == 0) {
        margin = 8;
    }
    
    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePositionWithMargin:(CGFloat)margin autoMargin:(JPButtonImageAutoMargin)autoMargin {

    JPButtonImagePosition position = self.jp_position;
    if (position == JPButtonImagePosition_None) {
        position = JPButtonImagePosition_Left;
    }

    [self jp_buttonImagePosition:position margin:margin autoMargin:autoMargin];
}

- (void)jp_buttonImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(JPButtonImageAutoMargin)autoMargin {

    NSAssert((self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft || self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentCenter || self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight), @"UIButton+JPImagePosition水平对齐只支持: Left & Center & Right");
    NSAssert((self.contentVerticalAlignment == UIControlContentVerticalAlignmentTop || self.contentVerticalAlignment == UIControlContentVerticalAlignmentCenter || self.contentVerticalAlignment == UIControlContentVerticalAlignmentBottom), @"UIButton+JPImagePosition垂直对齐只支持: Top & Center & Bottom");

    self.jp_position = position;
    self.jp_margin = margin;
    self.jp_autoMargin = autoMargin;

    CGFloat buttonWidth = self.frame.size.width;
    CGFloat buttonHeight = self.frame.size.height;
    
    CGFloat imageContentWidth = self.imageView.intrinsicContentSize.width;
    CGFloat imageContentHeight = self.imageView.intrinsicContentSize.height;
    CGFloat imageFrameWidth = self.imageView.frame.size.width;
    CGFloat imageFrameHeight = self.imageView.frame.size.height;
    
    CGFloat imageWidth = MAX(imageContentWidth, imageFrameWidth);
    CGFloat imageHeight = MAX(imageContentHeight, imageFrameHeight);
    
    CGFloat titleContentWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleContentHeight = self.titleLabel.intrinsicContentSize.height;
    CGFloat titleFrameWidth = self.titleLabel.frame.size.width;
    CGFloat titleFrameHeight = self.titleLabel.frame.size.height;
    
    CGFloat titleWidth = MAX(titleFrameWidth, titleContentWidth);
    CGFloat titleHeight = MAX(titleFrameHeight, titleContentHeight);
    
    UIEdgeInsets imageEdgeInsets = self.imageEdgeInsets;
    UIEdgeInsets titleEdgeInsets = self.titleEdgeInsets;
    
    UIControlContentHorizontalAlignment horizontalAlignment = self.contentHorizontalAlignment;
    UIControlContentVerticalAlignment verticalAlignment = self.contentVerticalAlignment;

    // 是否自动适配间距
    BOOL isAutoMargin = (autoMargin == JPButtonImageAutoMargin_YES);
    // 水平实际的间距
    CGFloat horizontalMargin = margin;
    // 是否需要扩充
    BOOL isWidthNeedExtendEdge = NO;
    BOOL isHeightNeedExtendEdge = NO;
    // 如果加上间距后总宽度大于按钮的宽度,宽度扩容
    if (imageWidth + titleWidth + margin > buttonWidth && isAutoMargin) {
        isWidthNeedExtendEdge = YES;
    }
    // 垂直实际的间距
    CGFloat verticalMargin = margin;
    // 如果加上间距后总高度大于按钮的高度,高度扩容
    if (imageHeight + titleHeight + margin > buttonHeight && isAutoMargin) {
        isHeightNeedExtendEdge = YES;
    }
    
    // 水平居中
    if (horizontalAlignment == UIControlContentHorizontalAlignmentCenter) {
        
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, -horizontalMargin*0.5, 0, horizontalMargin*0.5);
            titleEdgeInsets = UIEdgeInsetsMake(0, horizontalMargin*0.5, 0, -horizontalMargin*0.5);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth+horizontalMargin;
                self.frame = frame;
            }
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+horizontalMargin*0.5, 0, -(titleWidth+horizontalMargin*0.5));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth+horizontalMargin*0.5), 0, imageWidth+horizontalMargin*0.5);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth+horizontalMargin;
                self.frame = frame;
            }
        }
        
        // 垂直居中
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5, verticalCenter-imageHeight*0.5, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth*0.5, titleHeight*0.5-verticalCenter, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth, titleHeight*0.5-verticalCenter, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, buttonWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, 0, verticalCenter-imageHeight*0.5, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5, imageHeight*0.5-verticalCenter, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth*0.5, verticalCenter-titleHeight*0.5, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth, verticalCenter-titleHeight*0.5, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, buttonWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, 0, imageHeight*0.5-verticalCenter, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
        
        // 垂直居上
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {

            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5, 0, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth*0.5, -(imageHeight+verticalMargin), imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth, -(imageHeight+verticalMargin), 0);
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5, -(titleHeight+verticalMargin), -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth*0.5, 0, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, buttonWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, 0, -(titleHeight+verticalMargin), 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
        
        // 垂直居下
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {

            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5, titleHeight+verticalMargin, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth*0.5, 0, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), buttonWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), 0, titleHeight+verticalMargin, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth*0.5, imageHeight+verticalMargin, imageWidth*0.5);
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5, 0, -titleWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth, imageHeight+verticalMargin, 0);
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }

            }
        }
    }
    
    // 水平居左
    if (horizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            titleEdgeInsets = UIEdgeInsetsMake(0, horizontalMargin, 0, -horizontalMargin);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth+horizontalMargin;
                self.frame = frame;
            }
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+horizontalMargin, 0, -(titleWidth+horizontalMargin));
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth+horizontalMargin;
                self.frame = frame;
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth, titleHeight*0.5-verticalCenter, imageWidth);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth, titleHeight*0.5-verticalCenter, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, buttonWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, 0, verticalCenter-imageHeight*0.5, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth, verticalCenter-titleHeight*0.5, imageWidth);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth, verticalCenter-titleHeight*0.5, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, buttonWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, 0, imageHeight*0.5-verticalCenter, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth, -(imageHeight+verticalMargin), imageWidth);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth, -(imageHeight+verticalMargin), 0);
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, buttonWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, 0, -(titleHeight+verticalMargin), 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), buttonWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), 0, titleHeight+verticalMargin, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth, imageHeight+verticalMargin, imageWidth);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth, imageHeight+verticalMargin, 0);
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
    }
    
    // 水平居右
    if (horizontalAlignment == UIControlContentHorizontalAlignmentRight) {
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, -horizontalMargin, 0, horizontalMargin);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth+horizontalMargin;
                self.frame = frame;
            }
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth+horizontalMargin), 0, imageWidth+horizontalMargin);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth+horizontalMargin;
                self.frame = frame;
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5+imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, 0, titleHeight*0.5-verticalCenter, 0);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth, titleHeight*0.5-verticalCenter, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, buttonWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, 0, verticalCenter-imageHeight*0.5, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5+imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, 0, verticalCenter-titleHeight*0.5, 0);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth, verticalCenter-titleHeight*0.5, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, buttonWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, 0, imageHeight*0.5-verticalCenter, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5+imageWidth*0.5, 0, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, 0, -(imageHeight+verticalMargin), 0);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth, -(imageHeight+verticalMargin), 0);
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5+imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5+imageWidth*0.5));
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, buttonWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, 0, -(titleHeight+verticalMargin), 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5, titleHeight+verticalMargin, -titleWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), buttonWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), 0, titleHeight+verticalMargin, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5+imageWidth*0.5, 0, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), 0, imageHeight+verticalMargin, 0);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth, imageHeight+verticalMargin, 0);
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight+verticalMargin;
                    self.frame = frame;
                }
            }
        }

    }
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;

    if (!self.jp_observed) {
        self.jp_observed = YES;
        [self addObserver:self forKeyPath:TitleKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:TitleAttributedTextPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:ImageKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:TitleKeyPath]) {
        NSString *new = change[NSKeyValueChangeNewKey];
        NSString *old = change[NSKeyValueChangeOldKey];
        if (new == nil && old != nil) {
            [self jp_buttonImagePosition];
        }
        if (new != nil && ![new isEqual:old]) {
            [self jp_buttonImagePosition];
        }
    }
    
    if ([keyPath isEqualToString:TitleAttributedTextPath]) {
        NSAttributedString *new = change[NSKeyValueChangeNewKey];
        NSAttributedString *old = change[NSKeyValueChangeOldKey];
        if (new == nil && old != nil) {
            [self jp_buttonImagePosition];
        }
        if (new != nil && ![new isEqual:old]) {
            [self jp_buttonImagePosition];
        }
    }
    
    if ([keyPath isEqualToString:ImageKeyPath]) {
        UIImage *new = change[NSKeyValueChangeNewKey];
        UIImage *old = change[NSKeyValueChangeOldKey];
        if (new == nil && old != nil) {
            [self jp_buttonImagePosition];
        }
        if (new != nil && ![new isEqual:old]) {
            [self jp_buttonImagePosition];
        }
    }
}

- (void)dealloc {

    if (self.jp_observed) {
        [self removeObserver:self forKeyPath:TitleKeyPath context:nil];
        [self removeObserver:self forKeyPath:TitleAttributedTextPath context:nil];
        [self removeObserver:self forKeyPath:ImageKeyPath context:nil];
    }
}

@end
